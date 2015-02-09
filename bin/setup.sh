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
echo 'Installing neobundle.vim ...'
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# brew + git, zsh, vim導入
bash setup_brew.sh
brew install git
brew install zsh
brew install vim --with-lua --with-python3 --override-system-vi

# /usr/local/bin/zsh を使う
echo "change default shell to /usr/local/bin/zsh"
sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"
chpass -s /usr/local/bin/zsh

#appを導入
read -p "Do you want setup apps by brew? [yn]: " is_inst
if [ "${is_inst}" = 'y' ]; then
    zsh $HOME/.dotfiles/bin/setup_apps.sh
fi
