#!/usr/bin/env sh
#****************** bin/setup_python.sh *******************
# created: 2015-Feb-12
# Last Change: 2015-Jun-15.
#************************************************************

brew install python3
pip3 install --upgrade pip

pip3 install numpy
pip3 install scipy
pip3 install matplotlib
pip3 install ipython
# pip3 install virtualenv virtualenvwrapper
