#!/usr/bin/env zsh

##	'########:'##::::'##:'########:'##::::'##:'########::'######::
##	... ##..:: ##:::: ##: ##.....:: ###::'###: ##.....::'##... ##:
##	::: ##:::: ##:::: ##: ##::::::: ####'####: ##::::::: ##:::..::
##	::: ##:::: #########: ######::: ## ### ##: ######:::. ######::
##	::: ##:::: ##.... ##: ##...:::: ##. #: ##: ##...:::::..... ##:
##	::: ##:::: ##:::: ##: ##::::::: ##:.:: ##: ##:::::::'##::: ##:
##	::: ##:::: ##:::: ##: ########: ##:::: ##: ########:. ######::
##	:::..:::::..:::::..::........::..:::::..::........:::......:::
##  ##############################################################

THEMES="$HOME/.themes"
OH_MY_ZSH="$HOME/.oh-my-zsh"

while true; do
	echo "Preparing to install themes, would you like to proceed (y/n)?"

	read choice

  case $choice in
  	y)
			echo "Starting themes installation."
			if [[ -d $THEMES ]]; then
				echo "Themes directory already exists."
				if [[ -d "$THEMES/lib" ]]; then
					echo "Themes lib directory already exists."
				else
					echo "Creating themes lib directory."
					mkdir -p $THEMES/lib
				fi
			else
				echo "Creating themes directory."
				mkdir -p $THEMES
			fi

			# Iterm
			curl -sS https://raw.githubusercontent.com/dracula/iterm/master/Dracula.itermcolors -o $THEMES/Dracula.itermcolors
			# Terminal
			curl -sS https://raw.githubusercontent.com/dracula/terminal-app/master/Dracula.terminal -o $THEMES/Dracula.terminal
			# ZSH
			curl -sS https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme -o $THEMES/dracula.zsh-theme
			curl -sS https://raw.githubusercontent.com/dracula/zsh/master/lib/async.zsh -o $THEMES/lib/async.zsh
			ln -s $THEMES/dracula.zsh-theme $HOME/.oh-my-zsh/themes/dracula.zsh-theme

			break
			;;
		n)
			echo "Skipping themes installation."
			exit 0
			;;
    *)
			echo "Invalid input. Please enter 'y' or 'n'."
			;;
  esac
done