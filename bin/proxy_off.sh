#!/bin/bash
#****************** proxy_off.sh *******************
# created: 2014/11/08
# Last Change:2015-Feb-03.
#
# --- abst ---
# nut proxy off
#************************************************************
unset http_proxy
unset HTTP_PROXY
unset https_proxy
unset HTTPS_PROXY
unset ftp_proxy
unset FTP_PROXY
unset no_proxy
export use_proxy=no

echo "NUT proxy disable"

# check file exist -e
[ -e ~/.wgetrc ] && unlink ~/.wgetrc && echo "wgetrc is deleted"
