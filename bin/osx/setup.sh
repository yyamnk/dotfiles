#!/bin/bash
#****************** bin/osx/setup.sh *******************
# created: 2015-Feb-25
# Last Change: 2015-Feb-26.
#------------------------------------------------------------
# mac setup
# install zsh, git, karabiner, Ricty font
# create network location for nut
#************************************************************

readonly SETUP_DIR="$HOME/.dotfiles/bin/osx"

#-------------------------------------------------------#
# install brew, zsh
#-------------------------------------------------------#
printf 'install brew and zsh ...'
if ! type brew > /dev/null 2>&1; then
    bash $SETUP_DIR/setup_brew.sh
    brew install zsh
    echo 'done'
else
    echo 'skipped'
fi

#-------------------------------------------------------#
# change login shell,
# ログインシェルが/usr/local/bin/zshでないとき, /etc/shellsに追加
#-------------------------------------------------------#
readonly ZSH_BREW=/usr/local/bin/zsh
if [ ! `tail -n 1 /etc/shells` = $ZSH_BREW ]; then
    echo "change default shell to $ZSH_BREW"
    sudo sh -c "echo $ZSH_BREW >> /etc/shells"
    chpass -s $ZSH_BREW
fi

#-------------------------------------------------------#
# setup git
#-------------------------------------------------------#
if [ "`which git`" = '/usr/bin/git' ]; then
    brew install git
fi

#-------------------------------------------------------#
# create network location (nut) if no exist,
# and switch to it if HTTPS_PROXY is enable
#-------------------------------------------------------#
networksetup -listlocations | grep nut > /dev/null
if [ "$?" = 1 ]; then
    # create
    bash $SETUP_DIR/create_newtwork_nut.sh
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
    sh $SETUP_DIR/write_defaults.sh

#-------------------------------------------------------#
# karabiner
#-------------------------------------------------------#
ls -l $HOME/Library/Application\ Support | grep Karabiner > /dev/null
if [ "$?" = 1 ]; then
    brew cask install karabiner
    sh $SETUP_DIR/karabiner/bin/setup.sh
fi

#-------------------------------------------------------#
# Ricty Font
#-------------------------------------------------------#
ls -l $HOME/Library/Fonts | grep "Ricty" > /dev/null
if [ "$?" = 1 ]; then
    brew install ricty
fi

#-------------------------------------------------------#
# install apps by brew
#-------------------------------------------------------#
echo ''
echo 'To install apps, please execute'
echo "zsh $SETUP_DIR/setup_apps.sh"
echo ''

echo 'Complete minimize osx setting!'
