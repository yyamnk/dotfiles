#!/bin/bash
#****************** .dotfiles/bin/set_t460s.sh *******************
# Created    : 2017-Apr-06
# Last Change: 2018- 8月-22.
#************************************************************
sleep 3

# common xkb settings
$HOME/.dotfiles/bin/set_myxkb.sh

# replace Print to Super_R
# keycode 107 = Print Sys_Req Print Sys_Req
xmodmap -e 'keycode 107 = Super_R'  # #107 is print-screen key
