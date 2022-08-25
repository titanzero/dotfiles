export DOTNET_CLI_TELEMETRY_OPTOUT=1
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source $ZSH/antigen.zsh

### Exports
#
export VISUAL=nvim
export EDITOR="$VISUAL"
export N_PREFIX="$HOME/.n"

### Export PATHs
#
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

### Angigen
#
antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen theme romkatv/powerlevel10k

antigen apply

### Customs
#
alias mkdir='mkdir -p'
alias vim='nvim'
alias pwgen='pwgen -cyns 50 1 | pbcopy'

### Functions
#
function dotfiles { cd ~/.dotfiles }
function rr { cd ~/[wW]ork/$@ }
function vdot { dotfiles && nvim }
function mkcd() { mkdir -p "$@" && cd "$_"; }

### To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
