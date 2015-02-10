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
# install brew, git, zsh, vim
#-------------------------------------------------------#
bash $dotfiles/bin/setup_brew.sh
brew install git
brew install zsh
brew install vim --with-lua --with-python3 --override-system-vi

#-------------------------------------------------------#
# change login shell
#-------------------------------------------------------#
# /usr/local/bin/zsh を使う
brewzsh=/usr/local/bin/zsh
if [ ! `tail -n 1 /etc/shells` = $brewzsh ]; then
    echo "change default shell to $brewzsh"
    sudo sh -c "echo $brewzsh >> /etc/shells"
    chpass -s $brewzsh
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
echo -n "setup karabiner? [yn]: "
read is_inst
if [ "${is_inst}" = 'y' ]; then
    sh $HOME/.dotfiles/karabiner/bin/setup.sh
fi

#-------------------------------------------------------#
# Ricty Font
# http://blog.sotm.jp/2014/01/10/Installing-SublimeText3-iTerm2-Ricty-on-MacOSX-109/
#-------------------------------------------------------#
echo -n "Install Ricty font? [yn]: "
read is_inst
if [ "${is_inst}" = 'y' ]; then
    curl -L 'https://gist.github.com/ysaotome/7286145/raw/installing_ricty_on_MacOSX.sh' | bash
fi

#-------------------------------------------------------#
# write defaults
#-------------------------------------------------------#
echo -n "Write defaults? [yn]: "
read is_inst
if [ "${is_inst}" = 'y' ]; then
    sh $HOME/.dotfiles/bin/
fi
