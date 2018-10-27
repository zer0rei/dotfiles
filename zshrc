##### HE: ZSHRC

#### PLUGIN MANAGER

### OH-MY-ZSH
## Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

## Plugin list
plugins=(git osx extract z web-search colored-man-pages)
plugins+=(k zsh-autosuggestions)

## Source oh-my-zsh
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
alias v="nvim"
alias nv="nvim"
alias ts="task"
alias t="tmux attach -t"
alias tma="tmux attach -t"
alias tmn="tmux new -s"
alias tml='tmux list-sessions'
alias ze="vim $HOME/.zshrc"
alias ve="vim $HOME/.vimrc"
alias nve="nvim $HOME/.vimrc"
alias zs="source $HOME/.zshrc"
alias op="open"
alias ios-simulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias brewup="brew update; brew upgrade; brew prune; brew cleanup; brew doctor"
alias kh="k -h"
# rebrandly
alias rbrc="$HOME/Documents/Code/Scripts/rebrandly/rebrandly-create.py"
alias rbrd="$HOME/Documents/Code/Scripts/rebrandly/rebrandly-delete.py"
# start a python http server
alias pyserv="python -m http.server 8080"
# thefuck aliases
eval $(thefuck --alias)
eval $(thefuck --alias f)

### PROMPT
autoload -U colors && colors
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

### PLUGINS
## Autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=0"
bindkey '^ ' autosuggest-accept

### FUNCTIONS
# print terminal colors
function print-colors() {
  for i in {0..255} ; do
    printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
    if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
        printf "\n";
    fi
  done
}
# myi IP address
function myip() {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
	ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}
# open localhost in safari
function ols() {
	if [ $# -eq 0 ]; then
		open http://localhost:8080
	else
		open http://localhost:$1
	fi
}
# open localhost in chrome
function olc() {
	if [ $# -eq 0 ]; then
    port=8080
  else
    port=$1
  fi
  osascript $HOME/Documents/Code/Scripts/chrome/open-url-normal.applescript "http://localhost:$port"
}
# list tasks with specific project
function tspl() {
  local projects=""
  local last=false
  for arg; do
    if [ $arg = "and" ]; then
      projects+=" and"
      last=false
      continue
    elif [ $arg = "or" ]; then
      projects+=" or"
      last=false
      continue
    fi
    if [ "$last" = false ]; then
      projects+=" project:$arg"
      last=true
    else
      projects+=" $arg"
    fi
  done
  eval task $projects list
}
# add tasks with specific project
function tspa() {
  task add project:$1 "${@:2}"
}
