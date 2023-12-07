#!/usr/bin/env zsh

##  '##::::'##::'#######::'##::::'##:'########:'########::'########::'########:'##:::::'##:
##   ##:::: ##:'##.... ##: ###::'###: ##.....:: ##.... ##: ##.... ##: ##.....:: ##:'##: ##:
##   ##:::: ##: ##:::: ##: ####'####: ##::::::: ##:::: ##: ##:::: ##: ##::::::: ##: ##: ##:
##   #########: ##:::: ##: ## ### ##: ######::: ########:: ########:: ######::: ##: ##: ##:
##   ##.... ##: ##:::: ##: ##. #: ##: ##...:::: ##.... ##: ##.. ##::: ##...:::: ##: ##: ##:
##   ##:::: ##: ##:::: ##: ##:.:: ##: ##::::::: ##:::: ##: ##::. ##:: ##::::::: ##: ##: ##:
##   ##:::: ##:. #######:: ##:::: ##: ########: ########:: ##:::. ##: ########:. ###. ###::
##  ..:::::..:::.......:::..:::::..::........::........:::..:::::..::........:::...::...:::
##  #######################################################################################

EXTENSIONS=$HOME/.dotfiles/bin/homebrew/vscode_extensions
BREWFILE=$HOME/.dotfiles/bin/homebrew/Brewfile

while true; do
	echo "Preparing to install Homebrew packages, would you like to proceed (y/n)?"

	read choice

	case $choice in
		y)
			echo "Starting homebrew installation."
			
			if command -v brew >/dev/null 2>&1; then
				echo "brew exists, skipping install"
			else
				echo "brew doesn't exist, continuing with install"
				/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
			fi

			# Install all packages in Brewfile
			brew bundle --verbose --file=$BREWFILE

			# Set Root permissions
			sudo xcodebuild -license accept
			sudo xcodebuild -runFirstLaunch

			# Install VSCode extensions
			cat $EXTENSIONS | xargs -L 1 code --install-extension

			# Set permissions
			chmod -R go-w "$(brew --prefix)/share"

			# spacebar
			brew services start spacebar

			# Update
			brew update --verbose

			# Upgrade
			brew upgrade --verbose

			# Cleanup
			brew cleanup --verbose
			break
			;;
		n)
			echo "Skipping Homebrew installation."
			exit 0
			;;
		*)
			echo "Invalid input. Please enter 'y' or 'n'."
			;;
	esac
done