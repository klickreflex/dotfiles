#!/bin/bash
set -euo pipefail

# Display message 'Setting up your Mac...'
echo "Setting up your Mac..."
sudo -v

# Oh My Zsh
echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# Clone Spaceship theme for zsh
if [ -d ~/.oh-my-zsh/custom/themes/spaceship-prompt ]; then
    echo "Theme is present, updating..."
    cd ~/.oh-my-zsh/custom/themes/spaceship-prompt && git pull
else
    git clone  --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt
fi

# Symlink spaceship.zsh-theme to your oh-my-zsh custom themes directory:
if [ -L ~/.oh-my-zsh/themes/spaceship.zsh-theme ]; then
    echo "Theme already symlinked, nothing to do."
else
    echo "Theme not yet symlinked, creating symlink..."
    ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/themes/spaceship.zsh-theme
fi


# Configure symlinks
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
rm ~/.ssh/config
ln -sf ~/.dotfiles/.ssh/config ~/.ssh/config
# rm ~/.gitconfig
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig



# Homebrew - Installation
echo "Installing Homebrew"

if test ! $(which brew); then
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
brew update

# Install Homebrew Packages
cd ~
echo "Installing Homebrew packages"

homebrew_packages=(
 "imagemagick"
 "mariadb"
 "php"
 "node"
 "mailhog"
 "mas"
 "pkg-config"
 "rbenv"
)

for homebrew_package in "${homebrew_packages[@]}"; do
 brew install "$homebrew_package"
done

# Install Casks
echo "Installing Homebrew cask packages"

# Add cask for PHP mon
brew tap homebrew/homebrew-cask

homebrew_cask_packages=(
  "1password"
  "raycast"
  "appcleaner"
  "around"
  "cleanmymac"
  "cleanshot"
  "discord"
  "figma"
  "firefox"
  "handbrake"
  "iconjar"
  "iina"
  "imageoptim"
  "iterm2"
  "loom"
  "microsoft-edge"
  "moneymoney"
  "mullvadvpn"
  "notion"
  "pocket-casts"
  "prizmo"
  "rectangle"
  "redis"
  "rightfont"
  "rowanj-gitx"
  "selfcontrol"
  "sequel-ace"
  "signal"
  "sipgate-softphone"
  "slack"
  "transmit"
  "visual-studio-code"
  "zoom"
)

for homebrew_cask_package in "${homebrew_cask_packages[@]}"; do
  brew install "$homebrew_cask_package"
done

# Install MAS apps
echo "Installing App Store apps"
mas install 824183456 #Affinity Photo
mas install 904280696 # Things
# mas install 1556313108 # Scan Thing
mas install 1499181666 # OwlOCR
mas install 1079833326 # Receipts
# mas install 1529448980 # Reeder
mas install 409183694 # Keynote
mas install 824171161 # Affinity Designer
# mas install 1487937127 # Craft
mas install 425424353  # The Unarchiver
mas install 1461456897 # Tyme
mas install 1495179755 # EasyLetter
mas install 1461650987 # Crouton
mas install 409201541 # Pages
mas install 1484348796 # Endel
mas install 1055511498 # Day One
mas install 1254981365 # Contrast
mas install 411643860 # DaisyDisk
mas install 408981434 # iMovie
mas install 409203825 # Numbers
mas install 1502111349 # PDF Squeezer
mas install 1365531024 # 1Blocker
mas install 775737590 # iA Writer
mas install 1532801185 # mymind
mas install 1491071483 # Tot

# Install Composer
echo "Installing Composer"
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
rm ~/.composer/config.json
ln -sf ~/.dotfiles/.composer/config.json ~/.composer/config.json
rm ~/.composer/composer.json
ln -sf ~/.dotfiles/.composer/composer.json ~/.composer/composer.json

# Install Global Composer Packages
echo "Installing Global Composer Packages"
/usr/local/bin/composer global require laravel/installer laravel/valet statamic/cli schmidfelix/ploi-cli

# Install Laravel Valet
echo "Installing Laravel Valet"
$HOME/.composer/vendor/bin/valet install
valet trust

# Create Sites directory
echo "Creating a Sites directory"
mkdir $HOME/www

# Start MySQL for the first time
echo "Starting MySQL for the first time"
brew services start mariadb

# Start Mailhog for the first time
echo "Starting Mailhog for the first time"
brew services start mailhog

# Configure Laravel Valet
cd ~/www
valet park && cd ~
echo "Configuring Laravel Valet"
cd ~
valet proxy mailhog http://127.0.0.1:8025
pecl install imagick
pecl install redis
valet restart

# Installing Global Node Dependecies
echo "Installing Global Node Dependecies"
npm install -g npm-check-updates

# Register the Global Gitignore file
git config --global core.excludesfile $HOME/.dotfiles/.gitignore_global

# Hide 'Last Logged In' in terminal
touch .hushlogin

# Hide 'Last Logged In' in terminal
touch .hushlogin

# Complete
echo "Installation Complete"
