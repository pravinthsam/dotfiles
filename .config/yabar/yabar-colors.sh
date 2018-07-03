#!/bin/bash

source ~/.cache/wal/colors.sh

config=$(cat ~/.config/yabar/yabar.conf)

config=$(echo "$config" \
	| sed "s~0x00000000~0xD8${color0: -6}~g" \
	| sed "s~0xFFFFFF~0x${color2: -6}~g" \
	)

echo "$config" >/tmp/yabar.conf
