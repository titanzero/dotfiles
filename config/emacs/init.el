;;; init.el --- Emacs configuration for creative writing -*- lexical-binding: t -*-
;;; Commentary:
;; Minimal and modern configuration for writing novellas with Org-mode

;;; Code:

;;; ============================================================================
;;; BOOTSTRAP - Package Manager
;;; ============================================================================

;; Initialize package.el
(require 'package)

;; Package repositories
(setq package-archives
      '(("melpa"  . "https://melpa.org/packages/")
        ("elpa"   . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

;; Repository priorities (optional)
(setq package-archive-priorities
      '(("melpa"  . 10)
        ("elpa"   . 5)
        ("nongnu" . 3)))

;; Initialize
(package-initialize)

;; Refresh package list if needed
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if not present
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Load use-package
(require 'use-package)

;; Automatically install missing packages
(setq use-package-always-ensure t)

;; Show load time (useful for debugging)
(setq use-package-verbose nil
      use-package-compute-statistics nil)


;;; Load settings
(require 'functions)
(require 'settings)
(require 'evilm)
(require 'tree)
(require 'theme)

;;; Keybindings are managed in evilm.el via Evil SPC leader
