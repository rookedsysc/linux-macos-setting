# /bin/bash

# Brew Setting
brew update
brew install curl
brew install global
brew install git
brew install neovim
brew install hammerspoon --cask
brew install ffmpeg
brew install neovim



# code server
#brew install git-lfs
## After Node -v 16.16 install 
#sudo npm install -g yarn
#sudo npm install -g nfpm
#brew install jq
#brew install gnupg
#brew install quilt bats
#sudo npm install -g bats

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
cp zshrc.mac ~/.zshrc
cp .vimrc ~/.vimrc
mkdir ~/.config/nvim/
cp ~/.vimrc ~/.config/nvim
source ~/.zshrc

# VIM Setting
vim +PluginInstall +qall

# if dont install zsh-autosuggetions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
