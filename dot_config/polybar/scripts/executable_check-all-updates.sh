#!/bin/sh
#source: https://github.com/polybar/polybar-scripts/blob/master/polybar-scripts/updates-pacman-aurhelper/updates-pacman-aurhelper.sh

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
    updates_aur=0
fi

if [ "$updates_arch" -gt 0 ]; then

updates=$(("$updates_arch" + "$updates_aur"))

if [ "$updates" -gt 0 ]; then
    if ! ps -aux | grep -E "[p]acman|[y]ay" > /dev/null; then
        echo "%{F#A3BE8C}$updates_arch, $updates_aur%{F-}"
    fi
else
    echo "0, 0"
fi
