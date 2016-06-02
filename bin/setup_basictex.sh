#!/usr/bin/env zsh
#****************** bin/setup_basictex.sh *******************
# created: 2015-Feb-09
# Last Change:2016-May-17.
#-----------------------------------------------------------
# 1. installing BasicTeX
# 2. update texLive by tlmgr
#************************************************************

# ------------------------- install basicTex by brew cask
# homebrew update
echo "homebrew update and upgrade ..."
brew update upgrade

# ghostscript -> pdf, imagemagick -> pics
brew install ghostscript imagemagick

echo "========== setup basictex"
brew cask install basictex
# 不要ファイル削除
brew cask cleanup


echo "================= TeX Live Maneger Update ======================="

echo "------------ tlmgr update itself and all packages ---------------"
sudo tlmgr --no-persistent-downloads update --self
sudo tlmgr --no-persistent-downloads update --all

echo "------------ latexmk install ---------------"
sudo tlmgr --no-persistent-downloads install latexmk
sudo tlmgr --no-persistent-downloads install latexdiff

# timesフォント
echo "------------ install times font pkgs --------------------"
sudo tlmgr --no-persistent-downloads install newtx fontaxes boondox txfonts ec helvetic

# 日本語
echo "------------ install japanese pkgs --------------------"
echo "tlmgr install uptex jfontmaps jsclasses japanese-otf"
sudo tlmgr --no-persistent-downloads install ptex japanese-otf jfontmaps jsclasses
# for pandoc + ja
sudo tlmgr --no-persistent-downloads install collection-langcjk luatexja ctablestack filehook
# for algpseudocode.sty
sudo tlmgr --no-persistent-downloads install algorithmicx

echo "------------ Symbolic Links for Hiragino --------------------"
# ヒラギノフォントを埋め込む
cd `kpsewhich -var-value=TEXMFLOCAL`
sudo mkdir -p ./fonts/opentype/public/hiragino
cd ./fonts/opentype/public/hiragino
sudo ln -s "/Library/Fonts/ヒラギノ明朝 Pro W3.otf" ./HiraMinPro-W3.otf
sudo ln -s "/Library/Fonts/ヒラギノ明朝 Pro W6.otf" ./HiraMinPro-W6.otf
sudo ln -s "/Library/Fonts/ヒラギノ角ゴ Pro W3.otf" ./HiraKakuPro-W3.otf
sudo ln -s "/Library/Fonts/ヒラギノ角ゴ Pro W6.otf" ./HiraKakuPro-W6.otf
sudo ln -s "/Library/Fonts/ヒラギノ角ゴ Std W8.otf" ./HiraKakuStd-W8.otf
sudo ln -s "/Library/Fonts/ヒラギノ丸ゴ Pro W4.otf" ./HiraMaruPro-W4.otf
sudo ln -s "/System/Library/Fonts/ヒラギノ明朝 ProN W3.otf" ./HiraMinProN-W3.otf
sudo ln -s "/System/Library/Fonts/ヒラギノ明朝 ProN W6.otf" ./HiraMinProN-W6.otf
sudo ln -s "/System/Library/Fonts/ヒラギノ角ゴ ProN W3.otf" ./HiraKakuProN-W3.otf
sudo ln -s "/System/Library/Fonts/ヒラギノ角ゴ ProN W6.otf" ./HiraKakuProN-W6.otf
sudo ln -s "/Library/Fonts/ヒラギノ角ゴ StdN W8.otf" ./HiraKakuStdN-W8.otf
sudo ln -s "/Library/Fonts/ヒラギノ丸ゴ ProN W4.otf" ./HiraMaruProN-W4.otf

sudo mktexlsr
sudo updmap-sys --setoption kanjiEmbed hiragino
kanji-config-updmap hiragino


echo "------------ install my defaul-use packages --------------------"
sudo tlmgr --no-persistent-downloads install cases algorithms ulem multirow subfigmat subfigure
sudo tlmgr --no-persistent-downloads install soul cancel comment xifthen ifmtarg

sudo tlmgr --no-persistent-downloads install type1c
sudo tlmgr --no-persistent-downloads install cm-super
# いい加減，フォント周りがうざい
sudo tlmgr --no-persistent-downloads install collection-fontsrecommended
# python, matplotlibで使う
sudo tlmgr --no-persistent-downloads install dvipng
# pdfの余白制御
sudo tlmgr --no-persistent-downloads install pdfcrop
echo "================= TeX Live Maneger Finish======================="
