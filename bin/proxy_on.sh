#!/bin/bash
#****************** proxy_on.sh *******************
# created: 2014/11/07
# Last Change:2015-Feb-09.
#
# --- abst ---
# nut proxyをonにする.
#************************************************************
export http_proxy=http://proxy.nagaokaut.ac.jp:8080/
export HTTP_PROXY=$http_proxy
export https_proxy=$http_proxy
export HTTPS_PROXY=$http_proxy
export ftp_proxy=$http_proxy
export FTP_PROXY=$http_proxy
export no_proxy=.local,169.254/16,10.10.10.10,127.0.0.1
export use_proxy=yes

echo "NUT proxy enable"

if [ -e ~/.wgetrc ]; then
    echo "wgetrc exist"
else
    ln -sf ~/Dropbox/dotfiles/.wgetrc ~/.wgetrc
    echo "linked wgetrc"
fi
