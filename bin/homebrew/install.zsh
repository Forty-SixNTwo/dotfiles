#!/usr/bin/env zsh

# Install homebrew if not installed already
if exists brew; then
  echo "brew exists, skipping install"
else
  echo "brew doesn't exist, continuing with install"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install all packages in Brewfile
brew bundle --verbose --file=$HOME/.dotfiles/bin/homebrew/Brewfile

# Set Root permissions
sudo xcodebuild -license accept
sudo xcodebuild -runFirstLaunch

# Install VSCode extensions
cat $HOME/.dotfiles/bin/homebrew/vscode_extensions | xargs -L 1 code --install-extension

# Set permissions
chmod -R go-w "$(brew --prefix)/share"

# Update upgrade and cleanup
brew update && brew upgrade && brew cleanup