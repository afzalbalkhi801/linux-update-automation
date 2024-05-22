#!/bin/bash

# Function to prompt for user confirmation
confirm() {
    while true; do
        read -p "$1 [y/n]: " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Update the package list
if confirm "Do you want to update the package list?"; then
    echo "Updating package list..."
    sudo apt-get update
else
    echo "Skipping update."
fi

# Upgrade all the installed packages
if confirm "Do you want to upgrade installed packages?"; then
    echo "Upgrading installed packages..."
    sudo apt-get upgrade -y
else
    echo "Skipping upgrade."
fi

# Optionally, upgrade distribution
if confirm "Do you want to upgrade the distribution?"; then
    echo "Upgrading the distribution..."
    sudo apt-get dist-upgrade -y
else
    echo "Skipping distribution upgrade."
fi

# Clean up any unnecessary packages and dependencies
if confirm "Do you want to clean up unnecessary packages and dependencies?"; then
    echo "Cleaning up..."
    sudo apt-get autoremove -y
    sudo apt-get clean
else
    echo "Skipping cleanup."
fi

echo "Script completed."
