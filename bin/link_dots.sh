#!/usr/bin/env bash
#****************** link_dots.sh *******************
# created: 2014/12/01
# Last Change:2015-Oct-09.
#------------------------------------------------------------
# ~/.dotfiles/ にある.hogeのシンボリックリンクをhomeへ貼る
#************************************************************

echo 'update symbolic links ...'

# dotfiles
dotfiles="${HOME}/.dotfiles/.*"

for df in ${dotfiles}
do
    case "${df}" in
        *.DS_Store ) ;;
        *.         ) ;;
        *..        ) ;;
        *.git      ) ;;
        *          )
            echo "link $df to ${HOME}"
            ln -sf $df ~/
    esac
done
