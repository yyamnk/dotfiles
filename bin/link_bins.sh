#!/bin/bash
#****************** link_bins.sh *******************
# Created    : 2015-Oct-09
# Last Change: 2018- 8月-23.
#------------------------------------------------------------
# create symbolic link form bin/* to ~/bin/
#************************************************************

BINDIR=$HOME/.dotfiles/bin
ln -sf $BINDIR/proxy_on.sh $HOME/bin/
ln -sf $BINDIR/proxy_off.sh $HOME/bin/
# ln -sf $BINDIR/split_3panes_h.sh $HOME/bin/
ln -sf $BINDIR/open_trello.sh $HOME/bin/
ln -sf $BINDIR/open_uu-staffpage.sh $HOME/bin/
ln -sf $BINDIR/open_contacts.sh $HOME/bin/
ln -sf $BINDIR/open_moodle.sh $HOME/bin/
ln -sf $BINDIR/open_calendar.sh $HOME/bin/
ln -sf $BINDIR/open_ncnu.sh $HOME/bin/
ln -sf $BINDIR/unset_myxkb.sh $HOME/bin/
ln -sf $BINDIR/diff-highlight $HOME/bin/

case "${OSTYPE}" in
# mac
darwin*)
    ln -sf $BINDIR/disable_keyboard.sh $HOME/bin/
    ln -sf $BINDIR/enable_keyboard.sh $HOME/bin/
    ln -sf $BINDIR/set_proxy_by_networksetup.sh $HOME/bin/
    ;;
esac
