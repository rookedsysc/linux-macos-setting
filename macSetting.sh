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

# VIM Setting
vim +PluginInstall +qall
