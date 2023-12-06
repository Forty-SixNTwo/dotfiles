#!/usr/bin/env zsh

##  '##::::::::::'###::::'##::: ##::'######:::'##::::'##::::'###:::::'######:::'########::'######::
##   ##:::::::::'## ##::: ###:: ##:'##... ##:: ##:::: ##:::'## ##:::'##... ##:: ##.....::'##... ##:
##   ##::::::::'##:. ##:: ####: ##: ##:::..::: ##:::: ##::'##:. ##:: ##:::..::: ##::::::: ##:::..::
##   ##:::::::'##:::. ##: ## ## ##: ##::'####: ##:::: ##:'##:::. ##: ##::'####: ######:::. ######::
##   ##::::::: #########: ##. ####: ##::: ##:: ##:::: ##: #########: ##::: ##:: ##...:::::..... ##:
##   ##::::::: ##.... ##: ##:. ###: ##::: ##:: ##:::: ##: ##.... ##: ##::: ##:: ##:::::::'##::: ##:
##   ########: ##:::: ##: ##::. ##:. ######:::. #######:: ##:::: ##:. ######::: ########:. ######::
##  ........::..:::::..::..::::..:::......:::::.......:::..:::::..:::......::::........:::......:::

NODE=$HOME/.dotfiles/bin/languages/node.zsh
export ASDF_PYTHON_PATCH_URL="https://github.com/python/cpython/commit/8ea6353.patch?full_index=1"
export ASDF_RUBY_BUILD_VERSION=master

while true; do

  echo "Preparing to install programming languages, would you like to proceed (y/n)?"

  read choice

  case $choice in
      y)
        # Install Node.JS
        echo "Starting Node.JS installation."

        if command -v node >/dev/null 2>&1; then
          echo "Node.js exists, skipping install"
        else
          asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
          
          echo "Input a version of Node.js to install, or press enter to install the latest version."
          read version
          if [[ -z "$version" ]]; then
            asdf install nodejs latest
            asdf global nodejs latest
            source $NODE
          else
            asdf install nodejs $version
            asdf global nodejs $version
            source $NODE
          fi
        fi

        # Install Go
        echo "Starting Go installation."

         if command -v go >/dev/null 2>&1; then
          echo "Go exists, skipping install"
         else
          asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
          
          echo "Input a version of Go to install, or press enter to install the latest version."
          read version
          if [[ -z "$version" ]]; then
            asdf install golang latest
            asdf global golang latest
          else
            asdf install golang $version
            asdf global golang $version
          fi
        fi

        # Install Rust
        echo "Starting Rust installation."

        if command -v python >/dev/null 2>&1; then
          echo "Rust exists, skipping install"
        else
          asdf plugin add rust https://github.com/code-lever/asdf-rust.git
          
          echo "Input a version of Rust to install, or press enter to install the latest version."
          read version
          if [[ -z "$version" ]]; then
            asdf install rust latest
            asdf global rust latest
          else
            asdf install rust $version
            asdf global rust $version
          fi
        fi
        
        # Install Java
        echo "Starting Java installation."

        if command -v python >/dev/null 2>&1; then
          echo "Java exists, skipping install"
        else
          asdf plugin add java https://github.com/halcyon/asdf-java.git
          
          echo "Input a version of Java to install, or press enter to install the latest version."
          read version
          if [[ -z "$version" ]]; then
            asdf install java latest
            asdf global java latest
          else
            asdf install java $version
            asdf global java $version
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