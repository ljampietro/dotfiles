#!/bin/env bash
#
# bcn
# Bluetooth Connect 
# by https://github.com/Edesem
# using fzf instead of dmenu


    

device_amount=$(bluetoothctl devices | wc -l)
    
if [[ $device_amount = 1 ]]; then
	MAC=$(bluetoothctl devices | awk {'print $2'})
		[ -z $MAC ] && MAC=NoDeviceFound # Prevents accidental disconnect error
else
	select=$(bluetoothctl devices | awk {'print $3'} | fzf --height=20% --prompt='󰂱' --no-info --marker=' ' --pointer='' --layout=default --cycle --border=rounded --border-label='╢ Bluetooth Devices  ╟' --border-label-pos=bottom --margin=5 --padding=1)
	MAC=$(bluetoothctl devices | grep $select | awk {'print $2'}) 
		[ -z $MAC ] && MAC=NoDeviceFound # Prevents accidental disconnect error
fi

connect=$(bluetoothctl info $MAC | grep Connected: | awk '{print $2}')
if [[ $connect = no ]]; then 
	notify-send "Attempting to connect to $select"
	bluetoothctl connect $MAC || notify-send "Failed to Connect"
elif [[ $connect = yes ]]; then
	notify-send "Attempting to disconnect $select"
	bluetoothctl disconnect $MAC 
fi
