#!/usr/bin/env bash
mode=$(optimus-manager --print-mode | cut -d: -f2 | xargs)

case $mode in
integrated)
	out="i"
	;;

nvidia)
	out="n"
	;;

hybrid)
	out="h"
	;;

*)
	out="󰇸"
	;;
esac
echo $out
