export ZSH="/Users/nicola/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source $ZSH/antigen.zsh

### Exports
#
export VISUAL=nvim
export EDITOR="$VISUAL"

### Export PATHs
#
export PATH="/usr/local/cross/bin:$PATH"

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
function repos { cd ~/Repos }
function rr { cd ~/Repos/$@ }
function mkcd() { mkdir -p "$@" && cd "$_"; }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Fuzzy
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'head -100 {}'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
