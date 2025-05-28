#!/bin/bash

set -e  # Exit on any error

# Function to install yay if it's missing
install_yay() {
    echo "yay not found. Installing yay..."
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
}

# Check for yay
if ! command -v yay &> /dev/null; then
    install_yay
else
    echo "yay is already installed."
fi

# Check if packages.txt exists
if [ ! -f packages.txt ]; then
    echo "Error: packages.txt not found in current directory."
    exit 1
fi

# Install packages listed in packages.txt
echo "Installing packages from packages.txt..."
yay -S --noconfirm --needed $(<packages.txt)
echo "All packages installed."

