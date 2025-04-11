#!/usr/bin/env bash

case "$1" in

WhatsApp)
  entry="vivaldi-stable --profile-directory=Default --app-id=hnpfjngllnobngcgfapefoaidbinmjnm"
  ;;
# easyeffects)
#        entry="easyeffects"
#        ;;
# BTOP)
#        entry="alacritty -t BTOP -e bpytop"
esac
# wzrun="vivaldi-stable --profile-directory=Default --app-id=hnpfjngllnobngcgfapefoaidbinmjnm"

xdotool --enable-xwayland search --onlyvisible --name "$1" windowminimize ||
  xdotool --enable-xwayland search --name "$1" windowactivate ||
  $entry &
