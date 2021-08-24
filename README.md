## Welcome to the wasted lands of dotfiles 🔥
---

Shame, shame on you, who decided to format (again) your pc.

#### Basics
First thing, first, right? So let's start with [homebrew installation](https://brew.sh)

Then we should install some dependencies:

```bash
brew install \
	stow \
	neovim \
	pv \
	ripgrep \
	neovim 

brew install --cask \
	dotnet-sdk \
	gpg-suite-no-mail \
	iterm2
```

#### Stow back
Let's clone this repo, and link some configs

```bash
git clone https://github.com/titanzero/dotfiles.git .dotfiles
cd .dotfiles
mkdir -p ~/.config #Ensure config folder exists, not guaranteed on fresh installs
stow config -t ~/.config
stow git
stow zsh
```

#### NeoVim
The biggest part is there. Technically with this new VIM Lua config should be easier to install everything

```bash
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim #Ensure packer is installed

#Install all vim plugins in headless mode, and then close everything
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```
