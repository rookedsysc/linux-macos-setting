#!/bin/bash
set -euo pipefail

# Abort if running as root (Homebrew on Linux must be installed as a non-root user)
if [ "${EUID:-$(id -u)}" -eq 0 ]; then
  echo "Error: run this script as a non-root user (brew does not support root)."
  exit 1
fi

# Prerequisites
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y build-essential procps curl file git ca-certificates

# Install Homebrew (Linux)
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Add brew to PATH (current session + future shells)
if [ -d "/home/linuxbrew/.linuxbrew" ]; then
  BREW_PREFIX="/home/linuxbrew/.linuxbrew"
elif [ -d "$HOME/.linuxbrew" ]; then
  BREW_PREFIX="$HOME/.linuxbrew"
else
  echo "Error: Homebrew prefix not found after install. Check installer output."
  exit 1
fi

eval "$("$BREW_PREFIX/bin/brew" shellenv)"

# Persist for future shells
grep -q 'brew shellenv' ~/.bashrc 2>/dev/null || echo "eval \"$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\"" >> ~/.bashrc
grep -q 'brew shellenv' ~/.zshrc  2>/dev/null || echo "eval \"$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\"" >> ~/.zshrc
grep -q 'brew shellenv' ~/.profile 2>/dev/null || echo "eval \"$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\"" >> ~/.profile

# Sanity check
brew --version || { echo "Error: brew not available after install"; exit 1; }

# Packages
brew update
brew install zsh python git wget curl ruby

# Upgrade pip (brew’s python)
python3 -m pip install --upgrade pip

# Rust/Cargo (non-interactive)
if ! command -v cargo >/dev/null 2>&1; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
fi

# SSH (skip systemd on containers without it)
if brew list --formula | grep -q '^openssh$'; then
  :
else
  brew install openssh
fi
if command -v systemctl >/dev/null 2>&1; then
  sudo systemctl enable ssh || true
  sudo systemctl start ssh || true
fi

# ZSH + oh-my-zsh
if command -v zsh >/dev/null 2>&1; then
  if command -v chsh >/dev/null 2>&1; then
    sudo chsh -s "$(command -v zsh)" "$USER" || true
  fi
else
  echo "Error: zsh install failed"
  exit 1
fi

export RUNZSH=no
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || true
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || true
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf || true
~/.fzf/install --all

# Config files (clone only if absent)
if [ ! -d "./Linux_MacOS_Setting" ]; then
  git clone https://github.com/rookedsysc/Linux_MacOS_Setting
fi
cd ./Linux_MacOS_Setting
cp .zshrc ~/.zshrc
cp .vimrc ~/.vimrc
cd ~

# Powerline fonts (optional)
python3 -m pip install --user git+https://github.com/powerline/powerline || true
wget -q https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O /tmp/PowerlineSymbols.otf || true
wget -q https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -O /tmp/10-powerline-symbols.conf || true
sudo mkdir -p /usr/share/fonts /etc/fonts/conf.d
[ -f /tmp/PowerlineSymbols.otf ] && sudo cp /tmp/PowerlineSymbols.otf /usr/share/fonts/ && fc-cache -vf || true
[ -f /tmp/10-powerline-symbols.conf ] && sudo cp /tmp/10-powerline-symbols.conf /etc/fonts/conf.d/ || true

# Utils
cargo install --locked zellij || true
brew install neovim lazygit || true

# Docker (skip if container/unsupported)
if command -v apt-get >/dev/null 2>&1; then
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
  sudo apt-get -y update
  sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || true
fi

# ZSH theme
mkdir -p ~/.oh-my-zsh/themes/spaceship
if [ ! -d ~/.oh-my-zsh/themes/spaceship/.git ]; then
  git clone https://github.com/spaceship-prompt/spaceship-prompt ~/.oh-my-zsh/themes/spaceship || true
fi
ln -sf ~/.oh-my-zsh/themes/spaceship/spaceship.zsh-theme ~/.oh-my-zsh/themes/spaceship.zsh-theme

# Checks
echo "[ OK ] brew => $(brew --version | head -n1)"
echo "[ OK ] zsh  => $(zsh --version)"
echo "Run: exec \$SHELL -l  (or open a new terminal) to load PATH"
