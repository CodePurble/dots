#!/usr/bin/env bash

out="%{F#8FBCBB}  %{F-}"

if bluetoothctl show | grep -q "Powered: yes"; then
    if bluetoothctl info | grep -q "Connected: yes"; then
        out="%{F#434C5E}%{B#61C766}  %{B- F-}"
    else
        out="%{B#8FBCBB}%{F#434C5E}  %{B- F-}"
    fi
fi

echo $out
