# 🌑 .emacs.d

> A minimal, modern, and aesthetic Emacs configuration crafted for creative writing and performance.

![Emacs](https://img.shields.io/badge/Emacs-29%2B-purple?style=for-the-badge&logo=gnuemacs)
![Evil](https://img.shields.io/badge/Evil-Mode-red?style=for-the-badge&logo=vim)
![Theme](https://img.shields.io/badge/Theme-Catppuccin_Mocha-pink?style=for-the-badge)

## ✨ Features

- **🚀 Blazing Fast**: Optimized startup with `early-init.el` garbage collection tuning and UI disabling.
- **🎨 Aesthetic**: Beautiful [Catppuccin Mocha](https://github.com/catppuccin/emacs) theme with [Doom Modeline](https://github.com/seagle0128/doom-modeline).
- **😈 Evil Roots**: Full Vim emulation via `evil-mode` and `evil-collection` for efficient editing.
- **✍️ Writer Focused**: Distraction-free defaults, configured for writing novellas and prose.
- **📂 Modular**: Clean structure with separated concerns in `lisp/`.

## 🛠️ Installation

1. Backup your existing configuration:
   ```sh
   mv ~/.emacs.d ~/.emacs.d.bak
   ```

2. Clone the repository:
   ```sh
   git clone git@github.com:titanzero/emacs.git ~/.emacs.d
   ```

3. Launch Emacs. Packages will install automatically on the first run.

## 📂 Structure

```text
~/.emacs.d/
├── early-init.el    # Startup optimizations (GC, UI)
├── init.el          # Package bootstrapping and module loading
└── lisp/
    ├── evilm.el     # Vim keybindings configuration
    ├── functions.el # Custom helper functions & OS detection
    ├── settings.el  # General defaults (UTF-8, backups, indentation)
    └── theme.el     # Visuals (Catppuccin, Nerd Icons, Doom Modeline)
```

## ⌨️ Keybindings

> Uses **Evil mode** with `SPC` as leader key (normal/visual) and `,` as local leader.  
> Home row remapped for **split keyboard**: `j` ← / `k` ↓ / `l` ↑ / `;` →

### Motion (Normal / Visual)

| Key  | Action             |
|------|--------------------|
| `j`  | ← (move left)      |
| `k`  | ↓ (move down)      |
| `l`  | ↑ (move up)        |
| `;`  | → (move right)     |
| `jk` | Escape to Normal   |

### Window navigation

| Key     | Action         |
|---------|----------------|
| `C-j`   | Window left    |
| `C-k`   | Window down    |
| `C-l`   | Window up      |
| `C-;`   | Window right   |

### SPC Leader — Top level

| Key       | Action             |
|-----------|--------------------|
| `SPC SPC` | M-x                |
| `SPC .`   | Find file          |
| `SPC ,`   | Switch buffer      |
| `SPC /`   | Search project     |
| `SPC :`   | Eval expression    |

### SPC b — Buffer

| Key     | Action         |
|---------|----------------|
| `SPC bb` | Switch buffer |
| `SPC bd` | Kill buffer   |
| `SPC bn` | Next buffer   |
| `SPC bp` | Prev buffer   |
| `SPC bs` | Save buffer   |
| `SPC br` | Revert buffer |
| `SPC bi` | ibuffer       |

### SPC f — File

| Key      | Action           |
|----------|------------------|
| `SPC ff` | Find file        |
| `SPC fr` | Recent files     |
| `SPC fs` | Save file        |
| `SPC fR` | Reload config    |
| `SPC fD` | Delete file      |
| `SPC fy` | Copy file path   |

### SPC w — Window

| Key      | Action              |
|----------|---------------------|
| `SPC wj` | ← Window left       |
| `SPC wk` | ↓ Window down       |
| `SPC wl` | ↑ Window up         |
| `SPC w;` | → Window right      |
| `SPC ws` | Split horizontal    |
| `SPC wv` | Split vertical      |
| `SPC wd` | Delete window       |
| `SPC wm` | Maximize window     |
| `SPC w=` | Balance windows     |

### SPC s — Search

| Key      | Action           |
|----------|------------------|
| `SPC ss` | Search forward   |
| `SPC sr` | Search backward  |
| `SPC sp` | Grep project     |
| `SPC sR` | Query replace    |

### SPC l — Language / Spell

| Key      | Action              |
|----------|---------------------|
| `SPC li` | Italian dictionary  |
| `SPC le` | English dictionary  |
| `SPC ls` | Toggle flyspell     |
| `SPC lc` | Correct word        |
| `SPC ln` | Next spell error    |

### SPC t — Tree / Toggle

| Key      | Action              |
|----------|---------------------|
| `SPC tt` | Treemacs            |
| `SPC tf` | Find in tree        |
| `SPC tn` | Line numbers toggle |
| `SPC tv` | Visual line mode    |

### SPC h — Help

| Key      | Action              |
|----------|---------------------|
| `SPC hf` | Describe function   |
| `SPC hv` | Describe variable   |
| `SPC hk` | Describe key        |
| `SPC hm` | Describe mode       |
| `SPC hp` | Describe package    |

### SPC o — Open

| Key      | Action         |
|----------|----------------|
| `SPC ot` | Terminal (eshell) |
| `SPC od` | Dired here     |
| `SPC on` | Novels folder  |

### SPC q — Quit

| Key      | Action         |
|----------|----------------|
| `SPC qq` | Quit Emacs     |
| `SPC qr` | Restart Emacs  |

## 🔧 Requirements

- **Emacs 29+**
- **Nerd Fonts**: [IoskeleyMono](https://github.com/be5invis/Iosevka) or any standard Nerd Font is recommended for icons to render correctly.

---

> _"Minimal and modern configuration for writing novellas with Org-mode"_
