# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a stow package that mirrors the target directory tree. Symlinking a package recreates its structure at the target path.

## Stow Commands

```bash
# Symlink zsh and git configs to $HOME
stow -t ~ zsh git

# Symlink emacs and wezterm configs to ~/.config
stow config -t ~/.config

# Remove symlinks
stow -t ~ -D zsh git
stow config -t ~/.config -D
```

Stow is configured via `.stowrc` to ignore `README.md`, `.gitkeep`, and `.DS_Store`.

## Package Layout

| Package | Stow target | Contents |
|---|---|---|
| `zsh/` | `$HOME` | `.zshrc`, `.zshenv`, `.p10k.zsh` |
| `git/` | `$HOME` | `.gitconfig` |
| `config/emacs/` | `~/.config/emacs` | `early-init.el`, `init.el`, `lisp/` modules |
| `config/wezterm/` | `~/.config/wezterm` | `wezterm.lua` |

## Key Architecture Notes

**Zsh**: Uses Oh My Zsh + antigen for bundle management, Powerlevel10k theme with instant prompt. Custom functions: `dot` (cd to dotfiles), `rr` (cd to repo root), `mkcd`.

**Emacs**: Requires Emacs 29+. Modular structure — `init.el` bootstraps `use-package` then loads modules from `lisp/`: `functions.el`, `settings.el`, `evilm.el` (Evil/Vim bindings), `theme.el` (Catppuccin Mocha), `tree.el` (Treemacs). Evil mode uses a remapped layout for split keyboards: `j`←, `k`↓, `l`↑, `;`→. SPC is the leader key.

**WezTerm**: Lua config with Catppuccin Mocha theme, IoskeleyMono Nerd Font 14pt, tab bar at bottom.

**Git**: Pull rebasing enabled.

## Commit Conventions

Follow [Conventional Commits](https://www.conventionalcommits.org/). Commit directly to `master`.

Format: `<type>(<scope>): <subject>`

Types: `feat`, `fix`, `refactor`, `perf`, `docs`, `test`, `build`, `ci`, `chore`, `style`, `revert`

Subject rules: imperative present tense, capitalized, no trailing period, max 70 chars.

Breaking changes: use `feat!:` / `fix!:` syntax or add `BREAKING CHANGE:` footer.

Each commit should represent a single stable, independently reviewable change. The repo must be in a working state after every commit.
