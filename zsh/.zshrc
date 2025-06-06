# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#~~ Some exports
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/cross/bin:$PATH"

#~~ Load OMZ & Antigen
source $ZSH/oh-my-zsh.sh
source $ZSH/antigen.zsh

#~~ Apply antigen
antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle ael-code/zsh-colored-man-pages
antigen theme romkatv/powerlevel10k

antigen apply

#~~ Some usefull aliases and functions
alias mkdir="mkdir -p"
alias cat="bat"

function dot { cd ~/.dotfiles }
function rr { cd ~/[wW]ork/$@ }
function mkcd() { mkdir -p "$@" && cd "$_"; }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
