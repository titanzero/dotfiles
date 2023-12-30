(setq package-enable-at-startup nil
      gc-cons-threshold 100000000
      read-process-output-max (* 1024 1024)
      load-prefer-newer t
      window-resize-pixelwise t
      frame-resize-pixelwise t
      savehist-file "~/.cache/emacs/history"
      recentf-save-file "~/.cache/emacs/recentf"
      save-place-file "~/.cache/emacs/places"
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      backup-directory-alist '(("." . "~/.cache/emacs/backup"))
      custom-file (expand-file-name "custom.el" user-emacs-directory)
      warning-minimum-level :emergency
      inhibit-startup-screen t
      ring-bell-function #'ignore
      visible-bell t
      use-short-answers t
      confirm-kill-emacs #'y-or-n-p)

(electric-pair-mode t)
(show-paren-mode t)
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
