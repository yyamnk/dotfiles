#!/usr/bin/env sh
#****************** bin/setup_finder.sh *******************
# created: 2015-Feb-10
# Last Change: 2015-Feb-10.
#------------------------------------------------------------
#
#************************************************************
echo "=================== Finder setting ==================="

# show invisible files
defaults write com.apple.finder AppleShowAllFiles -bool true

# show full path of current directory
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# change path bar from root to from ~
defaults write com.apple.finder PathBarRootAtHome -bool yes

# do not make ".DS_Store"
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# スクリーンショットをpdf形式に
defaults write com.apple.screencapture type pdf

# restart finder
killall Finder

# disable mission control animation
defaults write com.apple.dock expose-animation-duration -float 0;
killall Dock

# restart mac
echo "Need Restart to apply settings"
