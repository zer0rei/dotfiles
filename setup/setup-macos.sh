#==============
# Install all the packages
#==============
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew doctor
brew update
brew install git

# So we use all of the packages we are about to install
echo "export PATH='/usr/local/bin:$PATH'\n" >> ~/.bashrc
source ~/.bashrc

rm -rf ~/.dotfiles
git clone https://github.com/zer0rei/dotfiles.git ~/.dotfiles

#==============
# Remove old dot flies
#==============
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1
sudo rm -rf ~/.config > /dev/null 2>&1
sudo rm -rf ~/Brewfile > /dev/null 2>&1

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
SYMLINKS=()
ln -sf ~/.dotfiles/vim ~/.vim
SYMLINKS+=('.vim')
ln -sf ~/.dotfiles/vimrc ~/.vimrc
SYMLINKS+=('.vimrc')
ln -sf ~/.dotfiles/bashrc ~/.bashrc
SYMLINKS+=('.bashrc')
ln -sf ~/.dotfiles/mac-tmux ~/.tmux
SYMLINKS+=('.tmux')
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
SYMLINKS+=('.zshrc')
ln -sf ~/.dotfiles/config ~/.config
SYMLINKS+=('.config')
ln -sf ~/.dotfiles/homebrew/Brewfile ~/Brewfile
SYMLINKS+=('Brewfile')

echo ${SYMLINKS[@]}

cd ~
brew bundle
cd -

#==============
# Set zsh as the default shell
#==============
chsh -s /bin/zsh

#==============
# And we are done
#==============
echo -e "\n====== All Done!! ======\n"
