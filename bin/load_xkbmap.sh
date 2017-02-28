#!/bin/sh

if [ -s $HOME/.xkb/keymap/yyamnk ]
then
    sleep 1
    # xkbcomp -I$HOME/.xkb $HOME/.xkb/keymap/mykbd $DISPLAY 2>/dev/null
    xkbcomp $HOME/.xkb/keymap/yyamnk $DISPLAY 2>/dev/null
    xkbcomp -I$HOME/.xkb $HOME/.xkb/keymap/yyamnk $DISPLAY 2>/dev/null
fi
