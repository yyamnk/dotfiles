#!/bin/bash
#****************** .dotfiles/bin/rofi_file.sh *******************
# Created    : 2020-Dec-09
# Last Change: 2020-Dec-09.
#------------------------------------------------------------
# https://github.com/gotbletu/shownotes/blob/master/rofi_locate.md
#************************************************************

# locate home | rofi -threads 0 -width 80 -dmenu -i -p "locate:" | xargs -r -0 xdg-open
locate home | rofi -threads 0 -width 80 -opacity 80 -dmenu -i -p "locate:" | xargs -r xdg-open
