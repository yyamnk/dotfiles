#!/usr/bin/env sh
#****************** bin/setup_gitcontrib.sh *******************
# created: 2015-Feb-10
# Last Change: 2015-Feb-10.
#------------------------------------------------------------
# git contribの便利ツールのシンボリックリンクを~/bin/に貼る
# 要 greadlink (brew install coreutils)
#************************************************************
# check greadlink
if ! type greadlink > /dev/null 2>&1; then
    echo 'greadlink not fourd'
    exit 0
fi

# check ~/bin/
[ ! -d $HOME/bin ] && echo '~/bin/ not exist' && exit 0


# 利用するtoolsのpathをスペース区切りで書く
# ex) path/to/git-contrib/hoge/hage.sh と path/to/git-contrib/fuga/git-fuga のとき
# TOOLS='hoge/hoge.sh fuga/git-fuga'
TOOLS='diff-highlight/diff-highlight'

#-------------------------------------------------------#
# find git contrib dir
#-------------------------------------------------------#
GITPATH=`greadlink -f \`which git\``
GITROOT="${GITPATH%/*/*}"
GITCONTRIB=$GITROOT/share/git-core/contrib

#-------------------------------------------------------#
# symbolic link
#-------------------------------------------------------#
for tool in "${TOOLS}"; do
    ln -sf $GITCONTRIB/$tool $HOME/bin/
done
