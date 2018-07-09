#!/bin/bash

num_full=$(python -c "import i3ipc; i3 = i3ipc.Connection(); print(len(i3.get_tree().find_fullscreen()))")

if [ $num_full -eq "0" ]; then
	revert() {
	  rm /tmp/*screen*.png
	  xset dpms 0 0 0
	}
	trap revert HUP INT TERM
	xset +dpms dpms 0 0 5
	scrot -d 1 /tmp/locking_screen.png
	convert -blur 0x8 /tmp/locking_screen.png /tmp/screen_blur.png
	convert -composite /tmp/screen_blur.png /home/pravinth/scripts/rick.png -gravity South -geometry -20x1200 /tmp/screen.png
	i3lock -i /tmp/screen.png
	revert
else
	xautolock -restart
fi
