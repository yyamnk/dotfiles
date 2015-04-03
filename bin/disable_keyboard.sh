#! /usr/bin/env bash
#****************** disable_keyboard.sh *******************
# created: 2014/11/23
# Last Change:02-Oct-2014.
#
# --- abst ---
# mac の内蔵キーボードを無効化する
# http://qiita.com/shuhei/items/fcaee827b9bf256820b6
#************************************************************
sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext

case $? in
  3) exit 0;;
  *) exit $?;;
esac
