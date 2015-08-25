#!/bin/bash
#****************** bin/split-3h.sh *******************
# Created    : 2015-Aug-25
# Last Change: 2015-Aug-25.
#------------------------------------------------------------
# tmuxのpaneを水平方向に3分割する
#************************************************************

tmux select-pane -t 0 # 始めのpaneを選択
tmux split-window -h # 2分割
tmux split-window -h #
tmux select-layout even-horizontal # paneを均一化
