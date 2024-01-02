(defvar elpaca-installer-version 0.6)

(defvar elpaca-directory "~/.cache/emacs/elpaca")
(defvar elpaca-builds-directory "~/.cache/emacs/builds")
(defvar elpaca-repos-directory "~/.cache/emacs/repos")
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (call-process "git" nil buffer t "clone"
                                       (plist-get order :repo) repo)))
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
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Install use-package support
(elpaca elpaca-use-package
  ;; Enable :elpaca use-package keyword.
  (elpaca-use-package-mode)
  ;; Assume :elpaca t unless otherwise specified.
  (setq elpaca-use-package-by-default t))

;; Block until current queue processed.
(elpaca-wait)

;; Setting font face
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono" :height 140 :weight 'regular)
(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil :slant 'italic)

;; Kanagawa Theme
(use-package kanagawa-theme
  :init
  (setq kanagawa-theme-comment-italic t
	kanagawa-theme-keyword-italic t
	kanagawa-theme-underline-parens t)
  :config
  (load-theme 'kanagawa t))

;; Load EVIL
(use-package evil
  :init
  (setq evil-want-integrtion t
	evil-want-keybindings nil
	evil-split-window-below t
	evil-vsplit-window-right t)
  :config
  (evil-mode))
(use-package evil-collection
  :after evil
  :init
  (add-to-list 'evil-collection-mode-list 'help)
  :config
  (evil-collection-init))

;; Enable Company
(use-package company
  :init
  (setq company-begin-commands '(self-insert-command)
	company-idle-delay .1
	company-minimum-prefix-length 1
	company-show-numbers nil
	company-tooltip-align-annotations t
	company-tooltip-flip-when-above t
	company-tooltip-margin 1
	company-format-margin-function #'company-text-icons-margin)
  :config
  (global-company-mode))
(use-package company-box
  :after company
  :init
  (setq company-box-scrollbar nil
	company-box-doc-delay .1
	company-box-doc-frame-parameters '((internal-border-width . 1)))
  :hook
  (company-mode . company-box-mode))

;; Load treesitter
(use-package treesit
  :elpaca nil
  :custom
  (treesit-font-lock-level 4))
(use-package treesit-auto
  :after treesit
  (treesit-auto-install 'prompt)
  :config
  (global-treesit-auto-mode))

;; Doom modeline
(use-package doom-modeline
  :init
  (setq inhibit-compacting-font-caches t)
  :config
  (doom-modeline-mode))

;; Gitgutter
(use-package magit)
(use-package git-gutter
  :config
  (global-git-gutter-mode)
  (custom-set-variables
   '(git-gutter:window-width 1)
   '(git-gutter:modified-sign "░")
   '(git-gutter:added-sign "░")
   '(git-gutter:deleted-sign "░")))

;; Projectile
(use-package projectile
  :config
  (projectile-mode))

;; Dashboard
(use-package dashboard
  :init
  (setq dashboard-set-heading-icons t
	dashboard-set-file-icons t
	dashboard-banner-logo-title "Let's start hacking!"
	dashboard-startup-banner 'logo
	dashboard-center-content t
	dashboard-items '((recents . 5)
			  (agenda . 5)
			  (projects . 3)
			  (registers . 3)
			  (bookmarks . 3)))
  :config
  (dashboard-setup-startup-hook))

;; Org mode
(use-package org
  :init
  (setq org-directory "~/Org"
	org-agenda-files '("~/Org")
	org-src-fontify-natively t
	org-pretty-entities t
	org-log-done 'time
	org-log-reschedule t
	org-default-notes-file (concat org-directory "notes.org")
	org-return-follows-link t
	org-hide-emphasis-markers t)
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook 'visual-line-mode)
  :config
  (org-babel-do-load-languages 'org-babel-load-languages
			       '((emacs-lisp . t)
				 (C . t))))
;; General
(use-package general
  :config
  (general-evil-setup)

  ;; Space as global key
  (general-crete-definer tzero/leader-keys
			 :status '(normal insert visual emacs)
			 :keymaps 'override
			 :prefix "SPC"
			 :global-prefix "M-SPC")

  (tzero/leader-keys
   "SPC" '(counsel-M-x :wk "Counsel M-x")
   "TAB TAB" '(comment-line :wk "Comment line"))

  ;; Projectile
  (tzero/leader-keys
   "p" '(projectile-command-map :wk "Projectile"))

  ;; Open "modes"
  (tzero/leader-keys
   "m" '(:ignore t :wk "Open")
   "m d" '(dashboard-open :wk "Dashboard"))

  ;; Agenda
  (tzero/leader-keys
   "o" '(:ignore t :wk "Org")
   "o a" '(org-agenda :wk "Org agenda")
   "o e" '(org-export-dispatch :wk "Org export dispatch")
   "o i" '(org-toggle-item :wk "Org toggle item")
   "o t" '(org-todo :wk "Org todo")
   "o B" '(org-babel-tangle :wk "Org babel tangle")
   "o T" '(org-todo-list :wk "Org todo list")))
