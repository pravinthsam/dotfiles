#! /bin/bash

export XDG_RUNTIME_DIR=/run/user/1000

current_battery=$(cat /sys/class/power_supply/BAT0/energy_now)
total_battery=$(cat /sys/class/power_supply/BAT0/energy_full)
perc=0
let perc=current_battery*100/total_battery

if [ $perc -lt 25 ]
then
	/usr/bin/notify-send "Battery Low"
fi
