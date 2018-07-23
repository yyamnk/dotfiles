#!/usr/bin/env sh
#****************** bin/setup_python.sh *******************
# created: 2015-Feb-12
# Last Change: 2018-Jul-23.
#************************************************************

# get pyenv
echo 'checking pyenv ...'
if [ -e ${HOME}/.pyenv ]; then
    echo 'pyenv found.'
else
    echo 'pyenv not found. getting pyenv ...'
    if [ -e /usr/local/bin/brew -a ]; then
        brew install pyenv
    else
        git clone https://github.com/yyuu/pyenv.git ~/.pyenv
    fi
fi

# by miniconda
echo 'checking miniconda ...'
if [ `cat ~/.pyenv/version | grep 'miniconda'` ]; then
    echo 'miniconda found.'
else
    echo 'install miniconda ...'
    pyenv install miniconda3-3.16.0
    pyenv rehash
    pyenv global miniconda3-3.16.0
fi

# get packages
echo 'start install conda packages'
conda install \
    numpy \
    scipy \
    matplotlib \
    ipython \
    pandas \
    numba \
    cython \
    psycopg2 \
    sqlalchemy \
    statsmodels \
    seaborn \
    dill \
    Pillow
echo ''
echo 'start install pip packages'
pip install alembic
pip install restview # rst viewer. depending 'readme'
# check OSX bug for installing readme-0.6.0, http://bugs.python.org/issue24633
# to fix it,
# cd ~/.pyenv/versions/miniconda3-3.9.1/lib/python3.4/site-packages
# mv README README.txt
pip install pudb
pip install arrow # better datetime
pip install rq    # simple job-queue
# pip install git+https://github.com/Supervisor/supervisor.git # 4.0でpython3対応
pip install git+ssh://git@github.com/Supervisor/supervisor.git # via ssh
pip install peewee # simplo ORM
pip install GitPython
pip install click
pip install rq-dashboard
pip install prettyplotlib

# syntax
conda install pep8
pip install git+ssh://git@github.com/yyamnk/pyflakes.git

# scheduler -> use supervisor
# pip install APScheduler
# pip install python-daemon-3K

# evolutionary computation framework
pip install deap

# pip install git+https://github.com/sdispater/orator.git
