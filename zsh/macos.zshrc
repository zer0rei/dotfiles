### PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

### ALIAS
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"
alias ios-simulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
# rebrandly
alias rbrc="$HOME/Documents/Code/Scripts/rebrandly/rebrandly_create.py"
alias rbrd="$HOME/Documents/Code/Scripts/rebrandly/rebrandly_delete.py"

### OTHER
# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

### FUNCTIONS
# open localhost in safari
function ols() {
	if [ $# -eq 0 ]; then
		open http://localhost:8080
	else
		open http://localhost:$1
	fi
}
## open localhost in chrome
#function olc() {
	#if [ $# -eq 0 ]; then
    #port=8080
  #else
    #port=$1
  #fi
  #osascript $HOME/Documents/Code/Scripts/chrome/open-url-normal.applescript "http://localhost:$port"
#}
# list tasks with specific project
