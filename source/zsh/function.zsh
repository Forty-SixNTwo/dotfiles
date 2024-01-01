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

function mkcd() {
  mkdir -p "$@" && cd "$_"
}

function env_cleanup() {
  trash_developer='1'

  command sleep 1

  set -o xtrace

  trash_date="$(command date -u -- '+%Y%m%d')"_"$(command awk -- 'BEGIN {srand(); print srand()}')" \ 
  command mkdir -p -- "${HOME%/}"'/Library/Developer/Xcode/DerivedData' && command mv -- "${HOME%/}"'/Library/Developer/Xcode/DerivedData' "${HOME%/}"'/.Trash/Xcode-'"${trash_date-}" \ 
  command mkdir -p -- "${HOME%/}"'/Library/Developer/Xcode/UserData/IB Support' && command mv -- "${HOME%/}"'/Library/Developer/Xcode/UserData/IB Support' "${HOME%/}"'/.Trash/Xcode⁄UserData⁄IB Support-'"${trash_date-}" \ 
  command mkdir -p -- "${HOME%/}"'/Library/Caches/Homebrew/downloads' && command mv -- "${HOME%/}"'/Library/Caches/Homebrew/downloads' "${HOME%/}"'/.Trash/Homebrew-'"${trash_date-}" \ 
  exists brew && {
    command brew autoremove --verbose
    command brew cleanup --prune=all --verbose
  }
  {
    set +o xtrace
    unset -v -- trash_developer
    unset -v -- trash_date
  } 2>/dev/null

  printf '\n\n\360\237%s\232\256  data successfully trashed\n' "${trash_developer-}"
}
