#!/bin/bash
#****************** bin/setup_gems.sh *******************
# created: 2015-Mar-12
# Last Change: 2015-Mar-12.
#------------------------------------------------------------
# システムのgemに入れるもののみ.
# Rails関連gemは各プロジェクトにインストール
#************************************************************

echo "gem update"
gem update

echo "install bundler, gollumn"
gem install gollum
gem install bundler
gem install tmuxinator
# tmuxのwindow, paneを設定してくれる
# http://tactosh.com/2014/01/tmux-window-pane-tmuxinator/
