;;; functions.el -*- lexical-binding: t -*-
;;; Commentary:
;; Variables, workspace management, and utility functions.

;;; Code:

;; ============================================================================
;; SYSTEM DETECTION
;; ============================================================================
(defvar tz/is-mac (eq system-type 'darwin)
  "Non-nil on macOS.")

;; ============================================================================
;; WRITING WORKSPACES
;; ============================================================================
(defvar tz/writing-root
  (expand-file-name (if tz/is-mac "~/Cloud/Writing" "~/Nextcloud/Writing"))
  "Root directory containing all writing workspaces (one subdir per project).")

(defvar tz/current-workspace nil
  "Currently active workspace as a (name . path) cons cell.
Set by `tz/workspace-picker'.")

(defun tz/discover-workspaces ()
  "Return an alist of (name . path) for all non-hidden subdirs of `tz/writing-root'."
  (when (file-directory-p tz/writing-root)
    (let ((entries (directory-files tz/writing-root t "^[^.]" t)))
      (mapcar (lambda (path) (cons (file-name-nondirectory path) path))
              (seq-filter #'file-directory-p entries)))))

(defun tz/workspace-root ()
  "Return the path of the current workspace, or `tz/writing-root' as fallback."
  (if tz/current-workspace
      (cdr tz/current-workspace)
    tz/writing-root))

(defun tz/workspace-open-index (path name)
  "Open index.org in PATH, creating it from template if missing."
  (let ((index (expand-file-name "index.org" path))
        (template (expand-file-name "templates/index.org" user-emacs-directory)))
    (unless (file-exists-p index)
      (if (file-exists-p template)
          (progn
            (copy-file template index)
            (with-temp-buffer
              (insert-file-contents index)
              (goto-char (point-min))
              (when (re-search-forward "^#\\+TITLE:[ \t]*$" nil t)
                (end-of-line) (insert " " name))
              (goto-char (point-min))
              (when (re-search-forward "^#\\+DATE:[ \t]*$" nil t)
                (end-of-line) (insert " [" (format-time-string "%Y-%m-%d") "]"))
              (write-region (point-min) (point-max) index)))
        (with-temp-file index
          (insert (format "#+TITLE: %s\n#+DATE: [%s]\n\n" name
                          (format-time-string "%Y-%m-%d")))
          (insert "* Sinossi\n\n")
          (insert "* Personaggi\n[[file:personaggi/][→ Cartella personaggi]]\n\n")
          (insert "* Luoghi\n[[file:luoghi/][→ Cartella luoghi]]\n\n")
          (insert "* Capitoli\n[[file:capitoli/][→ Cartella capitoli]]\n\n")
          (insert "* Note\n[[file:note/][→ Cartella note]]\n")))
      (message "Creato index.org per %s" name))
    (find-file index)))

(defun tz/workspace-picker ()
  "Select a writing workspace from subdirs of `tz/writing-root'.
Sets it as current, opens index.org (creating it if absent), updates treemacs."
  (interactive)
  (let* ((workspaces (tz/discover-workspaces)))
    (unless workspaces
      (user-error "No workspaces found in %s" tz/writing-root))
    (let* ((names  (mapcar #'car workspaces))
           (choice (completing-read "Workspace: " names nil t))
           (path   (cdr (assoc choice workspaces))))
      (when (file-directory-p path)
        (setq tz/current-workspace (cons choice path))
        (setq-default default-directory path)
        (when (featurep 'treemacs)
          (treemacs-display-current-project-exclusively))
        (tz/workspace-open-index path choice)))))

;; ============================================================================
;; FONT
;; ============================================================================
(defvar tz/font-face
  (if tz/is-mac "IoskeleyMono Nerd Font Mono" "IoskeleyMono Nerd Font")
  "Font family for the current system.")

(defvar tz/font-size (if tz/is-mac 140 110)
  "Font height for the current system.")

;; ============================================================================
;; SPELL / LANGUAGE HELPERS
;; ============================================================================
(defun tz/set-italian-dictionary ()
  "Switch active ispell dictionary to Italian."
  (interactive)
  (ispell-change-dictionary "italiano")
  (when flyspell-mode
    (flyspell-buffer))
  (message "Dizionario → Italiano"))

(defun tz/set-english-dictionary ()
  "Switch active ispell dictionary to English."
  (interactive)
  (ispell-change-dictionary "english")
  (when flyspell-mode
    (flyspell-buffer))
  (message "Dictionary → English"))

;; ============================================================================
;; UTILITY FUNCTIONS
;; ============================================================================
(defun tz/reload-config ()
  "Reload Emacs configuration."
  (interactive)
  (load-file user-init-file)
  (message "Configuration reloaded."))

(defun tz/setup-emoji-font ()
  "Configure Segoe UI Emoji as emoji font (Windows)."
  (let ((font "Segoe UI Emoji"))
    (set-fontset-font t 'symbol (font-spec :family font) nil 'prepend)
    (set-fontset-font t 'emoji  (font-spec :family font) nil 'prepend)))

(defun tz/copy-file-path ()
  "Copy the current buffer's file path to the kill ring."
  (interactive)
  (if-let ((path (buffer-file-name)))
      (progn (kill-new path) (message "Copied: %s" path))
    (message "Buffer has no file.")))

(provide 'functions)
;;; functions.el ends here
