;;; early-init.el --- Early initialization -*- lexical-binding: t -*-
;;; Commentary:
;; Optimizations for fast startup

;;; Code:

;; Disable package.el at startup
(setq package-enable-at-startup nil)

;; Optimize garbage collection during startup
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Restore after startup
(defun tz/restore-gc-settings ()
  "Restore garbage collection settings after startup."
  (setq gc-cons-threshold (* 64 1024 1024)
        gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook #'tz/restore-gc-settings)

;; Disable unnecessary UI elements
(setq frame-inhibit-implied-resize t
      frame-resize-pixelwise t)

;;(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Reduce visual noise
(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(provide 'early-init)
;;; early-init.el ends here
