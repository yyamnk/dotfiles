#!/bin/bash
#****************** .dotfiles/bin/rofi_launch.sh *******************
# Created    : 2017-Mar-30
# Last Change: 2017-Mar-30.
#------------------------------------------------------------
# http://malkalech.com/rofi_window_switcher
#************************************************************

options=(
    # mode
    -modi              'combi,calc:qalc -t,window,windowcd,run,drun,ssh'
    -show              'combi'

    # combi
    -combi-modi        'window,run,ssh'

    # Font
    -font              'Ubuntu 20'

    # Window
    -width             '80'
    -padding           '80'
    -lines             '10'
    -color-enabled     'true'
    -color-window      '#111111,#111111,#268bd2'
    -color-normal      '#111111,#ffffff,#111111,#268bd2,#ffffff'
    -color-active      '#111111,#268bd2,#111111,#268bd2,#000022'
    -color-urgent      '#111111,#f3843d,#111111,#268bd2,#ffc39c'

    -separator-style   'none'
    -opacity           '80'
    -hide-scrollbar

    # Keybindings
    -kb-cancel         'Escape,Control+g,Control+bracketleft,Control+c'
    -kb-mode-next      'Shift+Right,Control+Tab,Control+i'
)

rofi "$@" "${options[@]}"
