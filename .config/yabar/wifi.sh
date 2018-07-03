#!/bin/bash

#nmcli d wifi | awk 'FNR==2{print $2 " - " $7}'
echo   $(nmcli d wifi | awk '/^\*/{print $2 " - " $7}')
