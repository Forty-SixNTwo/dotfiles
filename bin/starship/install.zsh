#!/usr/bin/env zsh

# Install Starship
curl -sS https://starship.rs/install.sh | sh

# Setup shell integration
eval "$(starship init zsh)"
