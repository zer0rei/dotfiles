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
alias brewup="brew update; brew upgrade; brew prune; brew cleanup; brew doctor"
alias ios-simulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
# rebrandly
alias rbrc="$HOME/Documents/Code/Scripts/rebrandly/rebrandly_create.py"
alias rbrd="$HOME/Documents/Code/Scripts/rebrandly/rebrandly_delete.py"

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
