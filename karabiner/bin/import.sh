#!/bin/bash
#****************** karabiner/bin/import.sh *******************
# created: 2015-Feb-26
# Last Change: 2015-Feb-26.
#------------------------------------------------------------
# import karabiner settings by import_*.sh
#************************************************************

printf 'import karabiner setting ...'

# 適用
scripts="${HOME}/.dotfiles/karabiner/bin/import_*.sh"
for scrip in ${scripts}
do
    echo '======== '${scrip}' ========'
    sh ${scrip}
done

echo 'done'
