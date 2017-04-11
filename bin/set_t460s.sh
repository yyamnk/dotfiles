#!/bin/bash
#****************** .dotfiles/bin/set_t460s.sh *******************
# Created    : 2017-Apr-06
# Last Change: 2017-Apr-11.
#************************************************************
sleep 3

# PUT FIRST
# trackpoint sensitivity, speed setting
echo 255 | sudo /usr/bin/tee "/sys/devices/platform/i8042/serio1/serio2/speed" > /dev/null
echo 255 | sudo /usr/bin/tee "/sys/devices/platform/i8042/serio1/serio2/sensitivity" > /dev/null

sleep 2

# common xkb settings
$HOME/.dotfiles/bin/set_myxkb.sh

# replace menu to Super_R
xmodmap -e 'keycode 135 = Super_R'  # #135 is menu key (rigt click)
# replace Print to Super_R
# keycode 107 = Print Sys_Req Print Sys_Req
xmodmap -e 'keycode 107 = Super_R'  # #107 is print-screen key

# t460s disable touchpad
xinput disable 12
