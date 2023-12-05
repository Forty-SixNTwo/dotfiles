#!/usr/bin/env zsh

##  '##::::'##::'#######::'##::::'##:'########:'########::'########::'########:'##:::::'##:
##   ##:::: ##:'##.... ##: ###::'###: ##.....:: ##.... ##: ##.... ##: ##.....:: ##:'##: ##:
##   ##:::: ##: ##:::: ##: ####'####: ##::::::: ##:::: ##: ##:::: ##: ##::::::: ##: ##: ##:
##   #########: ##:::: ##: ## ### ##: ######::: ########:: ########:: ######::: ##: ##: ##:
##   ##.... ##: ##:::: ##: ##. #: ##: ##...:::: ##.... ##: ##.. ##::: ##...:::: ##: ##: ##:
##   ##:::: ##: ##:::: ##: ##:.:: ##: ##::::::: ##:::: ##: ##::. ##:: ##::::::: ##: ##: ##:
##   ##:::: ##:. #######:: ##:::: ##: ########: ########:: ##:::. ##: ########:. ###. ###::
##  ..:::::..:::.......:::..:::::..::........::........:::..:::::..::........:::...::...:::

EXTENSIONS=$HOME/.dotfiles/bin/homebrew/vscode_extensions
BREWFILE=$HOME/.dotfiles/bin/homebrew/Brewfile

# Install homebrew if not installed already
if command -v brew >/dev/null 2>&1; then
  echo "brew exists, skipping install"
else
  echo "brew doesn't exist, continuing with install"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install all packages in Brewfile
brew bundle --verbose --file=$BREWFILE

# Fuzzy finder completions
$(brew --prefix)/opt/fzf/install

# Set Root permissions
sudo xcodebuild -license accept
sudo xcodebuild -runFirstLaunch

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

# Install starship
curl -sS https://starship.rs/install.sh | /bin/bash

# Install VSCode extensions
cat $EXTENSIONS | xargs -L 1 code --install-extension

# Set permissions
chmod -R go-w "$(brew --prefix)/share"

# spacebar
brew services start spacebar

# Update upgrade and cleanup
brew update && brew upgrade && brew cleanup