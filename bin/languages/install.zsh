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

  echo "Preparing to install programming languages, would you like to proceed (y/n)?"

  read choice

  case $choice in
  y)
    # Install Node.JS
    echo "Starting Node.JS installation."

    if exists node; then
      echo "Node.js exists, skipping install"
    else

      echo "Input a version of Node.js to install, or press enter to install the latest version."

      read version

      if [[ -z "$version" ]]; then

        . $NODE
      else

        . $NODE
      fi
    fi

    # Install Go
    echo "Starting Go installation."

    if exists go; then
      echo "Go exists, skipping install"
    else

      echo "Input a version of Go to install, or press enter to install the latest version."

      read version

      if [[ -z "$version" ]]; then

      else

      fi
    fi

    # Install Ruby
    echo "Starting Ruby installation."

    if exists ruby; then
      echo "Ruby exists, skipping install"
    else

      echo "Input a version of Ruby to install, or press enter to install the latest version."

      read version

      if [[ -z "$version" ]]; then

        . $RUBY
      else

        . $RUBY
      fi
    fi

    # Install Rust
    echo "Starting Rust installation."

    if exists rustc; then
      echo "Rust exists, skipping install"
    else

      echo "Input a version of Rust to install, or press enter to install the latest version."

      read version

      if [[ -z "$version" ]]; then

      else

      fi
    fi

    # Install Java
    echo "Starting Java installation."

    if exists java; then
      echo "Java exists, skipping install"
    else

      echo "Input a version of Java to install, or press enter to install the latest version."

      read version

      if [[ -z "$version" ]]; then

      else

      fi
    fi

    # Install Python
    echo "Starting Python installation."

    if exists python3; then
      echo "Python exists, skipping install"
    else

      echo "Input a version of Python to install, or press enter to install the latest version."

      read version

      if [[ -z "$version" ]]; then

        . $PYTHON
      else

        . $PYTHON
      fi
    fi
    break
    ;;
  n)
    echo "Skipping programming languages."
    exit 0
    ;;
  *)
    echo "Invalid input. Please enter 'y' or 'n'."
    ;;
  esac
done
