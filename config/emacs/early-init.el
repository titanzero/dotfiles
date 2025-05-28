;; Temporarly set gc to 100mb
(setq gc-cons-threshold 1000000000)
(run-with-idle-timer
 5 nil
 (lambda ()
   (setq-default gc-cons-threshold (* 1024 1024 100))
   (message "gc-cons-threshold restored to %S"
            gc-cons-threshold)))

;; Disable bytecompiler warnings
(setq native-comp-deferred-compilation-deny-list '())
(setq native-comp-async-report-warnings-errors nil)

;; Load customization file
(setq custom-file (expand-file-name "customs.el" user-emacs-directory))

(add-hook 'after-init-hook (lambda () (load custom-file 'noerror)))

;; Speed up a little more
(setq-default lexical-binding t
              load-prefer-newer t)

;; Some infos
(setq-default user-full-name "Nicola Leonardi"
              user-mail-address "nicolaleonardi@outlook.com")

;; Some functions and vars
(defvar tz/os-linux-p (eq system-type 'gnu/linux))
(defvar tz/os-windows-p (eq system-type 'windows-nt))
(defvar tz/os-macos-p (eq system-type 'darwin))

(defvar tz/os-home (if tz/os-windows-p
		       user-emacs-directory
		     "~/.dotfiles/config/emacs"))

(defun tz/tangle-dotfiles ()
  "If the current file is this file, the code blocks are tangled"
  (interactive)
  (when (equal (buffer-file-name)
	       (expand-file-name "README.org" tz/os-home))
    (org-babel-tangle '() (expand-file-name "init.el" tz/os-home))))
(add-hook 'after-save-hook #'tz/tangle-dotfiles)

;; Some early config
(electric-pair-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(pixel-scroll-precision-mode 1)
(setq-default frame-title-format "%b (%f)")
(setq frame-resize-pixelwise 't)

(setq-default ;; makes killing/yanking interact with the clipboard
 select-enable-clipboard t

 ;; I'm actually not sure what this does but it's recommended?
 select-enable-primary t

 ;; Save clipboard strings into kill ring before replacing them.
 ;; When one selects something in another program to paste it into Emacs,
 ;; but kills something in Emacs before actually pasting it,
 ;; this selection is gone unless this variable is non-nil
 ;;save-interprogram-paste-before-kill nil ;; This is disabled because it crashes emacs.

 ;; Shows all options when running apropos. For more info,
 ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
 apropos-do-all t

 ;; Mouse yank commands yank at point instead of at click.
 mouse-yank-at-point t)

 (setq-default ring-bell-function 'ignore)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq-default create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq-default inhibit-startup-message t)

(setq bidi-inhibit-bpa t)

(setq-default read-process-output-max (* 1024 1024)) ;; 1mb

(global-display-line-numbers-mode)
(set-default 'display-line-numbers-type 't)
(set-default 'display-line-numbers-current-absolute 't)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
