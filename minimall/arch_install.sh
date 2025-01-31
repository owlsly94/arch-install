install_paru() {
    if ! command -v paru &> /dev/null; then
        echo -e "\033[1;33mparu is not installed. Installing paru...\033[0m"
        sleep 5
        sudo pacman -S --needed base-devel git
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si
        cd ..
        rm -rf paru
        echo -e "\033[1;32mparu installed successfully.\033[0m"
        sleep 5
    else
        echo -e "\033[1;32mparu is already installed.\033[0m"
        sleep 5
    fi
}

install_programs() {
    local programs=(
        "hyprland"
        "sddm"
        "wofi"
        "wlogout"
        "ttf-iosevka-nerd"
        "mangohud"
        "qbittorrent"
        "ranger"
        "waybar"
        "dunst"
        "alacritty"
        "kitty"
        "fastfetch"
        "noto-fonts-emoji"
        "zen-browser"
        "starship"
        "eza"
        "zoxide"
        "btop"
        "htop"
        "fzf"
        "rocm-smi-lib"
        "lsof"
        "strace"
        "bat"
        "devtools"
        "bibata-cursor-theme"
        "bitwarden"
        "discord"
        "grim"
        "hyprpaper"
        "hyprlock"
        "imv"
        "less"
        "mkinitcpio-firmware"
        "mpv"
        "nordic-theme"
        "nwg-look"
        "obs-studio"
        "papirus-icon-theme"
        "pavucontrol"
        "pcmanfm"
        "pyprland"
        "ranger"
        "rsync"
        "slurp"
        "sddm-theme-catppuccin"
        "thunar"
        "thunar-archive-plugin"
        "thunar-media-tags-plugin"
        "thunar-volman"
        "tldr"
        "tokyonight-gtk-theme-git"
        "unrar"
        "tumbler"
        "unzip"
        "visual-studio-code-bin"
        "wl-clipboard"
        "xdg-desktop-portal-gtk"
        "zip"
        "gtk-engine-murrine"
        "qt5ct"
        "fuse3"
        "fuse2"
        "fuseiso"
        "npm"
        "xboxdrv"
        "protonup-qt-bin"
        "goverlay"
        "mesa-utils"
        "vkbasalt"
        "heroic-games-launcher-bin"
        "linux-zen-headers"
        "mesa-git"
        "polkit-gnome"
        "jellyfin-media-player"
        "openrgb-bin"
        "i2c-dev"
        "python-smbus-git"
        "i2c-tools"
    )

    for program in "${programs[@]}"; do
        paru -S --noconfirm "$program"
    done
    echo -e "\033[1;32mAll programs installed successfully.\033[0m"
    sleep 5
}

setup_dotfiles() {
    local dotfiles_repo="https://github.com/owlsly94/dotfiles.git"
    local target_dir="$HOME/Downloads/dotfiles"

    git clone "$dotfiles_repo" "$target_dir"

    cp -r "$target_dir/.config" "$HOME/"
    cp "$target_dir/.zshrc" "$HOME/"
    echo -e "\033[1;32mDotfiles set up successfully.\033[0m"
    sleep 5
}

extract_tar_file() {
    local tar_file="$HOME/.config/zsh.tar.gz"

    if [[ ! -f $tar_file ]]; then
        echo -e "\033[1;31mTar file not found!\033[0m"
        sleep 5
        return 1
    fi

    tar -xzvf "$tar_file" -C "$HOME/.config"
    echo -e "\033[1;32mTar file extracted successfully.\033[0m"
    sleep 5
}

copy_sddm_conf() {
    local dotfiles_dir="$HOME/Downloads/dotfiles"

    if [[ ! -f "$dotfiles_dir/etc/sddm.conf" ]]; then
        echo -e "\033[1;31msddm.conf file not found in dotfiles!\033[0m"
        sleep 5
        return 1
    fi

    sudo cp "$dotfiles_dir/etc/sddm.conf" /etc/
    echo -e "\033[1;32msddm.conf copied to /etc/ successfully.\033[0m"
    sleep 5
}

install_emacs_and_doom() {

  echo -e "\033[1;32mInstalling Emacs...\033[0m"
  sleep 5
  paru -S --noconfirm emacs
  echo -e "\033[1;32mEmacs installed!\033[0m"
  sleep 5

  echo -e "\033[1;32mCloning Doom Emacs repo...\033[0m"
  sleep 5
  git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
  echo -e "\033[1;32mDoom Emacs repo cloned!\033[0m"
  sleep 5

  echo -e "\033[1;32mInstalling Doom Emacs...\033[0m"
  sleep 5
  ~/.emacs.d/bin/doom install
  echo -e "\033[1;32mEmacs and Doom Emacs installed successfully!\033[0m"
  sleep 5
}

change_shell() {

    if ! command -v zsh &> /dev/null; then
        echo -e "\033[1;31mZsh is not installed...\033[0m"
        sleep 5
        return 1
    fi

    SHELL=$(which zsh)
    export SHELL

    if [ ! -f ~/.zshrc ]; then
        echo -e "\033[1;31m.zshrc not found...\033[0m"
        sleep 5
        return 1
    fi
}

run_doom_sync() {
    echo -e "\033[1;32mRunnning doom sync...\033[0m"
    sleep 5
    doom sync
}

main() {
    echo -e "\033[1;32mChecking if paru is installed...\033[0m"
    sleep 5
    install_paru

    echo -e "\033[1;32mInstalling programs...\033[0m"
    sleep 5
    install_programs

    echo -e "\033[1;32mSetting up dotfiles...\033[0m"
    sleep 5
    setup_dotfiles

    echo -e "\033[1;32mExtracting zsh.tar.gz...\033[0m"
    sleep 5
    extract_tar_file

    echo -e "\033[1;32mCopying sddm.conf to /etc/...\033[0m"
    sleep 5
    copy_sddm_conf

#    echo -e "\033[1;32mSetting up Doom Emacs...\033[0m" 
#    sleep 5
#    install_emacs_and_doom

    change_shell
    echo -e "\033[1;32mSheel changed to zsh successfully!\033[0m"
    sleep 5

    run_doom_sync
    echo -e "\033[1;32mDoom emacs synced successfully!\033[0m"
    sleep 5

    echo -e "\033[1;32mAll tasks completed successfully!\033[0m"
    sleep 10
}

main
