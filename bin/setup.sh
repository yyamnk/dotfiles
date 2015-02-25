#!/bin/bash
#****************** bin/setup.sh *******************
# created: 2015-Feb-05
# Last Change: 2015-Feb-25.
#------------------------------------------------------------
# 最低限の環境を整える
# githubからdotfilesを~/.dotfiles/へclone
# ~/.dotfiles/.* のシンボリックリンクをhomeに作成
#************************************************************

# http://orgachem.hatenablog.com/entry/2014/05/13/001100
set -e
set -u

#-------------------------------------------------------#
# for dotfiles
#-------------------------------------------------------#
dotfiles=$HOME/.dotfiles
# pull or clone
if [ -d $dotfiles ]; then
    echo 'pull repo ...'
    ( cd $dotfiles && git pull origin master)
else
    echo 'cloe repo ...'
    git clone https://github.com/yyamnk/dotfiles $dotfiles
    # デフォルトの参照先を決める
    git branch --set-upstream-to=origin/master master
fi

# symbolic link
[ -e $dotfiles/bin/link_dots.sh ] && \
    echo 'update symbolic links ...' && \
    bash $dotfiles/bin/link_dots.sh

# neobundle install
if [ ! -d $HOME/.vim/bundle ]; then
    echo 'Installing neobundle.vim ...'
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
fi

#---------------------
# 環境依存設定
#---------------------
case "${OSTYPE}" in
# mac
darwin*)
    bash $dotfiles/bin/osx/setup.sh
    ;;
linux*)
    bash $dotfiles/bin/linux/setup.sh
    ;;
esac
