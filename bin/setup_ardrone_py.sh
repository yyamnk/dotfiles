#!/bin/bash
#****************** setup_ardrone_py.sh *******************
# created: 2015-Apr-09
# Last Change: 2015-Apr-09.
#------------------------------------------------------------
# see
# https://bitbucket.org/pygame/pygame/issue/82/homebrew-on-leopard-fails-to-install#comment-627494
#************************************************************

brew install libvorbis sdl sdl_image sdl_mixer sdl_ttf portmidi
brew install mercurial
# activate virtual env or use sudo:
pip install hg+http://bitbucket.org/pygame/pygame
