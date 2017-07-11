#!/bin/bash
#****************** /home/yyamnk/.dotfiles/bin/unset_myxkb.sh *******************
# Created    : 2017-Jun-28
# Last Change: 2017-Jun-28.
#************************************************************

# kill xcape
count=`ps aux | grep xcape | grep -v grep | wc -l`
if [ $count -ne 0 ]; then
    PID=$(ps aux | grep xcape | grep -v grep | awk '{print $2}')
    kill $PID
fi

# reset all xmodmap except shift:both_capslock
setxkbmap -option shift:both_capslock
xmodmap -e 'keycode 52 = colon semicolon'
