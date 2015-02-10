#!/usr/bin/env bash
#****************** setup.sh *******************
# created: 2015-Feb-05
# Last Change:2015-Feb-11.
#------------------------------------------------------------
# 最低限の環境を整える
# githubからdotfilesを~/.dotfiles/へclone
# ~.dotfiles/.* のシンボリックリンクをhomeに作成
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

#-------------------------------------------------------#
# install brew, zsh
#-------------------------------------------------------#
if ! type brew > /dev/null 2>&1; then
    bash $dotfiles/bin/setup_brew.sh
    brew install zsh
fi

#-------------------------------------------------------#
# change login shell, /usr/local/bin/zsh を使う
#-------------------------------------------------------#
brewzsh=/usr/local/bin/zsh
if [ ! `tail -n 1 /etc/shells` = $brewzsh ]; then
    echo "change default shell to $brewzsh"
    sudo sh -c "echo $brewzsh >> /etc/shells"
    chpass -s $brewzsh
fi

#-------------------------------------------------------#
# setup git
#-------------------------------------------------------#
if [ "`which git`" = '/usr/bin/git' ]; then
    brew install git
    bash $dotfiles/setup_git.sh
fi

#-------------------------------------------------------#
# create network location (nut) if no exist,
# and switch to it if HTTPS_PROXY is enable
#-------------------------------------------------------#
networksetup -listlocations | grep nut > /dev/null
if [ "$?" = 1 ]; then
    # create
    bash $dotfiles/bin/create_newtwork_nut.sh
    # change network location
    [ "${HTTPS_PROXY}" = 'http://proxy.nagaokaut.ac.jp:8080/' ] && \
        sudo networksetup -switchtolocation nut || \
        sudo networksetup -switchtolocation Automatic
    echo ''
fi

#-------------------------------------------------------#
# write defaults
# デフォルト: 不可視ファイルは見えない( 0 )
#-------------------------------------------------------#
[ `defaults read com.apple.finder AppleShowAllFiles` = 0 ] && \
    sh $HOME/.dotfiles/bin/write_defaults.sh

#-------------------------------------------------------#
# install apps by brew
#-------------------------------------------------------#
echo -n "Install apps by brew? [yn]: "
read is_inst
if [ "${is_inst}" = 'y' ]; then
    zsh $dotfiles/bin/setup_apps.sh
fi

#-------------------------------------------------------#
# karabiner
#-------------------------------------------------------#
ls -l $HOME/Library/Application\ Support | grep Karabiner > /dev/null
if [ "$?" = 1 ]; then
    sh $HOME/.dotfiles/karabiner/bin/setup.sh
fi

#-------------------------------------------------------#
# Ricty Font
#-------------------------------------------------------#
ls -l $HOME/Library/Fonts | grep "Ricty*.ttf" > /dev/null
if [ "$?" = 1 ]; then
    brew install ricty
fi

