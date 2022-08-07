# /bin/zsh
# for macOS

# xcode setting
xcode-select --install

# ruby setting
brew install ruby
echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.bash_profile
brew install rbenv
rbenv init
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
rbenv install 2.6.3
rbenv global 2.6.3
echo "ruby test"
ruby -v

# jekyll install
sudo gem install --user-install bundler jekyll
sudo gem install jekyll-sitemap
sudo gem install pygments.rb
sudo gem install jekyll-paginate
bundle install --path vendor/cache
echo 'export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"' >> ~/.bash_profile
gem env

# gem 
sudo gem install bundler
sudo gem install -n /usr/local/bin/ jekyll

# Gemfile
sudo gem install jekyll-sitemap
sudo gem install jekyll-admin
sudo gem install github-pages

# bundle install 
bundle install
