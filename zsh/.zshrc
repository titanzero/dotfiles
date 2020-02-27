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
export PATH="/usr/local/cross/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
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
alias vi='nvim'
alias vim='nvim'

### Functions
#
function dotfiles { cd ~/.dotfiles }
function rr { cd ~/[rR]epos/$@ }
function mkcd() { mkdir -p "$@" && cd "$_"; }

### To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

