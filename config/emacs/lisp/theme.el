;;; theme.el -*- lexical-binding: t -*-
;;; Commentary:
;; Change theme to catppuccin

(use-package catppuccin-theme
  :init
  (setq catppuccin-flavor 'mocha)
  (setq catppuccin-height-title-1 1.5)
  (setq catppuccin-enable-italic t)
  (setq catppuccin-enable-bold t)
  
  :config
  (load-theme 'catppuccin :no-confirm))

(use-package nerd-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 35)    
  (doom-modeline-bar-width 4)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  
  (doom-modeline-font-family tz/font-face)
  
  (doom-modeline-modal-icon t)
  (doom-modeline-modal-modern-icon t)
  
  (doom-modeline-buffer-file-name-style 'truncate-with-project)
  (doom-modeline-enable-word-count nil)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-indent-info t))

(provide 'theme)
