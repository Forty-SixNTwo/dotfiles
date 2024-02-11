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

# Create a new directory and enter it
function mkcd() {
  mkdir -p "$@" && cd "$_"
}

# Initialize Yabai
function init_yabai() {
  echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa"
  yabai --start-service
  skhd --start-service
}

# Clear all file permissions
function clear_permissions() {
  /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -seed -r -domain local -domain system -domain user && killall Finde
  command find -- . ! -path '*/.*' -type d -exec chmod -- 755 '{}' '+'
  command find -- . ! -path '*/.*' -type f -exec chmod -- 644 '{}' '+'
}
