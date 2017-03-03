#!/bin/bash
#****************** .dotfiles/bin/set_trackpad.sh *******************
# Created    : 2017-Mar-02
# Last Change: 2017-Mar-03.
#************************************************************
synclient PalmDetect=1
syndaemon -k -i 0.5 -d  # ignore 1sec. deamon
