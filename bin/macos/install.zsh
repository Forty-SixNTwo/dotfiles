#!/usr/bin/env zsh

##  '##::::'##::::'###:::::'######:::'#######:::'######::
##   ###::'###:::'## ##:::'##... ##:'##.... ##:'##... ##:
##   ####'####::'##:. ##:: ##:::..:: ##:::: ##: ##:::..::
##   ## ### ##:'##:::. ##: ##::::::: ##:::: ##:. ######::
##   ##. #: ##: #########: ##::::::: ##:::: ##::..... ##:
##   ##:.:: ##: ##.... ##: ##::: ##: ##:::: ##:'##::: ##:
##   ##:::: ##: ##:::: ##:. ######::. #######::. ######::
##  ..:::::..::..:::::..:::......::::.......::::......:::
##  #####################################################

WORK_DIR=$HOME/work

while true; do

	echo "Preparing to setup macOS, would you like to proceed (y/n)?"

	read choice

	case $choice in
	y)
		echo "Starting macOS Setup."
		# Instll PKL (Pickle) configuration lanaguage.
		if exists pkl; then
			echo "PKL already installed."
		else
			echo "Installing PKL."
			curl -L -o pkl https://github.com/apple/pkl/releases/download/0.25.2/pkl-macos-amd64
			chmod +x pkl
			./pkl --version
			sudo mv pkl $PKL_HOME
		fi

		osascript -e 'tell application "System Preferences" to quit'

		# Finder > View > Show Path Bar
		defaults write com.apple.finder ShowPathbar -bool true

		# Finder > Preferences > General > New Finder windows show:
		defaults write com.apple.finder NewWindowTarget -string 'PfLo'
		defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/.dotfiles"

		# System Preferences > Dock
		defaults write com.apple.dock magnification -bool true
		defaults write com.apple.dock tilesize -int 45
		defaults write com.apple.dock largesize -int 60
		defaults write com.apple.dock autohide -bool true
		defaults write com.apple.dock autohide-time-modifier -float 0.25
		defaults write com.apple.dock autohide-delay -float 0.1

		# System Preferences > Mission Control
		defaults write com.apple.dock.plist wvous-bl-corner -int 4
		defaults write com.apple.dock.plist wvous-tr-corner -int 2
		defaults write com.apple.dock.plist wvous-br-corner -int 3

		# Third-Party Software
		# --------------------

		# iTerm2 Settings
		curl -sS https://raw.githubusercontent.com/eieioxyz/dotfiles_macos/master/iterm2/com.googlecode.iterm2.plist -o $HOME/.dotfiles/source/iterm2/com.googlecode.iterm2.plist
		defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
		defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$HOME/.dotfiles/source/iterm2"
		defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile -bool true

		sudo /usr/sbin/DevToolsSecurity -enable
		sudo dscl . append /Groups/_developer GroupMembership $(whoami)

		if [[ -d $WORK_DIR ]]; then
			echo "Work directory already exists."
		else
			echo "Creating work directory."
			mkdir -p $WORK_DIR
		fi

		# Finish macOS Setup
		killall Finder
		killall Dock
		echo "macOS Setup Complete, A logout or restart might be necessary."
		break
		;;
	n)
		echo "Skipping macOS Setup."
		exit 0
		;;
	*)
		echo "Invalid input. Please enter 'y' or 'n'."
		;;
	esac
done
