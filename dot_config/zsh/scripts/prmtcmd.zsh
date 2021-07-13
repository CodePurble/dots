#!/usr/bin/env zsh

# Set window title to be the path to current working dir
case ${TERM} in
	xterm*|rxvt*|Eterm|alacritty|aterm|kterm|gnome*)
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s\007" "${PWD/#$HOME/~}"'
		;;
	screen*)
		PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s\007" "${PWD/#$HOME/~}"'
		;;
esac

promptCmd() { eval "$PROMPT_COMMAND" }
precmd_functions=(promptCmd $precmd_functions)


