#!/bin/bash

# Check if paru is installed, if not, install it
if ! command -v paru &> /dev/null; then
    echo "paru is not installed. Installing paru..."
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ..
    rm -rf paru
fi

# Check if the file exists
if [ ! -f installed_packages.txt ]; then
    echo "Error: File 'installed_packages.txt' not found."
    exit 1
fi

# Read each line from the file and install the packages
while read -r package; do
    paru -S --noconfirm "$package"
done < installed_packages.txt

echo "Packages installation completed."
