#!/usr/bin/env sh
#****************** bin/write_defaults.sh *******************
# created: 2015-Feb-10
# Last Change: 2015-Mar-22.
#
# ref.
# https://github.com/robb/.dotfiles/blob/master/osx/defaults.install
# http://baqamore.hatenablog.com/entry/2013/08/01/222130
#************************************************************

echo "=================== write defaults ==================="

# finder
echo 'show invisible files'
defaults write com.apple.finder AppleShowAllFiles -bool true
echo 'show full path of current directory'
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
echo 'Expand save panel by default'
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
echo 'Expand print panel by default'
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# dock
echo 'fast mission control animation'
defaults write com.apple.dock expose-animation-duration -float 0.1
echo 'dock auto hide off'
defaults write com.apple.dock autohide -bool true
echo 'dock position = left'
defaults write com.apple.dock orientation -string left
echo 'dock magnification off'
defaults write com.apple.dock magnification -bool false

# disable dashboard
defaults write com.apple.dashboard mcx-disabled -bool true


# Cotroller
echo 'add dvorak layout'
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '{InputSourceKind="Keyboard Layout"; "KeyboardLayout Name"=Dvorak; "KeyboardLayout ID"=16300;}'

echo 'full Keyboard access'
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo `enable tap`
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo 'Require password immediately after sleep or screen saver begins'
defaults write com.apple.screensaver askForPassword -int 1

echo 'do not make ".DS_Store" over network'
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

echo 'change screen shot format to pdf'
defaults write com.apple.screencapture type pdf

echo 'Safali history back by delete'
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool yes


echo 'restart finder and dock'
killall Finder
killall Dock

# restart mac
echo "======================================"
echo "Please restart mac to apply settings"
echo "======================================"
