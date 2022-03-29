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
export PATH="$N_PREFIX/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/cross/bin:$PATH"
export PATH="/opt/grub/bin:$PATH"
export PATH="/opt/aircrack/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

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
alias sqlmap='sqlmap --tor --tor-type=SOCKS5 --tor-port=9050 --check-tor --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36" --output-dir=~/Repos/sqlmap'
alias tcurl='curl -x socks5h://localhost:9050'
alias ip='curl -w "\n" ipinfo.io/ip'
alias tip='tcurl -w "\n" ipinfo.io/ip'

### Functions
#
function dotfiles { cd ~/.dotfiles }
function rr { cd ~/[rR]epos/$@ }
function vdot { dotfiles && }
function mkcd() { mkdir -p "$@" && cd "$_"; }

### To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Scaleway CLI autocomplete initialization.
eval "$(scw autocomplete script shell=zsh)"
