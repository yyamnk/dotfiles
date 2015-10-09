#!/bin/bash
#****************** link_bins.sh *******************
# Created    : 2015-Oct-09
# Last Change: 2015-Oct-09.
#------------------------------------------------------------
# create symbolic link form bin/* to ~/bin/
#************************************************************

BINDIR=$HOME/.dotfiles/bin
ln -sf $BINDIR/proxy_on.sh $HOME/bin/
ln -sf $BINDIR/proxy_off.sh $HOME/bin/
ln -sf $BINDIR/split_3panes_h.sh $HOME/bin/

case "${OSTYPE}" in
# mac
darwin*)
    ln -sf $BINDIR/disable_keyboard.sh $HOME/bin/
    ln -sf $BINDIR/enable_keyboard.sh $HOME/bin/
    ln -sf $BINDIR/set_proxy_by_networksetup.sh $HOME/bin/
    ;;
esac
