#!/bin/bash
#****************** bin/setup.sh *******************
# created: 2015-Feb-05
# Last Change: 2015-Oct-09.
#------------------------------------------------------------
# 最低限の環境を整える
# githubからdotfilesを~/.dotfiles/へclone
# ~/.dotfiles/.* のシンボリックリンクをhomeに作成
#************************************************************

# http://orgachem.hatenablog.com/entry/2014/05/13/001100
set -e
set -u

echo '======================================'
echo 'Clone or pull dotfiles'
echo '======================================'
dotfiles=$HOME/.dotfiles
# pull or clone
if [ -d $dotfiles ]; then
    echo 'pull repo ...'
    ( cd $dotfiles && git pull origin master)
else
    echo 'cloe repo ...'
    git clone https://github.com/yyamnk/dotfiles $dotfiles
    # デフォルトの参照先を決める
    cd $dotfiles
    git branch --set-upstream-to=origin/master master
fi


echo ''
echo '======================================'
echo 'create ~/usr/local/bin/, ~/bin/'
echo '======================================'
# for user installed programs
if [ ! -e $HOME/usr/local/bin ]; then
    mkdir -p $HOME/usr/local/bin && echo "$HOME/usr/local/bin is created."
else
    echo "$HOME/usr/local/bin already exist."
fi
# for my scripts
if [ ! -e $HOME/bin ]; then
    mkdir $HOME/bin && echo "$HOME/bin is created."
else
    echo "$HOME/bin already exist."
fi


echo ''
echo '======================================'
echo 'update symbolic links'
echo '======================================'
bash $dotfiles/bin/link_dots.sh
bash $dotfiles/bin/link_bins.sh

# matlab
[ -e $HOME/matlab ] && \
    echo 'link ~/.dotfiles/matlab/startup.m with ~/matlab/startup.m' && \
    ln -sf $dotfiles/matlab/startup.m $HOME/matlab/

# my spell files for vim
echo 'link ~/.dotfiles/vim-spell/* ~/.vim/spell/'
[ ! -e ${HOME}/.vim/spell ] && mkdir -p ${HOME}/.vim/spell
ln -sf ~/.dotfiles/vim-spell/* ~/.vim/spell/

# conf dir
echo 'link ~/.dotfiles/conf/ ~/conf'
ln -sf ~/.dotfiles/conf ~/conf


echo ''
echo '======================================'
echo 'install neobundle'
echo '======================================'
if [ ! -d $HOME/.vim/bundle ]; then
    echo 'Installing neobundle.vim ...'
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
else
    echo 'skipped'
fi


echo ''
echo '##### setup finished. #####'
echo ''
#---------------------
# 環境依存設定
#---------------------
case "${OSTYPE}" in
# mac
darwin*)
    echo '-------- for osx ----------'
    echo 'run'
    echo 'bash ~/.dotfiles/bin/osx/setup.sh'
    ;;
linux*)
    ;;
esac
