#!/usr/bin/env zsh

##  '##::::::::::'###::::'##::: ##::'######:::'##::::'##::::'###:::::'######:::'########::'######::
##   ##:::::::::'## ##::: ###:: ##:'##... ##:: ##:::: ##:::'## ##:::'##... ##:: ##.....::'##... ##:
##   ##::::::::'##:. ##:: ####: ##: ##:::..::: ##:::: ##::'##:. ##:: ##:::..::: ##::::::: ##:::..::
##   ##:::::::'##:::. ##: ## ## ##: ##::'####: ##:::: ##:'##:::. ##: ##::'####: ######:::. ######::
##   ##::::::: #########: ##. ####: ##::: ##:: ##:::: ##: #########: ##::: ##:: ##...:::::..... ##:
##   ##::::::: ##.... ##: ##:. ###: ##::: ##:: ##:::: ##: ##.... ##: ##::: ##:: ##:::::::'##::: ##:
##   ########: ##:::: ##: ##::. ##:. ######:::. #######:: ##:::: ##:. ######::: ########:. ######::
##  ........::..:::::..::..::::..:::......:::::.......:::..:::::..:::......::::........:::......:::
##  ###############################################################################################

NODE=$HOME/.dotfiles/bin/languages/node.zsh
RUBY=$HOME/.dotfiles/bin/languages/ruby.zsh
PYTHON=$HOME/.dotfiles/bin/languages/python.zsh

while true; do

  echo "Preparing to install programming language modules and libraries, would you like to proceed (y/n)?"

  read choice

  case $choice in
  y)
    if exists "bun"; then
      echo "Bun.js runtime is already installed, skipping installation."
    else
      echo "Installing Bun.js runtime."
      curl -fsSL https://bun.sh/install | bash
      exec /usr/local/bin/zsh
    fi
    echo "Installing Global Node Modules."
    . $NODE

    echo "Installing Global Ruby Gems."
    . $RUBY

    echo "Installing Global Python Packages."
    . $PYTHON
    break
    ;;
  n)
    echo "Skipping programming language modules and libraries."
    exit 0
    ;;
  *)
    echo "Invalid input. Please enter 'y' or 'n'."
    ;;
  esac
done
