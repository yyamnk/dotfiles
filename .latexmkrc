#!/usr/bin/env perl
#****************** .latexmkrc *******************
# created: 2014/06/09
#
# --- abst ---
# open skim, 自動ファイル監視
# texドキュメントごとの個別設定が必要な場合は
# 作業ディレクトリに .latexmkrc を作成する
# http://konn-san.com/prog/why-not-latexmk.html
#************************************************************
use Config;

$latex        = 'platex -synctex=1';
$latex_silent = 'platex -synctex=1 -interaction=batchmode';
$bibtex       = 'pbibtex';
$dvipdf       = 'dvipdfmx %O -o %D %S';
$makeindex    = 'mendex %O -o %D %S';
$max_repeat   = 5;
$pdf_mode     = 3; # generates pdf via dvipdfmx

# Prevent latexmk from removing PDF after typeset.
# This enables Skim to chase the update in PDF automatically.
$pvc_view_file_via_temporary = 0;

# Use Skim as a previewer
# $pdf_previewer    = "open -ga /Applications/Skim.app";

if ($Config{'osname'} eq 'linux') {
    $pdf_previewer = 'evince';
} else {
    $pdf_previewer    = "open -ga /Applications/Skim.app";
}
