#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get all possible displays
allposs=$(xrandr -q | grep "connected")

# Get all connected screens.
screens=$(echo "$allposs" | awk '/ connected/ {print $1}')

# Launch bar(s)
if [ "$(echo "$screens" | wc -l)" -lt 2 ]; then
	polybar main -c ~/.config/polybar/config.ini &
else
	polybar main -c ~/.config/polybar/config.ini &
	polybar main_external -c ~/.config/polybar/config.ini &
fi

echo 'Bars launched...'
