#!/usr/bin/env sh
#****************** bin/setup_python.sh *******************
# created: 2015-Feb-12
# Last Change: 2015-Sep-08.
#************************************************************

brew install python3
brew install pyenv
pip3 install --upgrade pip

pip3 install numpy
pip3 install scipy
pip3 install matplotlib
pip3 install ipython
pip3 install pandas
pip3 install psycopg2
pip3 install sqlalchemy
# pip3 install virtualenv virtualenvwrapper
