# /bin/bash

# Brew Setting
brew update
brew install curl
brew install global
brew install git

# git clone 
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/rookedsysc/Linux_MacOS_Setting
cp ./Linux_MacOS_Setting/.vimrc ~/.vimrc

# ZSH Setting
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 
~/.fzf/install
git clone https://github.com/rookedsysc/Linux_MacOS_Setting
cd ./Linux_MacOS_Setting
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/bin"
cp .zshrc ~/.zshrc
cp .vimrc ~/.vimrc
# if dont install zsh-autosuggetions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source ~/.zshrc

# VIM Setting
vim +PluginInstall +qall
