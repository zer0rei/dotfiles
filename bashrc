############################################
############################################
#               BASHRC : HE                #
############################################
############################################

# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

PS1='\h:\W \u\$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize
# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
	local SEARCH=' '
	local REPLACE='%20'
	local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	printf '\e]7;%s\a' "$PWD_URL"
    }
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi

# add git to bash completion
source ~/.git-completion.bash

# add git to bash command prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\[\033[0;36m\\]\u@\h:\[\033[00m\\]\[\033[0;33m\\]\$(__git_ps1)\[\033[00m\\]\[\033[0;36m\\] \W\$\[\033[00m\\] "

# set bash to vi mode (ability to use vi shortcuts in a bash prompt)
set -o vi

# add rbenv to bash so that it loads every time a terminal is open
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# add brew location to path
export PATH="/usr/local/sbin:$PATH"

# enable bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# add qt to path
export PATH="/usr/local/opt/qt/bin:$PATH"

# add anaconda to path
export PATH=/Users/hamza/anaconda3/bin:$PATH

# alias
alias racket="rlwrap -c racket"
alias npmo="npm --cache-min 9999999"
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias vpnbookpass="curl -s 'http://www.vpnbook.com' | grep 'Password: \(\w\+\)<' | tail -n 1 | cut -f3 -d '<' | cut -f2 -d ' ' | tr -d '\n' | pbcopy"

# binds
bind -x '"\C-l": clear'
