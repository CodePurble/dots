#!/usr/bin/env bash

# Workaround for herbstluftwm xbacklight problem
# @param inc increase brightness
# @param dec decrease brightness

cd /sys/class/backlight
TARGET="intel_backlight"
MAX="$(cat ${TARGET}"/max_brightness")"
CURRENT="$(cat ${TARGET}"/brightness")"
STEPS="12000"

if [ -w "./"$TARGET"/brightness" ]; then
    if [[ $1 == "inc" ]]; then
        (( CURRENT += $STEPS ))
    fi

    if [[ $1 == "dec" ]]; then
        (( CURRENT -= $STEPS ))
    fi

    if [[ $CURRENT -gt $MAX ]];then
        exit;
    fi
    if  [[ $CURRENT -lt 1 ]]; then
        CURRENT = 0
    fi
    echo "$CURRENT" > "${TARGET}/brightness"
else
    echo "Set $(pwd)/$TARGET to 777 permissions"
    # gksu -S chmod 777 "./"$TARGET"/brightness"
fi
