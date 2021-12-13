#==============
# Install all the packages
#==============
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew doctor
brew update
brew install git

rm -rf ~/.dotfiles
git clone git@github.com:zer0rei/dotfiles.git ~/.dotfiles

#==============
# Remove old dot flies
#==============
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.git-prompt.sh > /dev/null 2>&1
sudo rm -rf ~/.config > /dev/null 2>&1
sudo rm -rf ~/Brewfile > /dev/null 2>&1

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
SYMLINKS=()
ln -sf ~/.dotfiles/vim/vim ~/.vim
SYMLINKS+=('.vim')
ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc
SYMLINKS+=('.vimrc')
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
SYMLINKS+=('.tmux.conf')
ln -sf ~/.dotfiles/config ~/.config
SYMLINKS+=('.config')
ln -sf ~/.dotfiles/git/git-prompt.sh ~/.git-prompt.sh
SYMLINKS+=('.git-prompt.sh')
ln -sf ~/.dotfiles/homebrew/Brewfile ~/Brewfile
SYMLINKS+=('Brewfile')

cd ~
brew bundle
cd -

# install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
SYMLINKS+=('.zshrc')

#==============
# Set zsh as the default shell
#==============
chsh -s /bin/zsh

#==============
# And we are done
#==============
echo ${SYMLINKS[@]}
echo -e "\n====== All Done!! ======\n"
