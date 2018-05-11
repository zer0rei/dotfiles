##### HE: ZSHRC

#### OH-MY-ZSH
export ZSH=$HOME/.oh-my-zsh

### PLUGINS
plugins=(git osx extract z web-search)

source $ZSH/oh-my-zsh.sh


#### USER

### PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
# add anaconda to path
export PATH=/Users/hamza/anaconda3/bin:$PATH
# remove/add anaconda to path automatically when brewing
export SANS_ANACONDA="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export PATH="/Users/hamza/anaconda3/bin:$SANS_ANACONDA"
alias prebrew="export PATH="\$SANS_ANACONDA" && echo Removing anaconda from PATH."
alias postbrew="export PATH="/Users/hamza/anaconda3/bin:\$SANS_ANACONDA" && echo Adding anaconda to PATH."
brew () {
  prebrew
  command brew "$@"
  postbrew
}

### ALIAS
alias c="clear"
alias ez="vi $HOME/.zshrc"
alias ta="task"
alias op="open"
alias brewup="brew update; brew upgrade; brew prune; brew cleanup; brew doctor"
# start a python http server
alias pyserv="python -m http.server 8080"
# thefuck aliases
eval $(thefuck --alias)
eval $(thefuck --alias f)

### PROMPT
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}
source ~/.git-prompt.sh
setopt PROMPT_SUBST
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"
export PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}$(box_name)%{$reset_color%}: %{$fg[blue]%}%1~%{$reset_color%}%{$fg[green]%}$(__git_ps1 " (%s)")%{$reset_color%}$ '
local return_status="%{$fg[red]%}%(?..✕)%{$reset_color%}"
export RPROMPT='${return_status}%{$reset_color%}'

### GENERAL
# don't add commands that are prepended with a space to history
setopt histignorespace
# vi mode
export EDITOR="vim"
bindkey -v
export KEYTIMEOUT=1
# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

### OTHER
# load rbenv automatically
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# zsh prompt syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
