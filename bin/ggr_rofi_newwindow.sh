#!/bin/bash
#****************** ggr_rofi_newwindow.sh *******************
# Created    : 2018-Feb-06
# Last Change: 2018-Feb-06.
#------------------------------------------------------------
# ggr via rofi
# simplified https://github.com/miroslavvidovic/rofi-scripts
# usage:
#   ggr_rofi.sh
#************************************************************

main() {
  query=$( (echo ) | rofi  -dmenu -fuzzy -location 0 -p "Query > " )
  if [[ -n "$query" ]]; then
    url="https://www.google.com/search?q="$query
    google-chrome --new-window "$url"
  else
    rofi -show -e "No query provided."
  fi
}

main

exit 0
