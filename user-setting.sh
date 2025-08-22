#!/bin/bash
# Ubuntu Setting for User ID using Homebrew

# Install Homebrew dependencies first
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y build-essential procps curl file git

# Install Homebrew on Linux
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
# Load Homebrew in current session
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"

# Install packages using Homebrew
brew install zsh
brew install python git
python3 -m pip install --upgrade pip
brew install wget curl 
brew install ruby
# Cargo / Rust Install 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.cargo/env

# ssh setting
brew install openssh
sudo systemctl enable ssh
sudo systemctl start ssh

# ZSH Setting
# Verify zsh installation before changing shell
if command -v zsh >/dev/null 2>&1; then
    sudo chsh -s $(which zsh) $USER
else
    echo "Error: zsh not found in PATH"
    exit 1
fi
RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
# Clone configuration files
if [ ! -d "./Linux_MacOS_Setting" ]; then
    git clone https://github.com/rookedsysc/Linux_MacOS_Setting 
fi
cd ./Linux_MacOS_Setting
cp .zshrc ~/.zshrc
cp .vimrc ~/.vimrc
cd ~

# Power Line Setting
python3 -m pip install git+https://github.com/powerline/powerline
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mkdir -p /usr/share/fonts
sudo cp PowerlineSymbols.otf /usr/share/fonts/
fc-cache -vf
sudo mkdir -p /etc/fonts/conf.d
sudo cp 10-powerline-symbols.conf /etc/fonts/conf.d/
rm -f PowerlineSymbols.otf 10-powerline-symbols.conf

# Utils
# Zellij
cargo install --locked zellij

# LazyVim
brew install neovim

# LazyGit
brew install lazygit

# Docker
sudo apt-get -y install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |\
  sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt-get -y update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

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
mkdir -p ~/.oh-my-zsh/themes/spaceship
git clone https://github.com/spaceship-prompt/spaceship-prompt ~/.oh-my-zsh/themes/spaceship
ln -sf ~/.oh-my-zsh/themes/spaceship/spaceship.zsh-theme ~/.oh-my-zsh/themes/spaceship.zsh-theme

echo "Note: Manual shell restart required after script completion"
