#!/usr/bin/env sh
#****************** karabiner/setup.sh *******************
# created: 2015-Feb-06
# Last Change: 2015-Feb-09.
#------------------------------------------------------------
# make symbolic links to ~/Library/Application\ Support/Karabiner/
#************************************************************

# check karabiner
KARABINER_DIR=$HOME'/Library/Application Support/Karabiner'

[ ! -e "${KARABINER_DIR}" ] && mkdir $KARABINER_DIR

# symbolic links
configs="${HOME}/.dotfiles/karabiner/*.xml"
for conf in ${configs}
do
    echo 'symbolic link '$conf
    ln -sf $conf "${KARABINER_DIR}"
done


# 以前の設定を適用するか
read -p "load settings? [yn]: " is_load
if [ "${is_load}" = 'y' ]; then

    # 適用
    scripts="${HOME}/.dotfiles/karabiner/bin/import_*.sh"
    for scrip in ${scripts}
    do
        echo '======== '${scrip}' ========'
        sh ${scrip}
    done
fi

