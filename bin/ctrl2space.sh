#!/bin/bash
#****************** ctrl2space.sh *******************
# Created    : 2017-Feb-26
# Last Change: 2017-Apr-11.
#------------------------------------------------------------
# https://github.com/alols/xcape
#************************************************************
if [ ! -e /usr/bin/xcape ]; then
    echo 'xcape is required.'
    exit 0
fi

# Map an keycode 255 to space.
# map keycode 65 (space) to Control_L, add Control
# set xcape as single shot Control_L send space
xmodmap -e 'keycode 255=space'
xmodmap -e 'keycode 65=Control_L'
xmodmap -e 'add Control = Control_L'

# run xcape when not already running
count=`ps aux | grep xcape | grep -v grep | wc -l`
if [ $count -eq 0 ]; then
    xcape -e '#65=space'
fi

# note
# this script reprace space key to Hyber_L.
# even if you kill xcape, the setting is remained.
# to fix it, restart xmodmap (simply, setxkbmap [us|dvorak]) is required.
