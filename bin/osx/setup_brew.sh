#!/usr/bin/env sh
#****************** setup_brew.sh *******************
# created: 2015-Feb-06
# Last Change: 2015-Oct-07.
#************************************************************

# brew install
echo 'Installing brew ...'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 'Installing brew cask ...'
brew install caskroom/cask/brew-cask

echo "brew update & upgrade"
# homebrew update
brew update
# formula update
brew upgrade

# add repositories
brew tap caskroom/homebrew-cask
brew tap caskroom/versions
brew tap homebrew/x11
brew tap peco/peco
brew tap sanemat/font
brew tap homebrew/dupes # for rsync, etc.
