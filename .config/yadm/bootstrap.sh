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

echo "Installing other brew stuff..."
brew install tree
brew install wget
brew install nvm

echo "Installing CLI's"
npm i -g twilio-cli
npm i -g postcss-cli
npm i -g dotenv-cli
brew install gatsby-cli
brew install netlify-cli
brew install google-cloud-sdk
brew install mas
brew install next

echo "Installing Eslint with Airbnb Style"
npm i eslint --save-dev
npm i eslint-config-airbnb --save-dev
npm i eslint-config-airbnb-base
npm i object.assign
npm i object.entries

echo "Installing Mac apps"
mas "Wipr", id: 1320666476

echo "Cleaning up brew"
brew cleanup

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

# Apps
apps=(
  anki
  appcleaner
  bitwarden
  docker
  enpass
  figma
  firefox
  google-chrome
  intellij-idea
  iterm2
  nordvpn
  notion
  slack
  spotify
  sublime-merge
  sublime-text
  tableplus
  vscodium
  zoom
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew install --appdir="/Applications" ${apps[@]}
brew cleanup

killall Finder

# Clone all public repos from personal account
cd ~/Documents/

CNTX={users}; NAME={jseanpatel}; PAGE=1
curl "https://api.github.com/$CNTX/$NAME/repos?page=$PAGE&per_page=100" |
  grep -e 'git_url*' |
  cut -d \" -f 4 |
  xargs -L1 git clone

# Clone all public repos from treetoplearning
CNTX={orgs}; NAME={treetoplearning}; PAGE=1
curl "https://api.github.com/$CNTX/$NAME/repos?page=$PAGE&per_page=100" |
  grep -e 'git_url*' |
  cut -d \" -f 4 |
  xargs -L1 git clone

# Clone all public repos from ladderdesigns
CNTX={orgs}; NAME={ladderdesigns}; PAGE=1
curl "https://api.github.com/$CNTX/$NAME/repos?page=$PAGE&per_page=100" |
  grep -e 'git_url*' |
  cut -d \" -f 4 |
  xargs -L1 git clone

# Clone the iTerm2 Material Design palette
git clone https://github.com/MartinSeeler/iterm2-material-design

# Clone the powerlevel10k repo
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/Documents/powerlevel10k

# Adjust Mac system settings
# --------------------------

# 1. General UI/UX
# --------------------------

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Disable system sound effects
defaults write com.apple.systemsound "com.apple.sound.uiaudio.enabled" -int 0

# Adjust cursor speed
defaults write NSGlobalDomain KeyRepeat -int 1

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# 2. Screen
# --------------------------

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

echo "----------------------------"
echo "Done with setup! Ready to go."
echo "----------------------------"
