#!/usr/bin/env zsh

##  '########::'######::'##::::'##:
##  ..... ##::'##... ##: ##:::: ##:
##  :::: ##::: ##:::..:: ##:::: ##:
##  ::: ##::::. ######:: #########:
##  :: ##::::::..... ##: ##.... ##:
##  : ##::::::'##::: ##: ##:::: ##:
##   ########:. ######:: ##:::: ##:
##  ........:::......:::..:::::..::
###################################

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

while true; do

  echo "Preparing to setup ZSH, would you like to proceed (y/n)?"
    
  read choice

  case $choice in
    y)
      echo "Starting ZSH Setup."

      if grep -Fxq '/usr/local/bin/zsh' '/etc/shells'; then
        echo '/usr/local/bin/zsh already exists in /etc/shells'
      else
        echo "Enter superuser (sudo) password to edit /etc/shells"
        echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null
      fi

      if [ "$SHELL" = '/usr/local/bin/zsh' ]; then
        echo '$SHELL is already /usr/local/bin/zsh'
      else
        echo "Enter user password to change login shell"
        chsh -s '/usr/local/bin/zsh'
      fi

      if sh --version | grep -q zsh; then
        echo '/private/var/select/sh already linked to /bin/zsh'
      else
        echo "Enter superuser (sudo) password to symlink sh to zsh"
        sudo ln -sfv /bin/zsh /private/var/select/sh
      fi

      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

      git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

      git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

      break
      ;;
    n)
      echo "Skipping ZSH Setup."
      exit 0
      ;;
    *)
      echo "Invalid input. Please enter 'y' or 'n'."
      ;;
  esac
done