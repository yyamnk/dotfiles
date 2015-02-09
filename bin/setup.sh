#!/usr/bin/env bash
#****************** setup.sh *******************
# created: 2015-Feb-05
# Last Change:2015-Feb-09.
#------------------------------------------------------------
# 最低限の環境を整える
# githubからdotfilesを~/.dotfiles/へclone
# ~.dotfiles/.* のシンボリックリンクをhomeに作成
#************************************************************

# http://orgachem.hatenablog.com/entry/2014/05/13/001100
set -e
set -u

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

# brew + git, zsh, vim導入
bash $dotfiles/bin/setup_brew.sh
brew install git
brew install zsh
brew install vim --with-lua --with-python3 --override-system-vi

# /usr/local/bin/zsh を使う
brewzsh=/usr/local/bin/zsh
if [ ! `tail -n 1 /etc/shells` = $brewzsh ]; then
    echo "change default shell to $brewzsh"
    sudo sh -c "echo $brewzsh >> /etc/shells"
    chpass -s $brewzsh
fi


# network location作成
echo "create network location"
bash $dotfiles/bin/create_newtwork_nut.sh

# change network location
[ "${HTTPS_PROXY}" = 'http://proxy.nagaokaut.ac.jp:8080/' ] && sudo networksetup -switchtolocation nut || sudo networksetup -switchtolocation Automatic
echo ''

#appを導入
echo -n "Do you want setup apps by brew? [yn]: "
read is_inst
if [ "${is_inst}" = 'y' ]; then
    zsh $dotfiles/bin/setup_apps.sh
fi
