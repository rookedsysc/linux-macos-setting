# /bin/bash 
# root
# for kali linux

# kali msf setting
msfdb init
service postgresql start
update-rc.d postgresql enable 

# Updates
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install zsh
sudo apt-get -y install python pip git
pip install --upgrade pip
sudo apt-get install -y net-tools
sudo apt-get -y install wget curl
sudo apt-get -y install service
sudo apt-get install -y git
sudo apt install build-essential -y
sudo apt-get install -y ruby
sudo apt-get install -y make

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


# VIM Setting
# update Aug 16 21:00 / cuz ubuntu error
git clone https://github.com/rookedsysc/Linux_MacOS_Setting
cd ./Linux_MacOS_Setting
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/bin"
cp .vimrc ~/.vimrc
sudo apt-get install vim
sudo apt-get install vim-gui-common -y
sudo apt-get install vim-runtime -y
sudo apt-get install build-essential cmake python-dev silversearcher-ag -y
sudo apt-get install python-dev-is-python3 -y
sudo apt-get install -y ripgrep && sudo apt-get -y install libncurses5-dev
wget http://tamacom.com/global/global-6.3.3.tar.gz
tar -xvf global-6.3.3.tar.gz
cd global-6.3.3
./configure && make
make install && cd
cd ../
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +PluginInstall +qall
cd ~/.vim/bundle/vimproc.vim
make

