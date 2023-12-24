#!/bin/sh

echo "----------------------------"
echo "Initiating setup. Let's get started..."
echo "----------------------------"

echo "Creating an SSH key for you..."
ssh-keygen -t rsa

echo "Installing xcode-stuff"
xcode-select --install

if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [ -f "$HOME/.Brewfile" ]; then
    echo "Updating Homebrew bundle"
    brew bundle --global
fi

echo "Installing Git..."
brew install git

echo "Configuring git..."
git config --global user.name "Jacob Patel"
git config --global user.email jseanpatel@gmail.com
git config --global push.autoSetupRemote true

echo "Installing other brew stuff..."
brew install tree
brew install wget
brew install nvm
brew install --cask keka

echo "Installing CLI's"
npm i -g twilio-cli
npm i -g postcss-cli
npm i -g dotenv-cli
npm i -g yarn
npm i -g eslint
npm i -g next
brew install gatsby-cli
brew install netlify-cli
brew install google-cloud-sdk
brew install withgraphite/tap/graphite
brew install mas


echo "Installing Eslint with Airbnb Style"
npm i -g eslint --save-dev
npm i -g eslint-config-airbnb --save-dev
npm i -g eslint-config-airbnb-base
npm i -g object.assign
npm i -g object.entries

echo "Installing Mac apps"

echo "Cleaning up brew"
brew cleanup

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

echo "Cleanup so Docker can be installed..."
brew remove docker

echo "Installing Rosetta in case of Apple chip..."
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# Apps
apps=(
  android-studio
  anki
  appcleaner
  arc
  bitwarden
  cleanshot
  dash
  discord
  docker
  figma
  firefox
  google-chrome
  intellij-idea
  insomnia
  iterm2
  lulu
  nordvpn
  notion
  obsidian
  orbstack
  raycast
  pixelsnap
  polypane
  screen-studio
  slack
  spotify
  steam
  sublime-merge
  sublime-text
  tableplus
  visual-studio-code
  warp
  zoom
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "Installing apps with Cask..."
brew install --appdir="/Applications" ${apps[@]}
brew cleanup

killall Finder

echo "Installing powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Adjust Mac system settings
# --------------------------

# 1. General UI/UX
# --------------------------

# Disable the sound effects on boot
sudo nvram StartupMute=%01

# Disable system sound effects
defaults write com.apple.systemsound "com.apple.sound.uiaudio.enabled" -int 0

# Adjust cursor speed
defaults write NSGlobalDomain KeyRepeat -int 1

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Show battery percentage
defaults -currentHost write com.apple.controlcenter.plist BatteryShowPercentage -bool true

# 2. Cleanup Dock
# --------------------------

# Make time for auto-hide/show of Dock 0.15 seconds
defaults write com.apple.dock autohide-time-modifier -float 0.10;killall Dock

# 3. Screenshots
# --------------------------

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

echo "----------------------------"
echo "Done with setup! Ready to go."
echo "----------------------------"