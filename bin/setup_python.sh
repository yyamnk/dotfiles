#!/usr/bin/env sh
#****************** bin/setup_python.sh *******************
# created: 2015-Feb-12
# Last Change: 2019-Nov-28.
#************************************************************

# get anaconda
echo 'checking miniconda ...'
if [ -d $HOME/anaconda3/bin ]; then
    echo 'anaconda3 found.'
else
    echo 'wget anaconda ...'
    wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh \
      --no-check-certificate
    bash Anaconda3-5.2.0-Linux-x86_64.sh
fi

# get packages
echo 'start install conda packages'
conda config --append channels conda-forge
conda install \
    numpy \
    scipy \
    matplotlib \
    jupyter \
    ipython \
    pandas \
    numba \
    cython \
    psycopg2 \
    sqlalchemy \
    statsmodels \
    seaborn \
    dill \
    Pillow \
    redis \
    pep8 \
    alembic \
    arrow \
    rq \
    GitPython \
    supervisor \
    peewee \
    deap \


conda install pytorch torchvision -c pytorch

# echo ''
# echo 'start install pip packages'
# pip install restview # rst viewer. depending 'readme'
# check OSX bug for installing readme-0.6.0, http://bugs.python.org/issue24633
# to fix it,
# cd ~/.pyenv/versions/miniconda3-3.9.1/lib/python3.4/site-packages
# mv README README.txt
# pip install pudb

pip install --upgrade pip

# pip install peewee # simplo ORM, conda-forgeだと他のパッケージがダウングレードされる
pip install rq-dashboard
pip install prettyplotlib

# pip install git+https://github.com/sdispater/orator.git

# scheduler -> use supervisor
# pip install APScheduler
# pip install python-daemon-3K
