#!/usr/bin/env bash
#****************** link_dots.sh *******************
# created: 2014/12/01
# Last Change:2015-Oct-02.
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

# my spell files for vim
echo 'link ~/.dotfiles/vim-spell/* ~/.vim/spell/'
[ ! -e ${HOME}/.vim/spell ] && mkdir -p ${HOME}/.vim/spell
ln -sf ~/.dotfiles/vim-spell/* ~/.vim/spell/
