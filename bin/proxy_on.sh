#!/bin/bash
#****************** proxy_on.sh *******************
# created: 2014/11/07
# Last Change:2017-Dec-15.
#************************************************************
echo "proxy enabling"

# PROXY=http://proxy.nagaokaut.ac.jp:8080
PROXY=http://proxy.cc.utsunomiya-u.ac.jp:8080
export http_proxy=$PROXY
export HTTP_PROXY=$http_proxy
export https_proxy=$http_proxy
export HTTPS_PROXY=$http_proxy
export ftp_proxy=$http_proxy
export FTP_PROXY=$http_proxy
export no_proxy=.local,169.254/16,127.0.0.1
export use_proxy=yes

ln -sf $HOME/.dotfiles/.wgetrc $HOME/.wgetrc
echo "linked wgetrc"

ln -sf $HOME/.dotfiles/.curlrc $HOME/.curlrc
echo "linked curlrc"

# git
git config --global http.proxy $PROXY
git config --global https.proxy $PROXY

# apt
if [ -e /etc/apt ]; then
    echo 'linking apt.conf'
    sudo ln -sf ~/.dotfiles/apt.conf /etc/apt/
fi
