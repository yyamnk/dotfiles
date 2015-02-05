#!/usr/bin/env bash
#****************** link_dots.sh *******************
# created: 2014/12/01
# Last Change:2015-Feb-05.
#------------------------------------------------------------
# ~/.dotfiles/ にある.hogeのシンボリックリンクをhomeへ貼る
#************************************************************

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
            echo 'link '$df
            ln -sf $df ~/
    esac
done
