;;; tree.el -*- lexical-binding: t -*-
;;; Commentary:
;; Treemacs file tree with Evil integration
;; Keybindings managed via SPC leader in evilm.el

;;; Code:

(use-package treemacs
  :defer t
  :custom
  (treemacs-width 30)
  (treemacs-is-never-other-window t)
  (treemacs-follow-after-init t)
  (treemacs-show-hidden-files nil)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode 'always)
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-git-mode 'simple))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-nerd-icons
  :after (treemacs nerd-icons)
  :config (treemacs-load-theme "nerd-icons"))

(provide 'tree)
;;; tree.el ends here
