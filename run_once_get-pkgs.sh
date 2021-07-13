#!/usr/bin/env bash

GIT_DIR="$HOME/Downloads/git"
[ -d "$GIT_DIR" ] || mkdir -p "$GIT_DIR"
git clone git@github.com:CodePurble/i3-volume.git "$GIT_DIR"/i3-volume

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
        tdrop-git betterlockscreen-git\
}

sudo pacman -S --needed --noconfirm \
    base-devel git git-delta cmake exa bat \
    alacritty neovim python-pynvim \
    ranger pcmanfm gvfs gvfs-mtp \
    herbstluftwm \
    calcurse rofi \
    xorg xorg-xinit \
    feh sxiv zathura \
    intel-ucode nvidia nvidia-prime nvidia-utils nvidia-settings bbswitch \
    arduino-cli github-cli \

if ! which paru > /dev/null; then
    git clone https://aur.archlinux.org/paru.git "$GIT_DIR"/paru
    cd "$GIT_DIR"/paru
    makepkg -si
fi

paru_cmd


