#!/usr/bin/env zsh

while true; do
    echo "Preparing to install dracula themes, would you like to proceed (y/n)?"

    read choice

    case $choice in
        y)
            echo "Starting dracula themes installation."
            curl -sS https://starship.rs/install.sh | sh
            break
            ;;
        n)
            echo "Skipping dracula themes installation."
            exit 0
            ;;
        *)
            echo "Invalid input. Please enter 'y' or 'n'."
            ;;
    esac
done