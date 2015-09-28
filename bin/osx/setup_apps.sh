#!/usr/bin/env zsh
#****************** bin/setup_apps.sh *******************
# created: 2015-Feb-06
# Last Change: 2015-Sep-24.
#------------------------------------------------------------
# set up for apps
#************************************************************
echo "basic apps install by brew ..."

# brew package install
brew install aspell --with-lang-en # useage: aspell -c bar.txt
brew install autojump
brew install brew-cask
brew install cmigemo # 日本語をローマ字変換, vim migemoで利用
brew install colordiff
brew install coreutils
brew install ctags
brew install diff-pdf
brew install gibo
brew install git
brew install hardlink
brew install hub
brew install heroku-toolbelt
brew install libdvdcss # for handbrak, library
brew install lua
brew install mongodb
brew install nkf
brew install pandoc
brew install peco
brew install postgresql
brew install ranger
brew install reattach-to-user-namespace # tmux内のvimでクリップボード併用を可能に
brew install rmtrash # command for move trash
brew install the_silver_searcher
brew install tig
brew install tmux
brew install tree
brew install vim --with-lua --with-python3 --override-system-vi
brew install w3m
brew install xpdf
brew install zsh

# ------------------------------------------------------- #
# cask install for GUI application
# ------------------------------------------------------- #
brew cask install 1password
brew cask install adobe-reader-ja
brew cask install appcleaner
brew cask install ccleaner
brew cask install clamxav
brew cask install controlplane
brew cask install copy
brew cask install coteditor
brew cask install dash
brew cask install dropbox
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
brew cask install parallels9
brew cask install shortcat
brew cask install seil
brew cask install skim
brew cask install slack
brew cask install slate
brew cask install skepe
brew cask install the-unarchiver
brew cask install textexpander3
brew cask install totalspaces
brew cask install transmit
brew cask install trim-enabler
brew cask install vagrant
brew cask install virtualbox
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
