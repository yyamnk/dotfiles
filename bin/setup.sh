#!/bin/bash
#****************** bin/setup.sh *******************
# created: 2015-Feb-05
# Last Change: 2017-Aug-23.
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
echo 'create ~/usr/local/bin/, ~/bin/, ~/conf/'
echo '======================================'
# for user installed programs
if [ ! -e $HOME/usr/local/bin ]; then
    mkdir -p $HOME/usr/local/bin && echo "$HOME/usr/local/bin is created."
else
    echo "$HOME/usr/local/bin already exist."
fi

# for supervisor configs
if [ ! -e $HOME/conf ]; then
    mkdir $HOME/conf && echo "$HOME/conf is created."
    mkdir $HOME/conf/supervisor/ && echo "$HOME/conf/supervisor/ is created."
else
    echo "$HOME/conf already exist."
fi

# for my scripts
if [ ! -e $HOME/bin ]; then
    mkdir $HOME/bin && echo "$HOME/bin/ is created."
else
    echo "$HOME/bin/ already exist."
fi

# for lab
if [ ! -e $HOME/lab ]; then
    mkdir $HOME/lab && echo "$HOME/lab/ is created."
else
    echo "$HOME/lab/ already exist."
fi

# for lab/src_lib
if [ ! -e $HOME/lab/src_lib/ ]; then
    mkdir $HOME/lab/src_lib && echo "$HOME/lab/src_lib/ is created."
else
    echo "$HOME/lab/src_lib/ already exist."
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
[ ! -e ${HOME}/.vim/spell ] && \
    echo 'link ~/.dotfiles/vim-spell/* ~/.vim/spell/' && \
    mkdir -p ${HOME}/.vim/spell && \
    ln -sf ~/.dotfiles/vim-spell/* ~/.vim/spell/

# conf dir
[ -e ${HOME}/conf/supervisor ] && \
    echo 'link ~/.dotfiles/conf/supervisor/* ~/conf/supervisor/' && \
    ln -sf ~/.dotfiles/conf/supervisor/* ~/conf/supervisor


#-------------------------------------------------------#
# delete culr setting if no proxy
#-------------------------------------------------------#
# if [[ ! -v https_proxy ]]; then  # 古いと-vに未対応
if [ -z "$http_proxy" ] && [ "${http_proxy:-A}" = "${http_proxy-A}" ]; then
    . $dotfiles/bin/proxy_off.sh && \
    rm $HOME/.curlrc && \
    echo 'proxy off and remove curlrc'
fi


echo ''
echo '======================================'
echo 'install neobundle'
echo '======================================'
if [ -d $HOME/.vim/bundle ]; then
    echo 'skipped'
else
    echo 'Installing neobundle.vim ...'
    curl -sL https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
fi

echo ''
echo '======================================'
echo 'get git diff-highlight'
echo '======================================'
if [ -e $HOME/bin/diff-highlight ]; then
    echo 'already exist.'
else
    curl -sL https://raw.githubusercontent.com/git/git/v2.9.5/contrib/diff-highlight/diff-highlight > \
    $HOME/bin/diff-highlight && chmod +x $HOME/bin/diff-highlight && \
    echo 'diff-highlight is installed to ~/bin/'
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
