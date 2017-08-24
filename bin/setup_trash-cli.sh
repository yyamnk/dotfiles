#!/bin/bash
#****************** bin/setup_trash-cli.sh *******************
# Created    : 2017-Aug-24
# Last Change: 2017-Aug-24.
#------------------------------------------------------------
# install trash-cli, required python
#************************************************************
cd ~/usr/local
git clone https://github.com/andreafrancia/trash-cli.git
cd trash-cli
python setup.py install --user
