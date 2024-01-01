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

OH_MY_ZSH=$HOME/.oh-my-zsh
OH_MY_ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
FZF=$HOME/.fzf.zsh
BASHTOP=$HOME/.bashtop

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

    if [[ -d $OH_MY_ZSH ]]; then
      echo "oh-my-zsh already installed"
    else
      echo "Installing oh-my-zsh"
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    if [[ -d $OH_MY_ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]]; then
      echo "zsh-syntax-highlighting already installed"
    else
      echo "Installing zsh-syntax-highlighting"
      git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $OH_MY_ZSH_CUSTOM/plugins/zsh-syntax-highlighting
    fi

    if [[ -d $OH_MY_ZSH_CUSTOM/plugins/zsh-autosuggestions ]]; then
      echo "zsh-autosuggestions already installed"
    else
      echo "Installing zsh-autosuggestions"
      git clone https://github.com/zsh-users/zsh-autosuggestions $OH_MY_ZSH_CUSTOM/plugins/zsh-autosuggestions
    fi

    if [[ -d $FZF ]]; then
      echo "fzf completions already installed"
    else
      echo "Installing fzf completions"
      $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
    fi

    if [[ -d $BASHTOP ]]; then
      echo "bashtop already installed"
    else
      git clone https://github.com/aristocratos/bashtop.git $HOME/.bashtop
      cd $HOME/.bashtop
      sudo make install
      cd "${pwd}"
    fi

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
