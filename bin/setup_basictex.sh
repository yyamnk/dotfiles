#!/usr/bin/env zsh
#****************** bin/setup_basictex.sh *******************
# created: 2015-Feb-09
# Last Change:2017-Apr-08.
#-----------------------------------------------------------
# update texLive by tlmgr
#************************************************************

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
# sudo tlmgr --no-persistent-downloads install ptex platex japanese-otf jfontmaps jsclasses
sudo tlmgr --no-persistent-downloads install collection-langjapanese
# for pandoc + ja
sudo tlmgr --no-persistent-downloads install collection-langcjk luatexja ctablestack filehook
# for algpseudocode.sty
sudo tlmgr --no-persistent-downloads install algorithmicx


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
# bib制御
sudo tlmgr --no-persistent-downloads install biblatex logreq xstring filecontents biber
sudo tlmgr --no-persistent-downloads install bigints
echo "================= TeX Live Maneger Finish======================="
