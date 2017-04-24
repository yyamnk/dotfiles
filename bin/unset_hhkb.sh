#!/bin/bash
#****************** .dotfiles/bin/unset_hhkb.sh *******************
# Created    : 2017-Apr-24
# Last Change: 2017-Apr-24.
#------------
# for unset set_hhkb.sh
#************************************************************
sleep 3

# --- back to default for ESC and `
# defaults
# keycode   9 = Escape NoSymbol Escape
# keycode  49 = grave asciitilde grave asciitilde dead_grave dead_tilde dead_grave dead_tilde
xmodmap -e 'keycode   9 = Escape NoSymbol Escape'
xmodmap -e 'keycode  49 = grave asciitilde grave asciitilde dead_grave dead_tilde dead_grave dead_tilde'

# --- back to default for backspace and \
# default
# keycode  22 = BackSpace BackSpace BackSpace BackSpace
# keycode  51 = backslash bar backslash bar
xmodmap -e 'keycode 22 = BackSpace BackSpace BackSpace BackSpace'
xmodmap -e 'keycode 51 = backslash bar backslash bar'
