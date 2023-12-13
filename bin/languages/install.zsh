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

      # Install Ruby
      echo "Starting Ruby installation."

      if command -v ruby >/dev/null 2>&1; then
        echo "Ruby exists, skipping install"
      else
        asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git
          
        echo "Input a version of Ruby to install, or press enter to install the latest version."
        
        read version
          
        if [[ -z "$version" ]]; then
          asdf install ruby latest
          asdf global ruby latest
          sudo chown -R $USER /Library/Ruby/Gems/
          source $RUBY
        else
          asdf install ruby $version
          asdf global ruby $version
          sudo chown -R $USER /Library/Ruby/Gems/
          source $RUBY
        fi
      fi

      # Install Rust
      echo "Starting Rust installation."

      if command -v rustc >/dev/null 2>&1; then
        echo "Rust exists, skipping install"
      else
        asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git
          
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

      if command -v java >/dev/null 2>&1; then
        echo "Java exists, skipping install"
      else
        asdf plugin-add java https://github.com/halcyon/asdf-java.git
          
        echo "Input a version of Java to install, or press enter to install the latest version."
          
        read version
          
        if [[ -z "$version" ]]; then
          asdf install java latest:adoptopenjdk-11
          asdf global java latest:adoptopenjdk-11
        else
          asdf install java $version
          asdf global java $version
        fi
      fi

      # Install Python
      echo "Starting Python installation."

      if command -v python3 >/dev/null 2>&1; then
        echo "Python exists, skipping install"
      else
        asdf plugin-add python

        echo "Input a version of Python to install, or press enter to install the latest version."
          
        read version

        if [[ -z "$version" ]]; then
          asdf install python latest
          asdf global python latest
          source $PYTHON
        else
          asdf install python $version
          asdf global python $version
          source $PYTHON
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