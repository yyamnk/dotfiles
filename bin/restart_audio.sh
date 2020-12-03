#!/bin/bash
#****************** bin/restart_audio.sh *******************
# Created    : 2020-Nov-27
# Last Change: 2020-Nov-27.
#************************************************************

# work for 18.04 LTS
pulseaudio --kill; pulseaudio --start
