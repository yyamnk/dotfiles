#!/usr/bin/env sh
#****************** karabiner/setup.sh *******************
# created: 2015-Feb-06
# Last Change: 2015-Feb-26.
#------------------------------------------------------------
# make symbolic links to ~/Library/Application\ Support/Karabiner/
#************************************************************

# check karabiner
KARABINER_DIR=$HOME'/Library/Application Support/Karabiner'

[ ! -e "${KARABINER_DIR}" ] && mkdir "${KARABINER_DIR}"

# symbolic links
configs="${HOME}/.dotfiles/karabiner/*.xml"
for conf in ${configs}
do
    echo 'symbolic link '$conf
    ln -sf $conf "${KARABINER_DIR}/"
done
