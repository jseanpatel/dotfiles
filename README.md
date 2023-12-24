# dotfiles

*Setup script for Mac after format*

## Table of Contents
- [Description](#description)
- [Setup Instructions](#setup-instructions)
- [License](#license)

## Description

The setup script for my Mac after a format.

## Setup Instructions

The following are a checklist of tasks to be completed after every format:

### General Bootstrap

1. Install [homebrew](https://brew.sh) with `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

    - Run these two commands in your terminal to add Homebrew to your PATH:

    ```bash
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/jseanpatel/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    ```

2. Navigate to the home directory with `cd ~`
3. Install [yadm](https://yadm.io) with `brew install yadm`
4. Clone the dot files repository `yadm clone https://github.com/jseanpatel/dotfiles`
5. Navigate to the repository and run `sh bootstrap.sh`


### Terminal Configuration

Pick one of the following configurations

#### iTerm2

1. Add [material design theme](https://github.com/MartinSeeler/iterm2-material-design) with *iTerm2 > Preferences > Profiles > Colors Tab > Color Presets > Import*
2. Select the file `material-design-colors.itermcolors` 
3. Select the *material-design-colors* from *Load Presets...*
4. Complete configuration wizard for [powerlevel10k](https://github.com/romkatv/powerlevel10k)


#### Warp

### IDE Configuration

#### VSCode

1. Login to GitHub on VSCode, and sync extensions

### Launcher Configuration

#### Raycast

1. Set Raycast as [default launcher](https://www.s-ndr.be/wiki/replace-spotlight-with-raycast/)

### Additional Tasks

1. Open and configure [Lulu](https://objective-see.org/products/lulu.html)
2. Follow security steps listed [here](https://www.bejarano.io/hardening-macos/)
3. Additional iCloud setup

    - Make Documents and Desktop folder read from iCloud with *System Settings > Apple ID > iCloud > Check Desktop & Documents Folders > Done*
    - Go to iMessages and enable messages in iCloud

4. Log in to every application downloaded with `brew cask`. Then go and install these applicaitons manually:

    - Install [Xnapper](https://xnapper.com/)
    - Install [Padlet](https://padlet.com/mac-app-download)

5. Generate GitHub personal access token for commiting/pushing (update [yadm](https://yadm.io) if relevant)
6. Remove all apps from dock except [VSCode](https://code.visualstudio.com/), iMessage and [Warp](https://www.warp.dev/), then adjust dock size
7. Set Pixelsnap hotkey to `⌘ + Shift + X`  
8. Open Obsidian, and disable from backing up to iCloud Drive (for local folder, choose a non-synced directory)
9. Load up a game of [Seterra](https://www.geoguessr.com/vgp/3007) and enjoy your new computer

## License

MIT License

Copyright (c) 2023 Jacob Patel

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
