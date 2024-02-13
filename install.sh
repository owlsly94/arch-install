#!/bin/bash

# Check if yay is installed
if ! command -v yay &> /dev/null; then
    echo "yay is not installed. Please install yay first."
    exit 1
fi

# Check if the file exists
if [ ! -f installed_packages.txt ]; then
    echo "Error: File 'installed_packages.txt' not found."
    exit 1
fi

# Read each line from the file and install the packages
while read -r package; do
    yay -S --noconfirm "$package"
done < installed_packages.txt

echo "Packages installation completed."

