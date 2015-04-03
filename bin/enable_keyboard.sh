#! /usr/bin/env bash
#****************** eneble_keyboard.sh *******************
# created: 2014/11/23
# Last Change:02-Oct-2014.
#
# --- abst ---
# mac 内蔵キーボードを有効化
# http://qiita.com/shuhei/items/fcaee827b9bf256820b6
#************************************************************
sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext
