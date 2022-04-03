#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar(s)
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    [[ $m == "HDMI-0" ]] && bar_name="secondary-i3" || bar_name="main-i3"
    echo "BARNAME:$bar_name"
    MONITOR=$m polybar -c $HOME/.config/polybar/config.ini --reload $bar_name &
done

echo 'Bar(s) launched...'
