#!/usr/bin/env sh
#****************** karabiner/setup.sh *******************
# created: 2015-Feb-06
# Last Change: 2015-Feb-06.
#------------------------------------------------------------
# make symbolic links to ~/Library/Application\ Support/Karabiner/
#************************************************************

# check karabiner
KARABINER_DIR=$HOME'/Library/Application Support/Karabiner'

[ ! -e "${KARABINER_DIR}" ] && echo 'Karabiner is not found' && exit 1

# symbolic links
configs="${HOME}/.dotfiles/karabiner/*.xml"
for conf in ${configs}
do
    echo 'symbolic link '$conf
    ln -sf $conf "${KARABINER_DIR}"
done


# 設定を適用する
