#!/bin/bash

if xrandr | grep "HDMI-1-2 connected"; then
  echo "Monitor found"
  xrandr --output HDMI-1-2 --auto --left-of eDP-1-1
else
  echo "Monitor not found"
fi
