#!/bin/bash

screens=($(xrandr | grep " connected" | awk '{print $1}'))

echo ${screens[0]}

case ${#screens[@]} in
	1)
		first=${screens[0]}
		second=${screens[0]}
		barlist="\"bar\""
		commentchar="#"
		xrandr --auto
		;;
	2)
		first=${screens[0]}
		second=${screens[1]}
		barlist="\"bar\",\"bar2\""
		commentchar=""
		xrandr --output HDMI-1-2 --auto --left-of eDP-1-1
		;;
esac

echo $first
echo $second
echo $commentchar
echo $barlist
cat .config/i3/config.template | sed "s/first_screen/$first/g" | sed "s/second_screen/$second/g" > .config/i3/config
cat .config/yabar/yabar.conf.template | sed "s/first_screen/$first/g" | sed "s/second_screen/$second/g" | sed "s/barlist/$barlist/g" | sed "s/commentchar/$commentchar/g" > .config/yabar/yabar.conf
