#!/usr/bin/env bash

case "$1" in

	spot) 		
    entry="com.spotify.Client" 		      ;;
	qpw) 		
    entry="qpwgraph"		                ;;
	BTOP) 		
    entry="alacritty -t BTOP -e bpytop" ;;
	keepassxc) 		
    entry="keepassxc"		                ;;
  pavucontrol) 		
    entry="pavucontrol"		
esac

xdotool search --onlyvisible --class "$1" windowunmap \
    || xdotool search --class "$1" windowmap \
    || $entry &
