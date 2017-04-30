#!/bin/bash
#****************** .dotfiles/bin/restart_network_ubuntu.sh *******************
# Created    : 2017-Apr-30
# Last Change: 2017-Apr-30.
#************************************************************

# sometimes, bluetooth tethering does not work after sleep.
# https://askubuntu.com/questions/761180/wifi-doesnt-work-after-suspend-after-16-04-upgrade

sudo systemctl restart network-manager.service
