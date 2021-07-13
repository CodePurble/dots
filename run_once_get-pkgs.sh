#!/usr/bin/env bash

sudo pacman -S --needed --noconfirm \
    base-devel git git-delta ninja cmake meson exa bat \
    alacritty neovim python-pynvim \
    feh sxiv zathura maim xclip \
    networkmanager network-manager-applet \
    xfce4-power-manager \
    ranger pcmanfm gvfs gvfs-mtp \
    herbstluftwm \
    calcurse rofi \
    xorg xorg-xinit lxsession \
    xf86-video-intel intel-ucode \
    nvidia nvidia-prime nvidia-utils nvidia-settings bbswitch \
    arduino-cli github-cli

[ -d $HOME/Pictures ] || mkdir $HOME/Pictures
if ! [ -d "$HOME/Pictures/wallpapers" ]; then
    git clone git@github.com:CodePurble/wallpapers.git $HOME/Pictures/wallpapers # private sorry :P
fi

GIT_DIR="$HOME/Downloads/git"
[ -d "$GIT_DIR" ] || mkdir -p "$GIT_DIR"

if ! which volume; then
    git clone git@github.com:CodePurble/i3-volume.git "$GIT_DIR"/i3-volume
fi

if ! which picom; then
    git clone https://github.com/yshui/picom.git "$GIT_DIR"/picom
    cd "$GIT_DIR"/picom \
        && meson --buildtype=release . build \
        && ninja -C build \
        && sudo ninja -C build install
fi

paru_cmd() {
    paru -S --noconfirm --needed \
        optimus-manager-git \
        polybar \
        nerd-fonts-jetbrains-mono \
        nerd-fonts-cascadia-code \
        nerd-fonts-fantasque-sans-mono \
        nerd-fonts-ubuntu-mono \
        zsh-theme-powerlevel10k-git \
        zsh-fast-syntax-highlighting-git \
        tdrop-git betterlockscreen-git
}

if ! which paru > /dev/null; then
    if ! [-d "$GIT_DIR/paru"]; then
        git clone https://aur.archlinux.org/paru.git "$GIT_DIR"/paru
        cd "$GIT_DIR"/paru
        makepkg -si
    fi
fi

paru_cmd

