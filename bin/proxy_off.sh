#!/bin/bash
#****************** proxy_off.sh *******************
# created: 2014/11/08
# Last Change:2017-Apr-06.
#************************************************************
echo "proxy disabling"

unset http_proxy
unset HTTP_PROXY
unset https_proxy
unset HTTPS_PROXY
unset ftp_proxy
unset FTP_PROXY
unset no_proxy
export use_proxy=no

# check file exist -e
[ -e ~/.wgetrc ] && unlink ~/.wgetrc && echo "wgetrc is deleted"
[ -e ~/.curlrc ] && unlink ~/.curlrc && echo "curlrc is deleted"

# git
# git config --global --unset http.proxy  # it keeps entry
git config --global --remove-section http
# git config --global --unset https.proxy  # it keeps entry
git config --global --remove-section https

# ssh
[ -e ~/.ssh/config ] && unlink ~/.ssh/config && echo "ssh/config is deleted"

# apt
[ -e /etc/apt/apt.conf ] && \
    sudo unlink /etc/apt/apt.conf && \
    echo 'apt.conf is deleted'
