#!/usr/bin/env bash
set -e

PACMAN_LIST="packages-pacman.txt"
AUR_LIST="packages-aur.txt"

if [[ $EUID -eq 0 ]]; then
  echo "❌ Do not run this script as root."
  exit 1
fi

echo "🔄 Updating system..."
sudo pacman -Syu --noconfirm

if [[ -f "$PACMAN_LIST" ]]; then
  echo "📦 Installing pacman packages..."
  sudo pacman -S --needed --noconfirm - < "$PACMAN_LIST"
else
  echo "⚠️ $PACMAN_LIST not found, skipping pacman packages."
fi

if [[ -f "$AUR_LIST" ]]; then
  echo "📦 Installing AUR packages..."
  paru -S --needed --noconfirm - < "$AUR_LIST"
else
  echo "⚠️ $AUR_LIST not found, skipping AUR packages."
fi

echo "✅ Package installation complete."

