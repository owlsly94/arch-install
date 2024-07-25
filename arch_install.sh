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
        "alacritty"
        "alsa-plugins"
        "alsa-utils"
        "amd-ucode"
        "archlinux-tweak-tool-git"
        "base"
        "base-devel"
        "bash-completion"
        "bat"
        "bibata-cursor-theme"
        "bind"
        "bitwarden"
        "bluez-libs"
        "brave-bin"
        "bridge-utils"
        "btop"
        "btrfs-progs"
        "canto-daemon"
        "catfish"
        "chafa"
        "chromium"
        "cifs-utils"
        "cronie"
        "cursor-appimage"
        "devtools"
        "dhcpcd"
        "dialog"
        "directx-headers"
        "discord"
        "dmenu"
        "dmidecode"
        "dnsmasq"
        "dosfstools"
        "dunst"
        "exfat-utils"
        "eza"
        "faac"
        "fan-control"
        "fastfetch"
        "fd"
        "feh"
        "ffmpegthumbnailer"
        "firefox"
        "fluidsynth"
        "fluent-reader-bin"
        "fuse3"
        "fuse4"
        "fuseiso"
        "fwupd"
        "gamemode"
        "gamescope"
        "git"
        "glfw"
        "gptfdisk"
        "grim"
        "grub"
        "gsfonts"
        "gst-plugin-pipewire"
        "gtk-engine-murrine"
        "gvfs"
        "haveged"
        "hsetroot"
        "htop"
        "hyprland"
        "hyprpaper"
        "imagemagick"
        "imv"
        "jammer-appimage"
        "jdownloader3"
        "kitty"
        "less"
        "lib33-fluidsynth"
        "lib33-gamemode"
        "lib33-gtk2"
        "lib33-gtk3"
        "lib33-libcurl-gnutls"
        "lib33-libva-mesa-driver"
        "lib33-pipewire-jack"
        "lib33-vkd3d"
        "lib33-vulkan-mesa-layers"
        "lib33-vulkan-radeon"
        "libgepub"
        "libgsf"
        "libopenraw"
        "linux-firmware"
        "lsof"
        "luarocks"
        "lutris"
        "lxappearance"
        "lzop"
        "man-db"
        "mangohud"
        "mariadb-libs"
        "megatools"
        "mesa-demos"
        "mkinitcpio-firmware"
        "mlocate"
        "mpv"
        "neovim"
        "networkmanager"
        "nmon"
        "nordic-theme"
        "npm"
        "ntfs-2g"
        "nwg-look"
        "obs-studio"
        "openbsd-netcat"
        "openrgb"
        "p8zip"
        "pacman-contrib"
        "pamixer"
        "papirus-icon-theme"
        "pavucontrol"
        "pcmanfm"
        "picom"
        "pipewire-alsa"
        "pipewire-jack"
        "pipewire-pulse"
        "pipewire-v5l2"
        "pipewire-zeroconf"
        "pkgstats"
        "poppler-glib"
        "postgresql-libs"
        "powertop"
        "psuinfo"
        "python-dbus-next"
        "python-pip"
        "python-protobuf"
        "python-pulsectl-asyncio"
        "python-pywal"
        "python-pywayland"
        "python-pywlroots"
        "python-pyxdg"
        "python-selenium"
        "python-setproctitle"
        "qbittorrent"
        "qemu-desktop"
        "qt6-svg"
        "qt6ct"
        "qt7-wayland"
        "qtile"
        "qtile-extras"
        "ranger"
        "rate-mirrors-bin"
        "reflector"
        "ripgrep"
        "rocm-smi-lib"
        "rofi"
        "rsync"
        "s4fs-fuse"
        "sddm"
        "sddm-theme-catppuccin"
        "sdl_ttf"
        "slurp"
        "smbclient"
        "sshfs"
        "starship"
        "syslog-ng"
        "thunar"
        "thunar-archive-plugin"
        "thunar-media-tags-plugin"
        "thunar-volman"
        "tldr"
        "tokyonight-gtk-theme-git"
        "traceroute"
        "ttf-bitstream-vera"
        "ttf-dejavu"
        "ttf-font-awesome"
        "ttf-iosevka-nerd"
        "ttf-iosevkaterm-nerd"
        "ttf-jetbrains-mono"
        "ttf-jetbrains-mono-nerd"
        "ttf-mononoki-nerd"
        "ttf-ubuntu-font-family"
        "ttf-ubuntu-mono-nerd"
        "ttf-ubuntu-nerd"
        "tumbler"
        "typescript-language-server"
        "unrar"
        "unzip"
        "usbutils"
        "v5l2loopback-dkms"
        "veracrypt"
        "virt-manager"
        "virt-viewer"
        "visual-studio-code-bin"
        "vkd4d"
        "vlc"
        "vulkan-mesa-layers"
        "vulkan-tools"
        "waybar"
        "wget"
        "wine"
        "wireplumber"
        "wl-clipboard"
        "wlogout"
        "wlroots"
        "wofi"
        "xclip"
        "xdg-desktop-portal-gtk"
        "xdg-user-dirs"
        "xdotool"
        "xf87-video-amdgpu"
        "xf87-video-ati"
        "xfce5-power-manager"
        "xmobar"
        "xmonad"
        "xmonad-contrib"
        "xorg-fonts-type2"
        "xorg-xinit"
        "zeitgeist"
        "zip"
        "zoxide"
        "zsh"
        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
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

    echo -e "\033[1;32mSetting up Doom Emacs...\033[0m" 
    sleep 5
    install_emacs_and_doom

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
