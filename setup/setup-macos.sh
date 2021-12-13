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
# Remove old dotfiles
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
ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc
SYMLINKS+=('.vimrc')
ln -sf ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
SYMLINKS+=('.tmux.conf')
ln -sf ~/.dotfiles/git/git-prompt.sh ~/.git-prompt.sh
SYMLINKS+=('.git-prompt.sh')
ln -sf ~/.dotfiles/homebrew/Brewfile ~/Brewfile
SYMLINKS+=('Brewfile')
mkdir ~/.config
ln -sf ~/.dotfiles/config/karabiner ~/.config/karabiner
SYMLINKS+=('karabiner')
ln -sf ~/.dotfiles/config/nvim ~/.config/nvim
SYMLINKS+=('nvim')

cd ~
brew bundle
cd -

# install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
SYMLINKS+=('.zshrc')

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install tmp
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#==============
# Set zsh as the default shell
#==============
chsh -s /bin/zsh

# setup neovim
pip3 install neovim
nvim +PlugClean +PlugInstall +qa

#==============
# And we are done
#==============
echo ${SYMLINKS[@]}
echo -e "\n====== All Done!! ======\n"
