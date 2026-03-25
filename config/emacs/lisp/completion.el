;;; completion.el -*- lexical-binding: t -*-
;;; Commentary:
;; Modern completion: Vertico (UI) + Orderless (matching) +
;; Consult (search/nav commands) + Marginalia (annotations).

;;; Code:

;; ============================================================================
;; VERTICO — Vertical minibuffer completion UI
;; ============================================================================
(use-package vertico
  :init
  (vertico-mode 1)
  :custom
  (vertico-count 15)
  (vertico-cycle t))

;; Persist history so recent choices rank higher
(use-package savehist
  :ensure nil
  :init (savehist-mode 1))

;; ============================================================================
;; ORDERLESS — Space-separated fuzzy matching
;; ============================================================================
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; ============================================================================
;; MARGINALIA — Annotations on completion candidates
;; ============================================================================
(use-package marginalia
  :init (marginalia-mode 1))

;; ============================================================================
;; CONSULT — Enhanced search and navigation commands
;; ============================================================================
(use-package consult
  :custom
  (consult-preview-key "M-.")     ; preview on demand, not automatically
  (consult-narrow-key "<"))

(provide 'completion)
;;; completion.el ends here
