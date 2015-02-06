#!/usr/bin/env sh
#****************** setup_brew.sh *******************
# created: 2015-Feb-06
# Last Change: 2015-Feb-06.
#************************************************************

# brew install
echo 'Installing brew ...'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "brew update & upgrade"
# homebrew update
brew update
# formula update
brew upgrade

# add repositories
brew tap caskroom/homebrew-cask
# for totalspaces2
brew tap vexus2/homebrew-cask
brew tap caskroom/versions
