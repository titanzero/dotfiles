(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))
;;(elpaca-no-symlink-mode)

;; Install use-package support
(elpaca elpaca-use-package
	;; Enable use-package :ensure support for Elpaca.
	(elpaca-use-package-mode))
(setq use-package-always-ensure t)

(use-package emacs
  :demand t
  :ensure nil
  :init
    (setq enable-recursive-minibuffers t)
    (setq backup-by-copying t)
    (setq sentence-end-double-space nil)
    (setq show-trailing-whitespace t) ;; self-explanatory 
    (defalias 'yes-or-no-p 'y-or-n-p) ;; life is too short
    (setq indent-tabs-mode nil) ;; no tabs
    ;; keep backup and save files in a dedicated directory
    (setq backup-directory-alist
          `((".*" . ,(concat user-emacs-directory "backups")))
          auto-save-file-name-transforms
          `((".*" ,(concat user-emacs-directory "backups") t)))
    (setq create-lockfiles nil) ;; no need to create lockfiles
    (set-charset-priority 'unicode) ;; utf8 everywhere
    (setq locale-coding-system 'utf-8
          coding-system-for-read 'utf-8
          coding-system-for-write 'utf-8)
    (set-terminal-coding-system 'utf-8)
    (set-keyboard-coding-system 'utf-8)
    (set-selection-coding-system 'utf-8)
    (prefer-coding-system 'utf-8)
    (setq default-process-coding-system '(utf-8-unix . utf-8-unix))
    (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
    (setq byte-compile-warnings '(not free-vars unresolved noruntime lexical make-local))
    (setq native-comp-async-report-warnings-errors nil)
    (setq load-prefer-newer t))

    ;;(add-to-list 'default-frame-alist '(width . 200))
    ;;(add-to-list 'default-frame-alist '(height . 80)))

(with-eval-after-load 'org
  (setq org-startup-indented t
	org-edit-tab-acts-natively t
	org-edit-src-content-indentation 0
	org-startup-folded 'show3levels
	org-fontify-done-headline t
	org-fontify-todo-headline t
	org-fontify-quote-and-verse-blocks t
	org-directory "~/Org")
  (add-hook 'org-mode-hook #'visual-line-mode))

(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package org-modern
  :after org
  :hook (org-mode . org-modern-mode))

(use-package toc-org
  :after org
  :hook (org-mode . toc-org-mode))

(use-package general
  :demand (:wait t)
  :config
  (general-evil-setup) ;; integrate general with evil

  ;; create a definer for leader key
  (general-create-definer tz/leader
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC" ;; set space as prefix
    :global-prefix "M-SPC")

  ;; create combo SPC SPC to trigger M-x, also known as : in evil
  (tz/leader
    "SPC" '(execute-extended-command :wk "Execute command"))

  ;; placeholder for namespace SPC h as help base
  (tz/leader
    "h" '(:ignore t :wk "Help"))

  ;; placeholder for fuzzy (mainly fzf)
  (tz/leader
    "f" '(:ignore t :wk "Fuzzy"))

;; define some commands for org mode
  (tz/leader
    "o" '(:ignore t :wk "Org")
    "oc" '(org-babel-demarcate-block :wk "Create source block")
    "oe" '(org-babel-execute-src-block :wk "Execute source block")))

(use-package which-key
  :after evil
  :demand t
  :init (which-key-mode)
  :config
  (which-key-setup-side-window-right))

(use-package catppuccin-theme
  :demand t
  :config
  (load-theme 'catppuccin t)
  (catppuccin-load-flavor 'mocha)
  (catppuccin-reload))

(let ((font-name (if tz/os-windows-p
		     "CaskaydiaCove NFM"
		   "CaskaydiaCove Nerd Font Mono"))
      (font-size (if tz/os-windows-p
		     120
		   145)))
  (set-face-attribute 'default nil
		      :family font-name
		      :height font-size
		      :weight 'light)
  (set-face-attribute 'fixed-pitch nil
		      :family font-name
		      :height font-size
		      :weight 'light))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package nerd-icons)

(use-package evil
  :init      ;; tweak evil's configuration before loading it
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  :config
  (evil-mode)
  (evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle))
(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-mode-list '(dashboard dired ibuffer))
  (evil-collection-init))
(use-package evil-tutor)
