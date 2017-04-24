#!/bin/bash
#****************** .dotfiles/bin/set_hhkb.sh *******************
# Created    : 2017-Apr-24
# Last Change: 2017-Apr-24.
#************************************************************
sleep 3

# --- swap ESC and `
# defaults
# keycode   9 = Escape NoSymbol Escape
# keycode  49 = grave asciitilde grave asciitilde dead_grave dead_tilde dead_grave dead_tilde
xmodmap -e 'keycode   9 = grave asciitilde grave asciitilde'
xmodmap -e 'keycode  49 = Escape NoSymbol Escape'

# --- swap backspace and \
# default
# keycode  22 = BackSpace BackSpace BackSpace BackSpace
# keycode  51 = backslash bar backslash bar
xmodmap -e 'keycode 22 = backslash bar backslash bar'
xmodmap -e 'keycode 51 = BackSpace BackSpace BackSpace BackSpace'
