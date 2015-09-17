#!/usr/bin/env sh
#****************** bin/setup_python.sh *******************
# created: 2015-Feb-12
# Last Change: 2015-Sep-17.
#************************************************************

brew install pyenv

# by miniconda
pyenv install miniconda3-3.9.1
pyenv rehash
pyenv global miniconda3-3.9.1

# get packages
conda install numpy scipy matplotlib ipython pandas
conda install numba cython
conda install psycopg2 sqlalchemy
pip install alembic
pip install restview # rst viewer
