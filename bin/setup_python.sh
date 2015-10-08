#!/usr/bin/env sh
#****************** bin/setup_python.sh *******************
# created: 2015-Feb-12
# Last Change: 2015-Oct-09.
#************************************************************

# get pyenv
if [ -e /usr/local/bin/brew ]; then
    brew install pyenv
else
    git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi

# by miniconda
if [ -e ${HOME}/.pyenv/version ]; then
    pyenv install miniconda3-3.16.0
    pyenv rehash
    pyenv global miniconda3-3.16.0
fi

# get packages
conda install numpy scipy matplotlib ipython pandas
conda install numba cython
conda install psycopg2 sqlalchemy
pip install alembic
pip install restview # rst viewer. depending 'readme'
# check OSX bug for installing readme-0.6.0, http://bugs.python.org/issue24633
# to fix it,
# cd ~/.pyenv/versions/miniconda3-3.9.1/lib/python3.4/site-packages
# mv README README.txt
pip install pudb
pip install arrow # better datetime
pip install rq    # simple job-queue
pip install rq-dashboard
pip install git+https://github.com/Supervisor/supervisor.git # 4.0でpython3対応
