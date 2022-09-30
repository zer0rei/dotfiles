# Add brew to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# source nvm
[ -s "$NVM_DIR" ] && source $(brew --prefix nvm)/nvm.sh

### ALIAS
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"
alias ios-simulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
# rebrandly
alias rbrc="$HOME/Documents/Code/Scripts/rebrandly/rebrandly_create.py"
alias rbrd="$HOME/Documents/Code/Scripts/rebrandly/rebrandly_delete.py"

### OTHER
# iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
