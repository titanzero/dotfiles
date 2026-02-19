;;; functions.el -*- lexical-binding: t -*-
;;; Commentary:
;; Functions and variables for emacs configuration

;;; Variables:
(defvar tz/is-mac (eq system-type 'darwin)
  "Define if current OS is macOS or no (usually windows for work)")

(defvar tz/novels-directory (expand-file-name (if tz/is-mac
                                                  "~/Cloud/Writing/Aeter"
                                                "~/Nextcloud/Writing/Aeter"))
  "Main folder for novels.")

(defvar tz/font-face (if tz/is-mac
                       "IoskeleyMono Nerd Font Mono"
                       "IoskeleyMono Nerd Font")
  "Define current font for system")

(defvar tz/font-size (if tz/is-mac
                         140
                       110)
  "Define the font face size for current system")

;;; Functions
(defun tz/set-italian-dictionary ()
  "Set Italian dictionary."
  (interactive)
  (ispell-change-dictionary "italiano"))

(defun tz/set-english-dictionary ()
  "Set English dictionary."
  (interactive)
  (ispell-change-dictionary "english"))

(defun tz/reload-config ()
  "Reload emacs configuration."
  (interactive)
  (load-file user-init-file)
  (message "✅ Configuration reloaded!"))

(defun tz/setup-emoji-font ()
  (let ((font "Segoe UI Emoji")) 
    (set-fontset-font t 'symbol (font-spec :family font) nil 'prepend)
    (set-fontset-font t 'emoji  (font-spec :family font) nil 'prepend)))

(defun tz/copy-file-path ()
  "Copy the current buffer's file path to the kill ring."
  (interactive)
  (when-let ((path (buffer-file-name)))
    (kill-new path)
    (message "📋 Copied: %s" path)))

(provide 'functions)
