#! /usr/bin/env bash
#****************** set_proxy_by_networksetup.sh *******************
# created: 2014/12/05
# Last Change:2015-Feb-05.
#
# MacのNetwork Locationでproxyを設定
# http://qiita.com/uetchy/items/b9991d1f86b23f4a184d
#************************************************************
switch_trigger="NUT" # network location

if [ "`networksetup -getcurrentlocation`" = "$switch_trigger" ];
then
    source "$DOTSDIR/bin/proxy_on.sh"
else
    source "$DOTSDIR/bin/proxy_off.sh"
fi
