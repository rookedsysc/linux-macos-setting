# Use OS: Ubuntu 20.04
# /bin/bash
# Reference: https://velog.io/@ilcm96/install-jekyll-on-ubuntu

# apt-get update
sudo apt-get update
sudo apt-get -y install ruby

# Setting
sudo apt-get install ruby-full build-essential zlib1g-dev -y
sudo gem install jekyll bundler
bundle install

# sudo 없이 gem 쓰기 위해서
mkdir .gems
export GEM_HOME="$HOME/.gems"
export PATH="$HOME/.gems/bin:$PATH"

# Gem needed for minimal mistakes
sudo gem install jekyll-algolia
sudo gem install jekyll-paginate
sudo gem install jekyll-sitemap
sudo gem install jekyll-gist
sudo gem install jekyll-feed
sudo gem install jekyll-include-cache

# Setting Test
echo "[*][*][*][*][*][*][*][*]"
echo "[*][*]SettingCheck[*][*]"
echo "[*][*][*][*][*][*][*][*]"
ruby -v
jekyll serve

