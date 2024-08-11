#!/usr/bin/env zsh

##  '########:'##::::'##:'##::: ##::'######::'########:'####::'#######::'##::: ##:
##   ##.....:: ##:::: ##: ###:: ##:'##... ##:... ##..::. ##::'##.... ##: ###:: ##:
##   ##::::::: ##:::: ##: ####: ##: ##:::..::::: ##::::: ##:: ##:::: ##: ####: ##:
##   ######::: ##:::: ##: ## ## ##: ##:::::::::: ##::::: ##:: ##:::: ##: ## ## ##:
##   ##...:::: ##:::: ##: ##. ####: ##:::::::::: ##::::: ##:: ##:::: ##: ##. ####:
##   ##::::::: ##:::: ##: ##:. ###: ##::: ##:::: ##::::: ##:: ##:::: ##: ##:. ###:
##   ##:::::::. #######:: ##::. ##:. ######::::: ##::::'####:. #######:: ##::. ##:
##  ..:::::::::.......:::..::::..:::......::::::..:::::....:::.......:::..::::..::
##  ##############################################################################

# Print a message to stdout
out() {
  printf %s\\n "$*"
}

# Create a new directory and enter it
function mkcd() {
  out "Creating directory..."
  mkdir -p "$@" && cd "$_"
}

# Initialize Yabai
function init_yabai() {
  out "Initializing Yabai..."
  echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa"
  yabai --start-service
  skhd --start-service
}

# Clear all file permissions
function clear_permissions() {
  out "Clearing all file permissions..."
  /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -seed -r -domain local -domain system -domain user && killall Finde
  command find -- . ! -path '*/.*' -type d -exec chmod -- 755 '{}' '+'
  command find -- . ! -path '*/.*' -type f -exec chmod -- 644 '{}' '+'
}

function brew_fix() {
  out "Attempting to fix Homebrew..."
  brew --config
  brew --prefix
  brew update
  brew upgrade
  cd /usr/local/Homebrew && git stash -u && git clean -d -f
  brew doctor
}

function update() {
  out "Updating dotfiles..."
  bash -c "$DOTFILES/install"
}
