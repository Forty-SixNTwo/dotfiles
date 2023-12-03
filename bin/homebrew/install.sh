#!/usr/bun/env zsh

# Install homebrew if not installed already
if ! command -v brew &> /dev/null
then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install all packages in Brewfile
brew bundle install --file=$HOME/.dotfiles/Brewfile

# Update upgrade and cleanup
brew update && brew upgrade && brew cleanup