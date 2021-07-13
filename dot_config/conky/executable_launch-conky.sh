#!/usr/bin/env bash

current="$(optimus-manager --print-mode | awk '{print $5}')"
current="$(echo $current | xargs)" # Remove leading newline

# Terminate already running conky instances
killall -q conky

# Wait until the processes have been shut down
while pgrep -u $UID -x conky >/dev/null; do sleep 1; done

if [[ "$current" == "intel" ]]; then
	conky -c "$HOME/.config/conky/conky.conf"
else
	conky -c "$HOME/.config/conky/conky-nvidia.conf"
fi
