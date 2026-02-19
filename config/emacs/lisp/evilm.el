;;; evilm.el -*- lexical-binding: t -*-
;;; Commentary:
;; Evil mode configuration with SPC leader key system
;; Optimized for split keyboard (home row: j/k/l/;)

;;; Code:

;; ============================================================================
;; WHICH-KEY — Show available keybindings in popup
;; ============================================================================
(use-package which-key
  :diminish
  :init
  (setq which-key-idle-delay 0.3
        which-key-separator " → "
        which-key-prefix-prefix "+"
        which-key-sort-order 'which-key-key-order-alpha
        which-key-min-display-lines 6)
  :config
  (which-key-mode 1))

;; ============================================================================
;; EVIL — Vim emulation
;; ============================================================================
(use-package evil
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-want-Y-yank-to-eol t     ; Y yanks to end of line (like D, C)
        evil-undo-system 'undo-redo    ; Native undo/redo (Emacs 28+)
        evil-split-window-below t      ; New splits open below
        evil-vsplit-window-right t     ; New vsplits open right
        evil-respect-visual-line-mode t)
  :config
  (evil-mode 1)

  ;; --- Insert mode: jk to escape (j=left hand, k=right hand on split) ---
  (evil-define-key 'insert global-map
    (kbd "j") (lambda ()
                (interactive)
                (let ((evt (read-event nil nil 0.15)))
                  (cond
                   ((and evt (= evt ?k))
                    (evil-normal-state))
                   (evt
                    (insert "j")
                    (push evt unread-command-events))
                   (t
                    (insert "j"))))))

  ;; --- Split-keyboard home row: j/k/l/; as left/down/up/right ---
  ;; Remap motion keys in normal, visual, and operator states
  (evil-define-key '(normal visual motion operator) 'global
    (kbd "j") 'evil-backward-char     ; j → left  (was h)
    (kbd "k") 'evil-next-line         ; k → down  (was j)
    (kbd "l") 'evil-previous-line     ; l → up    (was k)
    (kbd ";") 'evil-forward-char)     ; ; → right (was l)

  ;; --- Window navigation with C-j/k/l/; (matches your home row) ---
  (evil-define-key '(normal visual insert emacs) 'global
    (kbd "C-j") 'evil-window-left
    (kbd "C-k") 'evil-window-down
    (kbd "C-l") 'evil-window-up
    (kbd "C-;") 'evil-window-right))

;; ============================================================================
;; EVIL-COLLECTION — Community Evil bindings for many modes
;; ============================================================================
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; ============================================================================
;; GENERAL.EL — Leader key framework
;; ============================================================================
(use-package general
  :after evil
  :config

  ;; Define SPC as leader in normal/visual, available everywhere
  (general-create-definer tz/leader-def
    :states '(normal visual)
    :keymaps 'override
    :prefix "SPC")

  ;; Define , as local leader (mode-specific bindings)
  (general-create-definer tz/local-leader-def
    :states '(normal visual)
    :keymaps 'override
    :prefix ",")

  ;; =========================================================================
  ;; TOP-LEVEL SHORTCUTS (most used actions, single key after SPC)
  ;; =========================================================================
  (tz/leader-def
    "SPC" '(execute-extended-command :wk "M-x")
    "."   '(find-file :wk "find file")
    ","   '(switch-to-buffer :wk "switch buffer")
    "/"   '(grep :wk "search project")
    ":"   '(eval-expression :wk "eval expression"))

  ;; =========================================================================
  ;; BUFFER — SPC b
  ;; =========================================================================
  (tz/leader-def
    "b"  '(:ignore t :wk "buffer")
    "bb" '(switch-to-buffer :wk "switch")
    "bd" '(kill-current-buffer :wk "kill")
    "bn" '(next-buffer :wk "next")
    "bp" '(previous-buffer :wk "previous")
    "bs" '(save-buffer :wk "save")
    "bS" '(evil-write-all :wk "save all")
    "br" '(revert-buffer :wk "revert")
    "bi" '(ibuffer :wk "ibuffer"))

  ;; =========================================================================
  ;; FILE — SPC f
  ;; =========================================================================
  (tz/leader-def
    "f"  '(:ignore t :wk "file")
    "ff" '(find-file :wk "find")
    "fr" '(recentf-open-files :wk "recent")
    "fs" '(save-buffer :wk "save")
    "fR" '(tz/reload-config :wk "reload config")
    "fD" '(delete-file :wk "delete")
    "fy" '(tz/copy-file-path :wk "copy path"))

  ;; =========================================================================
  ;; WINDOW — SPC w (uses j/k/l/; for directions)
  ;; =========================================================================
  (tz/leader-def
    "w"  '(:ignore t :wk "window")
    "wj" '(evil-window-left :wk "← left")
    "wk" '(evil-window-down :wk "↓ down")
    "wl" '(evil-window-up :wk "↑ up")
    "w;" '(evil-window-right :wk "→ right")
    "ws" '(evil-window-split :wk "split horizontal")
    "wv" '(evil-window-vsplit :wk "split vertical")
    "wd" '(evil-window-delete :wk "delete")
    "wm" '(delete-other-windows :wk "maximize")
    "w=" '(balance-windows :wk "balance"))

  ;; =========================================================================
  ;; TREEMACS / TOGGLE — SPC t
  ;; =========================================================================
  (tz/leader-def
    "t"  '(:ignore t :wk "tree/toggle")
    "tt" '(treemacs :wk "treemacs")
    "tf" '(treemacs-find-file :wk "find in tree")
    "td" '(treemacs-select-directory :wk "select directory")
    "tn" '(display-line-numbers-mode :wk "line numbers")
    "tw" '(whitespace-mode :wk "whitespace")
    "tl" '(hl-line-mode :wk "highlight line")
    "tv" '(visual-line-mode :wk "visual lines"))

  ;; =========================================================================
  ;; SEARCH — SPC s
  ;; =========================================================================
  (tz/leader-def
    "s"  '(:ignore t :wk "search")
    "ss" '(isearch-forward :wk "search forward")
    "sr" '(isearch-backward :wk "search backward")
    "sp" '(grep :wk "grep project")
    "sR" '(query-replace :wk "replace"))

  ;; =========================================================================
  ;; LANGUAGE / SPELL — SPC l
  ;; =========================================================================
  (tz/leader-def
    "l"  '(:ignore t :wk "language")
    "li" '(tz/set-italian-dictionary :wk "italiano")
    "le" '(tz/set-english-dictionary :wk "english")
    "ls" '(flyspell-mode :wk "flyspell toggle")
    "lc" '(ispell-word :wk "correct word")
    "ln" '(flyspell-goto-next-error :wk "next error"))

  ;; =========================================================================
  ;; HELP — SPC h
  ;; =========================================================================
  (tz/leader-def
    "h"  '(:ignore t :wk "help")
    "hf" '(describe-function :wk "function")
    "hv" '(describe-variable :wk "variable")
    "hk" '(describe-key :wk "key")
    "hm" '(describe-mode :wk "mode")
    "hi" '(info :wk "info")
    "hp" '(describe-package :wk "package"))

  ;; =========================================================================
  ;; QUIT — SPC q
  ;; =========================================================================
  (tz/leader-def
    "q"  '(:ignore t :wk "quit")
    "qq" '(save-buffers-kill-terminal :wk "quit emacs")
    "qr" '(restart-emacs :wk "restart"))

  ;; =========================================================================
  ;; OPEN — SPC o
  ;; =========================================================================
  (tz/leader-def
    "o"  '(:ignore t :wk "open")
    "ot" '(eshell :wk "terminal")
    "od" '((lambda () (interactive) (dired default-directory)) :wk "dired here")
    "on" '((lambda () (interactive) (find-file tz/novels-directory)) :wk "novels")))

(provide 'evilm)
;;; evilm.el ends here
