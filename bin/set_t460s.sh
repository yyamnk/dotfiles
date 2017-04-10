#!/bin/bash
#****************** .dotfiles/bin/set_t460s.sh *******************
# Created    : 2017-Apr-06
# Last Change: 2017-Apr-10.
#************************************************************
sleep 10

# PUT FIRST
# trackpoint sensitivity, speed setting
echo 255 | sudo /usr/bin/tee "/sys/devices/platform/i8042/serio1/serio2/speed" > /dev/null
echo 255 | sudo /usr/bin/tee "/sys/devices/platform/i8042/serio1/serio2/sensitivity" > /dev/null

sleep 2

# common xkb settings
$HOME/.dotfiles/bin/set_myxkb.sh

# t460s disable touchpad
xinput disable 12
