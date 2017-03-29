#!/bin/bash
#****************** ctrl2space.sh *******************
# Created    : 2017-Feb-26
# Last Change: 2017-Mar-29.
#------------------------------------------------------------
# https://github.com/alols/xcape
#************************************************************
if [ ! -e /usr/bin/xcape ]; then
    echo 'xcape is required.'
    exit 0
fi

sleep 2  # for autostart

# Map an keycode 255 to space.
# map keycode 65 (space) to Control_L, add Control
# set xcape as single shot Control_L send space
xmodmap -e 'keycode 255=space'
xmodmap -e 'keycode 65=Control_L'
xmodmap -e 'add Control = Control_L';
xcape -e '#65=space'

# note
# this script reprace space key to Hyber_L.
# even if you kill xcape, the setting is remained.
# to fix it, restart xmodmap (simply, setxkbmap [us|dvorak]) is required.
