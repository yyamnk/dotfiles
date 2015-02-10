#!/usr/bin/env sh
#****************** bin/write_defaults.sh *******************
# created: 2015-Feb-10
# Last Change: 2015-Feb-10.
#************************************************************

echo "=================== write defaults ==================="

echo 'show invisible files'
defaults write com.apple.finder AppleShowAllFiles -bool true

echo 'show full path of current directory'
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo 'do not make ".DS_Store" over network'
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

echo 'change screen shot format to pdf'
defaults write com.apple.screencapture type pdf

echo 'fast mission control animation'
defaults write com.apple.dock expose-animation-duration -float 0.1

echo 'Safali history back by delete'
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool yes


echo 'restart finder and dock'
killall Finder
killall Dock

# restart mac
echo "======================================"
echo "Please restart mac to apply settings"
echo "======================================"
