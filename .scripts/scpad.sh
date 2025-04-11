#!/usr/bin/env bash

case "$1" in

scralacritty)
	entry="alacritty -t scralacritty"
	;;
FM)
	entry="alacritty -t FM -e ranger"
	;;
BTOP)
	entry="alacritty -t BTOP -e bpytop"
	;;
SPT)
	entry="alacritty -t SPT -e spt"
	;;
fullacritty)
	entry="alacritty -t fullacritty -e tmux"
	;;
	# easyeffects)
	#   entry="easyeffects"                 ;;
esac

xdotool search --onlyvisible --name "$1" windowunmap ||
	xdotool search --name "$1" windowmap ||
	$entry &
