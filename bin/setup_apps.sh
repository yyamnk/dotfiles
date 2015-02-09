#!/usr/bin/env sh
#****************** bin/setup_apps.sh *******************
# created: 2015-Feb-06
# Last Change: 2015-Feb-09.
#------------------------------------------------------------
# set up for apps
#************************************************************

echo "brew setup"
bash $HOME/.dotfiles/bin/setup_brew.sh

echo "basic apps install by brew ..."

# brew package install
brew install brew-cask
brew install ctags
brew install gibo
brew install git
brew install hardlink
brew install libdvdcss # for handbrak, library
brew install lua
brew install nkf
brew install rmtrash # command for move trash
brew install the_silver_searcher
brew install tmux
brew install tree
brew install vim --with-lua --with-python3 --override-system-vi
brew install xpdf
brew install zsh

# ------------------------------------------------------- #
# cask install for GUI application
# ------------------------------------------------------- #
brew cask install adobe-reader-jp
brew cask install appcleaner
brew cask install ccleaner
brew cask install clamxav
brew cask install controlplane
brew cask install coteditor
brew cask install evernote
brew cask install gitX
brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install handbrake
brew cask install iterm2
brew cask install karabiner
brew cask install latexit
brew cask install mactubes
brew cask install marked
brew cask install mendeley-desktop
brew cask install menumeters
brew cask install monolingual
brew cask install nosleep
brew cask install pandoc
brew cask install shortcat
brew cask install slate
brew cask install the-unarchiver
brew cask install totalspaces
brew cask install transmit
brew cask install trim-enabler
brew cask install vlc
brew cask install xquartz
brew cask install xtrafinder

# quick look plugin
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-csv

# 不要ファイル削除
brew cleanup
brew cask cleanup


# /usr/local/bin/zsh を使う
echo "change default shell to /usr/local/bin/zsh"
sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"
chpass -s /usr/local/bin/zsh

# karabiner設定
sh $HOME/.dotfiles/karabiner/bin/setup.sh

echo "qlColorCode setting ..."
# utf8表示
defaults write org.n8gray.QLColorCode textEncoding UTF-8
# 行番号表示
defaults write org.n8gray.QLColorCode extraHLFlags '-l'
# テキストを選択可能に
defaults write com.apple.finder QLEnableTextSelection -bool true
# qlプラグイン 再読み込み
qlmanage -r
echo "qlColorCode setting ...Done"

# Rictyフォント
# http://blog.sotm.jp/2014/01/10/Installing-SublimeText3-iTerm2-Ricty-on-MacOSX-109/
curl -L 'https://gist.github.com/ysaotome/7286145/raw/installing_ricty_on_MacOSX.sh' | bash


# Safari,
# delete で history back
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool yes
