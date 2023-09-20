# /bin/bash
# Linux Setting for User ID

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
sudo apt-get install -y ruby

# ssh setting
sudo apt-get install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

# ZSH Setting
chsh -s /bin/zsh
RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
git clone https://github.com/rookedsysc/Linux_MacOS_Setting 
cd ./Linux_MacOS_Setting
cp .zshrc ~/.zshrc
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/bin"
cp .vimrc ~/.vimrc
source ~/.zshrc

# VIM Setting
# update Aug 16 21:00 / cuz ubuntu error
sudo apt-get install vim
sudo apt-get install vim-gui-common -y
sudo apt-get install vim-runtime -y
# update end
sudo apt-get install build-essential cmake python-dev silversearcher-ag -y
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

# Power Line Setting
sudo pip install git+git://github.com/Lokaltog/powerline
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/Loakaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf /usr/share/fonts
fc-cache -vf
mv 10-powerline-symbols.conf /etc/fonts/conf.d

# Setting Check
echo ""
echo "[*][*][*][*][*][*][*][*]"
echo "[*][*]SettingCheck[*][*]"
echo "[*][*][*][*][*][*][*][*]"
echo ""
echo "[!] PATH"
echo $PATH
echo "[!] Zsh Setting"
echo $SHELL
echo "[!] Power Line Setting"
which powerline

# ZSH Theme 
mkdir ~/.oh-my-zsh/themes/spaceship
git clone https://github.com/spaceship-prompt/spaceship-prompt ~/.oh-my-zsh/themes/spaceship
ln -s ~/.oh-my-zsh/themes/spaceship/spaceship.zsh-theme ~/.oh-my-zsh/themes/spaceship.zsh-theme

source ~/.zshrc
