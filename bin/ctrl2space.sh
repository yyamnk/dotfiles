#!/bin/bash
#****************** ctrl2space.sh *******************
# Created    : 2017-Feb-26
# Last Change: 2017-Feb-27.
#------------------------------------------------------------
# https://github.com/alols/xcape
#************************************************************
if [ ! -e /usr/bin/xcape ]; then
    echo 'xcape is required.'
    exit 0
fi

sleep 2  # for autostart

# Map an unused modifier's keysym to the spacebar's keycode and make it a
# control modifier. It needs to be an existing key so that emacs won't
# spazz out when you press it. Hyper_L is a good candidate.
spare_modifier="Hyper_L"  # unused key
xmodmap -e "keycode 65 = $spare_modifier"  # key code 65 is space
xmodmap -e "remove mod4 = $spare_modifier" # hyper_l is mod4 by default
xmodmap -e "add Control = $spare_modifier"

# Map space to an unused keycode (to keep it around for xcape to
# use).
xmodmap -e "keycode any = space"

# Finally use xcape to cause the space bar to generate a space when tapped.
exec /usr/bin/xcape -e "$spare_modifier=space"

# note
# this script reprace space key to Hyber_L.
# even if you kill xcape, the setting is remained.
# to fix it, restart xmodmap (simply, setxkbmap [us|dvorak]) is required.
