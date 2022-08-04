
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

1. Install [homebrew](https://brew.sh) with 
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
```
2. Install [yadm](https://yadm.io) with `brew install yadm`
3. Clone the dot files repository `yadm clone https://github.com/jseanpatel/dotfiles`
4. Navigate to the repository and run `sudo sh bootstrap.sh`

### iTerm2 Configuration

1. Add [material design theme](https://github.com/MartinSeeler/iterm2-material-design) with *iTerm2 > Preferences > Profiles > Colors Tab > Color Presets > Import*
2. Select the file `material-design-colors.itermcolors` 
3. Select the *material-design-colors* from *Load Presets...*
4. Complete configuration wizard for [powerlevel10k](https://github.com/romkatv/powerlevel10k)

### Additional Tasks

1. Log in to every application downloaded with `brew cask`
2. Generate GitHub personal access token for commiting/pushing (update [yadm](https://yadm.io) if relevant)
3. Make Documents and Desktop folder read from iCloud with *System Preferences > Apple ID > iCloud > Check Desktop & Documents Folders > Done*
4. Sync iMessage between devices with *Messages > System Preferences > iMessage > Enable Message in iCloud*
5. Remove all apps from dock except [VSCode](https://code.visualstudio.com/), iMessage and [iTerm2](https://iterm2.com/), then adjust dock size.

## License

MIT License

Copyright (c) 2022 Jacob Patel

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.