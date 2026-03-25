;;; prose.el -*- lexical-binding: t -*-
;;; Commentary:
;; Writing environment: spell checking, focused modes, org setup,
;; and workspace-aware template management for novel writing.

;;; Code:

;; ============================================================================
;; ISPELL — Spell-check backend
;; ============================================================================
(use-package ispell
  :ensure nil
  :custom
  (ispell-program-name (or (executable-find "aspell") "aspell"))
  (ispell-dictionary "italiano")
  (ispell-silently-savep t)
  :config
  (add-to-list 'ispell-extra-args "--sug-mode=ultra"))

;; ============================================================================
;; FLYSPELL — On-the-fly spell highlighting
;; ============================================================================
(use-package flyspell
  :ensure nil
  :diminish
  :custom
  (flyspell-issue-message-flag nil)
  (flyspell-issue-welcome-flag nil)
  (flyspell-delay 0.5))

;; ============================================================================
;; MIXED-PITCH — Proportional font for prose text, monospace for markup/code
;; ============================================================================
(use-package mixed-pitch
  :hook (org-mode . mixed-pitch-mode)
  :custom
  (mixed-pitch-variable-pitch-cursor nil))

;; ============================================================================
;; OLIVETTI — Centered, distraction-free writing column
;; ============================================================================
(use-package olivetti
  :defer t
  :custom
  (olivetti-body-width 82)
  (olivetti-minimum-body-width 60)
  (olivetti-recall-visual-line-mode-entry-state t))

;; ============================================================================
;; ORG-MODE — Structured long-form writing
;; ============================================================================
(use-package org
  :defer t
  :custom
  (org-startup-indented t)
  (org-hide-emphasis-markers t)
  (org-pretty-entities t)
  (org-ellipsis " ▾")
  (org-fontify-whole-heading-line t)
  (org-fontify-quote-and-verse-blocks t)
  (org-startup-folded 'content)
  (org-cycle-separator-lines 1))

;; ============================================================================
;; ORG-APPEAR — Reveal markup only under cursor
;; ============================================================================
(use-package org-appear
  :after org
  :hook (org-mode . org-appear-mode)
  :custom
  (org-appear-autolinks t)
  (org-appear-autoentities t))

;; ============================================================================
;; WRITING MODE — Focused prose (olivetti + flyspell, no line numbers)
;; ============================================================================
(defun tz/writing-mode ()
  "Toggle focused writing: olivetti + visual-line + flyspell, no line numbers."
  (interactive)
  (if olivetti-mode
      (progn
        (olivetti-mode -1)
        (display-line-numbers-mode 1)
        (flyspell-mode -1)
        (message "Writing mode OFF"))
    (progn
      (olivetti-mode 1)
      (visual-line-mode 1)
      (display-line-numbers-mode -1)
      (flyspell-mode 1)
      (message "Writing mode ON"))))

;; ============================================================================
;; ZEN MODE — Full minimal writing (writing mode + hidden modeline)
;; ============================================================================
(defvar-local tz/zen-active nil
  "Non-nil when zen mode is active in this buffer.")

(defun tz/zen-mode ()
  "Toggle full zen writing: focused mode + hidden modeline.
More immersive than `tz/writing-mode'."
  (interactive)
  (setq tz/zen-active (not tz/zen-active))
  (if tz/zen-active
      (progn
        (olivetti-mode 1)
        (visual-line-mode 1)
        (display-line-numbers-mode -1)
        (flyspell-mode 1)
        (setq-local mode-line-format nil)
        (force-mode-line-update)
        (message "Zen mode ON"))
    (progn
      (olivetti-mode -1)
      (display-line-numbers-mode 1)
      (flyspell-mode -1)
      (kill-local-variable 'mode-line-format)
      (force-mode-line-update)
      (message "Zen mode OFF"))))

;; ============================================================================
;; WORD COUNT — Track words written during the current session
;; ============================================================================
(defvar-local tz/session-start-wc nil
  "Word count when this buffer was first opened in the session.")

(defun tz/wc-buffer ()
  "Return the word count of the current buffer."
  (save-excursion
    (goto-char (point-min))
    (let ((n 0))
      (while (forward-word 1) (setq n (1+ n)))
      n)))

(defun tz/session-wc-init ()
  "Record baseline word count when a writing buffer is opened."
  (setq tz/session-start-wc (tz/wc-buffer)))

(defun tz/session-wc-report ()
  "Show words written this session and total word count of the buffer."
  (interactive)
  (let* ((total   (tz/wc-buffer))
         (start   (or tz/session-start-wc total))
         (written (max 0 (- total start))))
    (message "Sessione: +%d parole  |  Totale: %d parole" written total)))

(defun tz/session-wc-reset ()
  "Reset session baseline to current word count."
  (interactive)
  (setq tz/session-start-wc (tz/wc-buffer))
  (message "Contatore di sessione azzerato."))

;; ============================================================================
;; PROSE HOOK — Applied to all text/org buffers automatically
;; ============================================================================
(defun tz/prose-hook ()
  "Enable prose-friendly settings: centered text, visual lines, flyspell."
  (visual-line-mode 1)
  (flyspell-mode 1)
  (display-line-numbers-mode -1)
  (olivetti-mode 1)
  (tz/session-wc-init))

(add-hook 'text-mode-hook #'tz/prose-hook)
(add-hook 'org-mode-hook  #'tz/prose-hook)

;; ============================================================================
;; TEMPLATE MANAGEMENT — Workspace-aware org file creation
;; ============================================================================

(defun tz/template-path (kind)
  "Locate the template org file for KIND.
Checks current workspace templates/ first, then the Emacs config templates/."
  (let* ((ws-template  (when tz/current-workspace
                         (expand-file-name (concat "templates/" kind ".org")
                                           (cdr tz/current-workspace))))
         (cfg-template (expand-file-name (concat "templates/" kind ".org")
                                         user-emacs-directory)))
    (cond
     ((and ws-template (file-exists-p ws-template)) ws-template)
     ((file-exists-p cfg-template) cfg-template)
     (t nil))))

(defun tz/new-writing-file (kind target-subdir)
  "Create a new org file from the KIND template under TARGET-SUBDIR.
Files are placed in the current workspace (prompts to pick one if unset).
If the file already exists, opens it directly."
  (unless tz/current-workspace
    (call-interactively #'tz/workspace-picker))
  (let* ((ws-path  (tz/workspace-root))
         (title    (read-string (format "%s: " (capitalize kind))))
         (slug     (downcase (replace-regexp-in-string "[[:space:]]+" "-"
                               (replace-regexp-in-string "[^[:alnum:][:space:]-]" "" title))))
         (template (tz/template-path kind))
         (dest-dir (expand-file-name target-subdir ws-path))
         (dest     (expand-file-name (concat slug ".org") dest-dir)))
    (unless (file-directory-p dest-dir)
      (make-directory dest-dir t))
    (if (file-exists-p dest)
        (find-file dest)
      ;; Create from template or minimal stub
      (if template
          (copy-file template dest)
        (with-temp-file dest
          (insert (format "#+TITLE: %s\n#+DATE: [%s]\n\n* Contenuto\n\n"
                          title (format-time-string "%Y-%m-%d")))))
      (find-file dest)
      ;; Fill TITLE / DATE placeholders
      (goto-char (point-min))
      (when (re-search-forward "^#\\+TITLE:[ \t]*$" nil t)
        (end-of-line) (insert " " title))
      (goto-char (point-min))
      (when (re-search-forward "^#\\+DATE:[ \t]*$" nil t)
        (end-of-line) (insert " [" (format-time-string "%Y-%m-%d") "]"))
      (save-buffer)
      (goto-char (point-min)))))

;; Convenience wrappers
(defun tz/new-personaggio () (interactive) (tz/new-writing-file "personaggio" "personaggi"))
(defun tz/new-luogo       () (interactive) (tz/new-writing-file "luogo"       "luoghi"))
(defun tz/new-capitolo    () (interactive) (tz/new-writing-file "capitolo"    "capitoli"))
(defun tz/new-nota        () (interactive) (tz/new-writing-file "nota"        "note"))

;; ============================================================================
;; KEYBINDINGS — SPC n (new) and SPC z (zen/writing) — requires general.el
;; ============================================================================
(with-eval-after-load 'general
  ;; New file from template
  (tz/leader-def
    "n"  '(:ignore t :wk "new")
    "np" '(tz/new-personaggio :wk "personaggio")
    "nl" '(tz/new-luogo       :wk "luogo")
    "nc" '(tz/new-capitolo    :wk "capitolo")
    "nn" '(tz/new-nota        :wk "nota"))

  ;; Writing / zen modes + word count
  (tz/leader-def
    "zz" '(tz/writing-mode      :wk "writing mode")
    "zZ" '(tz/zen-mode          :wk "zen mode")
    "zw" '(tz/session-wc-report :wk "word count")
    "zW" '(tz/session-wc-reset  :wk "reset word count")))

(provide 'prose)
;;; prose.el ends here
