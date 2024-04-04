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

BREWFILE=$HOME/.dotfiles/bin/homebrew/Brewfile

while true; do
	echo "Preparing to install Homebrew packages, would you like to proceed (y/n)?"

	read choice

	case $choice in
	y)
		echo "Starting homebrew installation."

		if exists brew; then
			echo "Homebrew is already installed, skipping installation."
		else
			echo "Installing Homebrew."
			/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		fi

		# Install all packages in Brewfile
		brew bundle --verbose --file=$BREWFILE

		# Set Root permissions
		sudo xcodebuild -license accept
		sudo xcodebuild -runFirstLaunch

		# Set permissions
		chmod -R go-w "$(brew --prefix)/share"

		# spacebar
		# brew services start spacebar

		# Update
		brew update --verbose

		# Upgrade
		brew upgrade --verbose

		# Cleanup
		brew cleanup --verbose

		# Remove all outdated versions
		brew cu --all --cleanup --yes
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
