;;; settings.el -*- lexical-binding: t -*-
;;; Commentary:
;; Basic configurations for emacs

;; Custom file - keep custom-set-variables out of init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file 'noerror 'nomessage))

;; Encoding UTF-8
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Basic behavior
(setq-default
 indent-tabs-mode nil           ; Use spaces instead of tabs
 tab-width 2                    ; 2 spaces for indentation
 fill-column 80                 ; Wrap at 80 characters
 sentence-end-double-space nil  ; Single space after period
 require-final-newline t)       ; Final newline in files

;; Clean UI
(setq ring-bell-function 'ignore         ; Disable beep
      use-dialog-box nil                 ; No graphical dialog boxes
      cursor-in-non-selected-windows nil ; Cursor only in active window
      visible-bell nil)

;; Organized backup and autosave
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory)))
      auto-save-file-name-transforms `((".*" ,(expand-file-name "auto-saves/" user-emacs-directory) t))
      create-lockfiles nil)

;; Scroll smooth
(setq scroll-margin 3
      scroll-conservatively 101
      scroll-preserve-screen-position t)

;; Show line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; Highlight current line
(global-hl-line-mode 1)

;; Show matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Automatic save
(auto-save-visited-mode 1)
(setq auto-save-visited-interval 5)

;; Auto-revert externally modified files
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)

;; Recent files
(recentf-mode 1)
(setq recentf-max-saved-items 100)

;; Abbreviations
(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)

;; Faces
(set-face-attribute 'default nil :font tz/font-face :height tz/font-size)

;; On windows use directwrite
(when (eq system-type 'windows-nt)
  (setq w32-use-directwrite-for-renderer t)
  (tz/setup-emoji-font))

;; Scratch Buffer settings
(setq initial-scratch-message nil)       ; Make the *scratch* buffer empty
(setq initial-major-mode 'text-mode)     ; Use text-mode instead of lisp-interaction-mode

(provide 'settings)
