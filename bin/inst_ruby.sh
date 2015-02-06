#! /usr/bin/env bash
#****************** inst_ruby.sh *******************
# created: 2015-Feb-02
# Last Change: 2015-Feb-06.
#------------------------------------------------------------
# install ruby by homebrew
#************************************************************

# install ruby by homebrew
echo "brew update & upgrade"
# homebrew update
brew update
# formula update
brew upgrade


echo "install rbenv by brew"
brew install rbenv ruby-build rbenv-gem-rehash

echo "openssl & readline"
brew install openssl
brew install readline


echo "install ruby v2.2.0"
# 2015-Feb-02時点で安定版は2.2.0
rbenv install 2.2.0
rbenv global 2.2.0

echo "The installs finished"
echo "------------------------"
echo "The current ruby virsion is ..."
echo "------------------------"
rbenv versions


