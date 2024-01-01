#!/usr/bin/env bash

##  :'######::'########::::'###::::'########:::'######::'##::::'##:'####:'########::
##  '##... ##:... ##..::::'## ##::: ##.... ##:'##... ##: ##:::: ##:. ##:: ##.... ##:
##   ##:::..::::: ##:::::'##:. ##:: ##:::: ##: ##:::..:: ##:::: ##:: ##:: ##:::: ##:
##  . ######::::: ##::::'##:::. ##: ########::. ######:: #########:: ##:: ########::
##  :..... ##:::: ##:::: #########: ##.. ##::::..... ##: ##.... ##:: ##:: ##.....:::
##  '##::: ##:::: ##:::: ##.... ##: ##::. ##::'##::: ##: ##:::: ##:: ##:: ##::::::::
##  . ######::::: ##:::: ##:::: ##: ##:::. ##:. ######:: ##:::: ##:'####: ##::::::::
##  :......::::::..:::::..:::::..::..:::::..:::......:::..:::::..::....::..:::::::::
##  ################################################################################

while true; do
	echo "Preparing to install starship prompt, would you like to proceed (y/n)?"

	read choice

	case $choice in
	y)
		echo "Starting starship installation."
		curl -sS https://starship.rs/install.sh | sh
		break
		;;
	n)
		echo "Skipping starship installation."
		exit 0
		;;
	*)
		echo "Invalid input. Please enter 'y' or 'n'."
		;;
	esac
done
