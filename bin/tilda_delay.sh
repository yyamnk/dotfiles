#!/bin/bash
#****************** .dotfiles/bin/tilda_delay.sh *******************
# Created    : 2017-Mar-30
# Last Change: 2018- 8月-22.
#------------------------------------------------------------
# start tilda with delay for ubuntu-mate
#************************************************************
sleep 5s

if [ -f /usr/lib/ubuntu-mate/ubuntu-mate-tilda ]; then
  /usr/lib/ubuntu-mate/ubuntu-mate-tilda
else
  /usr/bin/tilda
fi
