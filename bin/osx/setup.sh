#!/bin/bash
#****************** bin/osx/setup.sh *******************
# created: 2015-Feb-25
# Last Change: 2016-Feb-17.
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
printf "change default shell to $ZSH_BREW ..."
if [ ! `tail -n 1 /etc/shells` = $ZSH_BREW ]; then
    sudo sh -c "echo $ZSH_BREW >> /etc/shells"
    chpass -s $ZSH_BREW
    echo 'done'
else
    echo 'skipped'
fi

#-------------------------------------------------------#
# setup git
# brew install git & make symbolic link of contribute-tools to ~/bin/
#-------------------------------------------------------#
printf 'setup git ...'
if [ "`which git`" = '/usr/bin/git' ]; then
    brew install git
    # setup for git contribute
    brew install coreutils
    [ ! -d $HOME/bin ] && mkdir $HOME/bin
    bash $HOME/.dotfiles/bin/setup_gitcontrib.sh
    echo 'done'
else
    echo 'skipped'
fi

#-------------------------------------------------------#
# create network location (nut) if no exist,
# and switch to it if HTTPS_PROXY is enable
#-------------------------------------------------------#
printf 'create network location for nut ...'
networksetup -listlocations | grep nut > /dev/null
if [ "$?" = 1 ]; then
    # create
    bash $SETUP_DIR/create_newtwork_nut.sh
    # change network location
    [ "${HTTPS_PROXY}" = 'http://proxy.nagaokaut.ac.jp:8080/' ] && \
        sudo networksetup -switchtolocation nut || \
        sudo networksetup -switchtolocation Automatic
    echo ''
    echo 'done'
else
    echo 'skipped'
fi

#-------------------------------------------------------#
# write defaults
# デフォルト: 不可視ファイルは見えない( 0 )
#-------------------------------------------------------#
printf 'write defaults ...'
sh $SETUP_DIR/write_defaults.sh
echo 'done'

#-------------------------------------------------------#
# Ricty Font
#-------------------------------------------------------#
printf 'install Ricty Fonts ...'
ls -l $HOME/Library/Fonts | grep "Ricty" > /dev/null
if [ "$?" = 1 ]; then
    brew install Caskroom/cask/xquartz
    brew install ricty
    echo 'done'
    echo '# copy fonts to ~/Library/Fonts/'
    echo 'cp -f /usr/local/Cellar/ricty/3.2.4/share/fonts/Ricty*.ttf ~/Library/Fonts/'
    echo '# update font lib'
    echo 'fc-cache -vf'
else
    echo 'skipped'
fi

#-------------------------------------------------------#
# Control Plane
#-------------------------------------------------------#
printf 'install controlplane ...'
if ! brew cask list | grep controlplane > /dev/null 2>&1; then
    brew cask install controlplane
    ln -sf $HOME/.dotfiles/control_plane/com.dustinrue.ControlPlane.plist ~/Library/Preferences/
    echo 'done'
    echo ''
    echo 'please change /private/etc/sudoers.tmp'
    echo ''
    echo 'sudo visudo'
    echo '------------------------------'
    echo '# /private/etc/sudoers.tmp'
    echo ' ... '
    echo '# allow enable/disable internal keyboard without password'
    echo '%admin	ALL=(ALL) ALL, NOPASSWD: /sbin/kextload, /sbin/kextunload'
    echo ' ... '
    echo '------------------------------'
    echo 'see http://qiita.com/shuhei/items/fcaee827b9bf256820b6'
    echo ''
else
    echo 'skipped'
fi

#-------------------------------------------------------#
# karabiner
#-------------------------------------------------------#
printf 'install karabiner ...'
if ! brew cask list | grep karabiner > /dev/null 2>&1; then
    brew cask install karabiner
    echo 'done'
else
    echo 'skipped'
fi

echo 'update karabiner settings ...'
sh $HOME/.dotfiles/karabiner/bin/setup.sh
echo 'done'

echo ''
echo 'To import karabiner settings, please execute'
echo "bash $HOME/.dotfiles/karabiner/bin/import.sh"
echo ''

echo 'Complete minimize osx setting!'

#-------------------------------------------------------#
# install apps by brew
#-------------------------------------------------------#
echo ''
echo 'To install apps, please execute'
echo "zsh $SETUP_DIR/setup_apps_minimal.sh"
echo "zsh $SETUP_DIR/setup_apps_luxury"
echo ''

#-------------------------------------------------------#
# install osx-mv2trash
#-------------------------------------------------------#
echo 'clone osx-mv2trash ...'
git clone git@github.com:dankogai/osx-mv2trash.git ~/usr/local/osx-mv2trash
echo 'done'
