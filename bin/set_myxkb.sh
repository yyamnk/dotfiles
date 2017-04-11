#!/bin/bash
#****************** .dotfiles/bin/set_myxkb.sh *******************
# Created    : 2017-Feb-28
# Last Change: 2017-Apr-11.
#************************************************************
setxkbmap -option shift:both_capslock

$HOME/.dotfiles/bin/ctrl2space.sh  # xmodemap and xcape
# do not use setxkbmap after the script.
# xcape does not work well.

# replace ; and :
# keycode  52 = semicolon colon semicolon colon
xmodmap -e 'keycode 52 = colon semicolon'

#-------------------------------------------------------#
# vim-binding with left of a
#-------------------------------------------------------#
xmodmap -e 'clear lock'
xmodmap -e 'keycode 66 = Mode_switch'  # #66 is capslock

# expression
# keycode XX = key shift+key mode_switch+key mode_switch+shift+key

# default values
# keycode  43 = d D d D  # qwty h
xmodmap -e 'keycode 43 = d D Left'  # qwty h
# keycode  44 = h H h H  # qwty j
xmodmap -e 'keycode 44 = h H Down'
# keycode  45 = t T t T  # qwty k
xmodmap -e 'keycode 45 = t T Up'
# keycode  46 = n N n N  # qwty l
xmodmap -e 'keycode 46 = n N Right'
