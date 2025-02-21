# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_ENV_HINT=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh
source $ZSH/antigen.zsh

### Exports
#
export VISUAL=nvim
export EDITOR="$VISUAL"

### Export PATHs
#
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/gcc-elf/bin:$PATH"
export PATH="/Users/nicola/Library/Python/3.9/bin:$PATH"

### Angigen
#
antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle ael-code/zsh-colored-man-pages
antigen theme romkatv/powerlevel10k

antigen apply

### Customs
#
alias mkdir='mkdir -p'
alias pwgen='pwgen -cyns 50 1 | pbcopy'
alias ydl='yt-dlp --audio-quality 320K --recode-video mp4 -k'
alias vim='nvim'
alias vi='nvim'

### Functions
#
function dot { cd ~/.dotfiles }
function rr { cd ~/[wW]ork/$@ }
function mkcd() { mkdir -p "$@" && cd "$_"; }

source <(fzf --zsh)

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/zsh/.p10k.zsh.
[[ ! -f $HOME/.dotfiles/zsh/.p10k.zsh ]] || source $HOME/.dotfiles/zsh/.p10k.zsh

export N_PREFIX="/opt/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
