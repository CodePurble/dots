#!/usr/bin/env bash
mode=$(envycontrol -q)

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
