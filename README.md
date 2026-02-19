# 🗂 Dotfiles

> Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). On macOS: `brew install stow`.

## Packages

| Package             | Target              | Contents                             | Docs |
|---------------------|---------------------|--------------------------------------|------|
| `zsh/`              | `$HOME`             | `.zshrc`, `.zshenv`, `.p10k.zsh`     | [→](zsh/README.md) |
| `git/`              | `$HOME`             | `.gitconfig`                         | [→](git/README.md) |
| `config/emacs/`     | `~/.emacs.d`        | `early-init.el`, `init.el`, `lisp/`  | [→](config/emacs/README.md) |
| `config/wezterm/`   | `~/.config/wezterm` | `wezterm.lua`                        | [→](config/wezterm/README.md) |

> `README.md` and `.gitkeep` files are ignored by stow (see `.stowrc`).

## Setup

```bash
# Clone and stow from repo root
stow -t ~ zsh git
stow -t ~/.emacs.d config/emacs
stow -t ~/.config/wezterm config/wezterm
```

To remove symlinks:

```bash
stow -t ~ -D zsh git
stow -t ~/.emacs.d -D config/emacs
stow -t ~/.config/wezterm -D config/wezterm
```
