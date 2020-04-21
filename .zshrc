# Last Change: 2020-Apr-13.

#-------------------------------------------------------#
# General Settings
#-------------------------------------------------------# {{{
## 重複パスを登録しない
typeset -U PATH
typeset -U fpath
export EDITOR=vim                # エディタをvimに設定
export LANG=en_US.UTF-8          # en_USロケール + 文字コードをUTF-8
export LC_PAPER=ja_JP.UTF-8      # en_USロケール + 文字コードをUTF-8, use ~/.profile
export LC_TIME=en_US.UTF-8       # 日時表示をEN
export KCODE=u                   # KCODEにUTF-8を設定
setopt no_beep                   # ビープ音を鳴らさないようにする
setopt print_eight_bit           # 日本語ファイル名を表示可能に
setopt no_flow_control           # フローコントロールを無効にする
bindkey -e # キーバインドをemacsモードに設定

# 入力なし + ctrl-dでのログアウト防止
setopt IGNOREEOF

# macからssh接続するとき
# Terminal.app > Settings > Advanced > Set locale env ... をoffにする
# export DISPLAY=:0.0 # Xで接続時にGUIアプリを接続元の端末上に表示する
# xauthがよろしく設定しくれるのでuserは指定不要.
# }}}

#-------------------------------------------------------#
# Prompt
#-------------------------------------------------------# {{{
# add colors function path
[ -e $HOME/usr/local/share/zsh/5.1.1/functions ] && \
    fpath=($HOME/usr/local/share/zsh/5.1.1/functions $fpath)
autoload -U colors; colors # プロンプトに色を付ける

# 一般ユーザ時
# プロンプト変数:
# %n ユーザ名
# %# ユーザ種別(rootで'#', それ以外で'%')
# tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt="%{${fg[cyan]}%}$ %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
    tmp_prompt="%{${fg[cyan]}%}# %{${reset_color}%}" # ユーザ種別表示'#'
    tmp_prompt="%B%U${tmp_prompt}%u%b"
    tmp_prompt2="%B%U${tmp_prompt2}%u%b"
    tmp_rprompt="%B%U${tmp_rprompt}%u%b"
    tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト

# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;
# }}}

#-------------------------------------------------------#
# History
#-------------------------------------------------------# {{{
HISTFILE=~/.zsh_history                            # 履歴を保存するファイルを指定
HISTSIZE=10000                                     # メモリ上に保存される履歴数（historyコマンドの表示数)
SAVEHIST=10000                                     # HISTFILEへ保存される履歴数
setopt hist_ignore_dups                            # 既に履歴にあるコマンドを重複して記録しない
setopt share_history                               # 端末間の履歴を共有
# 移動系履歴
setopt auto_pushd                                  # cd -[tab]で過去の移動履歴から補完
setopt pushd_ignore_dups                           # 重複した移動履歴を保存しない
# コマンド履歴検索
bindkey '^P' history-beginning-search-backward # 入力中の文字列から検索
bindkey '^N' history-beginning-search-forward  # 入力中の文字列から検索
# }}}

#-------------------------------------------------------#
# Completion
#-------------------------------------------------------# {{{
autoload -U compinit; compinit -u                   # 補完機能を有効にする
setopt auto_param_slash                             # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs                                    # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt correct                                      # コマンドのスペルを訂正する
setopt auto_list                                    # 補完候補を一覧で表示する(d)
# setopt auto_menu                                  # 補完候補が複数あるときに自動的に一覧表示する
setopt menu_complete                                # Tabキーの節約(補完候補選択までtab1回でOK)
setopt list_packed                                  # 補完候補をできるだけ詰めて表示する
setopt list_types                                   # 補完候補にファイルの種類も表示する
setopt complete_in_word                             # 単語の途中でもカーソル位置で置換
setopt auto_param_keys                              # カッコの対応などを自動的に補完
setopt interactive_comments                         # コマンドラインでも'#'以降をコメントと見なす
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
zstyle ':completion:*:default' menu select=1        # 補完候補のカーソル選択を有効に
bindkey "^[[Z" reverse-menu-complete                # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)

setopt auto_cd # ディレクトリ名を入力するだけで移動
setopt auto_pushd # 移動したディレクトリを記録しておく。"cd -[Tab]"で移動履歴を一覧

zstyle ':completion:*' file-sort modification # 更新日時順にsort
zstyle ':completion:*' list-colors ''

#autoload predict-on; predict-on # 前方予測on 難しい...

fpath=(~/.zshrc $fpath)
# }}}

#-------------------------------------------------------#
# colors
#-------------------------------------------------------# {{{
export TERM=xterm-256color
export CLICOLOR=1
# alias ls='ls -G -F -t' # lsに色付け

# 名前で色を付けるようにする
autoload colors
colors

# LS_COLORSを設定しておく
export LS_COLORS='di=01;34:ln=01;35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# C-wでの削除でpathの'/'も単語区切りにする
export WORDCHARS="*?_-.[]~&;=!#$%^(){}<>"
# }}}

#-------------------------------------------------------#
# keybind
#-------------------------------------------------------# {{{
# tmux
# with zsh xterm-256color, HOME key send "\eOH"
# with zsh xterm-256color + tmux xterm-256color, HOME key send "\e[1~"
# so, enable HOME and END in tmux,
if [[ -n "$TMUX" ]]; then
    bindkey "\e[1~" beginning-of-line
    bindkey "\e[4~" end-of-line
fi

# word move
bindkey "^[[1;5C" forward-word  # ctrl + right-arrow
bindkey "^[[1;5D" backward-word  # ctrl + left-arrow
# }}}

#-------------------------------------------------------#
# my functions
#-------------------------------------------------------# {{{
# file name search from current dir.
function fname() {
    find ./ -name "*.*" -exec grep -l "$1" {} \;
}

# 全文検索
# http://d.hatena.ne.jp/y_yanbe/20071015/1192440905
function search() {
  dir=.
  file=*
  case $# in
    0)
    echo usage: search STRING [DIR [FILE]]
    ;;
    1)
    string=$1
    ;;
    2)
    string=$1
    dir=$2
    ;;
    3)
    string=$1
    dir=$2
    file=$3
    ;;
  esac
  find $dir -name "$file" -exec grep -IHn $string {} \; ;
}
# for melendy output bib files
# modify bib file removing abstract, doi, file, url, issn, etc
function modbib() {
    perl -n -e "print unless /^(abstract|doi|file|url|issn|mendeley-groups|keywords|pmid)/" "$1" > "$2"
}

# tex -> text
function tex2doc() {
    # detex -e align, equation, eqnarray, cases, subnumcases, tabular main.tex > main.txt
    pandoc -s main.tex -o main.doc
}

# tex -> rtf
alias tex2rtf='latex2rtf -b "./build/main.bbl" -a ./build/main.aux -E0 main.tex'

# platex + dvipdfmx + open with skim
function tskim() {
    # filename without extension
    platex $1 && dvipdfmx $1 && open "$1"".pdf" -a skim
}

# zip tex_sources (current DIR)
function tex2zip() {
    echo "---- zip current DIR files to 'texsrc_$(date +%y%m%d).zip'"
    zip -r texsrc_$(date +%y%m%d).zip * \
        -x "*.git/" "diff/*" "*.DS_Store" "getDiff.sh" "getDiff.config" \
        "texsrc_$(date +%y%m%d).zip" "build/*" "versions/*" "main-diff*" \
        "template/*" "build_log.md"
}

# markdown -> pdf
function md2pdf() {
    pandoc $1 -o output.pdf -V documentclass=myltjsarticle --latex-engine=lualatex
}

# markdown -> doc
function md2docx() {
    output="${1:r}.docx"
    pandoc -o $output -f markdown+ignore_line_breaks $1
}

function tailc() {
    ssh $1 -t 'source ~/.zshrc; tail -f ~/matLocal/logs'
}

# pdf圧縮
# http://askubuntu.com/questions/113544/how-to-reduce-pdf-filesize
# オプションの比較 http://za.toypark.in/html/2010/09-17.html
# -dPDFSETTINGS=/default # 300dpi images
# -dPDFSETTINGS=/ebook # 150dpi images
function pdfcompress_gs() {
    output="${1:r}_gs.pdf"
    gs -sDEVICE=pdfwrite \
    -dCompatibilityLevel=1.4 \
    -dPDFSETTINGS=/screen \
    -dNOPAUSE -dQUIET -dBATCH \
    -sOutputFile=$output $1
}

# pdf join
function pdfjoin() {
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite \
        -sOutputFile=merged.pdf \
        input1.pdf input2.pdf
}

# slow but effective
function pdfcompress_ps() {
    output="${1:r}_ps.pdf"
    tmp="${1:r}.ps"
    pdf2ps $1 $tmp && ps2pdf $tmp $output
}

function gifcompress() {
    output="${1:r}_cp.gif"
    gifsicle -O3 $1 -o $output
}

function pdf2eps_inkscape() {
    # no alpha support
    output="${1:r}.eps"
    inkscape $1 --export-eps=$output
}

function pdf2eps_pdftops() {
    # no alpha support
    pdfcrop --margins 5 $1
    cropped="${1:r}-crop.pdf"
    pdftops -level3 -r 125 -aaRaster yes -eps $cropped "${1:r}.eps"
    rm $cropped
}

function svg2eps() {
    # no alpha support
    output="${1:r}.eps"
    inkscape -f $1 -T -E $output
}

# function eps_crop() {
#     tmppdf="tmp_${1:r}.pdf"
#     output="crop_${1}"
#     gs -o $tmppdf -sDEVICE=pdfwrite -dEPSCrop $1
#     gs -o $output -sDEVICE=pdfwrite -dEPSCrop $tmppdf
# }

# Quick Lock without debug
function ql() {
    qlmanage -p $1 &>/dev/null
}

# png -> pdf変換
function png2pdf() {
    PDFORIGIN="${1:r}_org.pdf"
    PDFOUTPUT="${1:r}.pdf"
    # png -> pdf
    convert $1 $PDFORIGIN
    # compress pdf
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$PDFOUTPUT $PDFORIGIN
    # remove tmp
    rm $PDFORIGIN
}

# ag検索してでpeco絞り込み，vimで該当行を開く
# http://qiita.com/fmy/items/b92254d14049996f6ec3
function agvim () {
  vim $(ag "$@" | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

# create tex dir
function mktexdir () {
    mkdir tex_src
    mkdir tex_src/figs
    mkdir tex_src/tables
    mkdir tex_src/style_files
    mkdir tex_src/sections
    mkdir tex_src/build # 中間ファイル置き場
    tree -L 2 tex_src   # 結果表示
}

# latexmk to ./build dir
function latexmkb () {
    latexmk -pvc -interaction=nonstopmode -jobname=./build/${1:r} $1
}

# latexmk to .
function latexmkc () {
    latexmk -pvc -interaction=nonstopmode $1
}

# latexdiff + latexmk
function latexdiffmk () {
    # ex) latexdiff-vc --git --flatten -r HEAD^ main.tex
    latexdiff-vc --type=CFONT --git --flatten --force -r $1 $2
    OUTPUT="${2:r}-diff${1:r}.tex"
    latexmk -pv -interaction=nonstopmode -jobname=./diff/${OUTPUT:r} $OUTPUT
    # mv $OUTPUT ./diff/
}

# not work
function latexdiffmkb () {
    latexdiff-vc --type=CFONT --git --flatten --force -r $1 $2
    OUTPUT="${2:r}-diff${1:r}.tex"
    latexmk -pvc -interaction=nonstopmode -jobname=./diff/${OUTPUT:r} $OUTPUT
}

# search text browser
alc()
{
    w3m "http://eow.alc.co.jp/"$1"/UTF-8/?ref=sa"
}

# cd + ls
function cdls (){
    cd $1 && ls
}

# RPROMPT toggle
function toggle_rprompt (){
    if [ -n "$RPROMPT" ]; then # non zero length
        export RPROMPT=''            # 右側のプロンプトを無くす
    else
        export RPROMPT=$tmp_rprompt  # 右側のプロンプト
    fi
}
# }}}

# dotfiles保管場所
if [ -e ${HOME}/.dotfiles ]; then
    export DOTSDIR="${HOME}/.dotfiles"
else
    export DOTSDIR="${HOME}"
fi

# for local bin
[ -d $HOME/usr/local/bin ] && export PATH=$HOME/usr/local/bin:$PATH
[ -d $HOME/local/bin ] && export PATH=$HOME/local/bin:$PATH
[ -d $HOME/bin ] && export PATH=$HOME/bin:$PATH

# for python
export PYTHONPATH=${HOME}/lab_yoshida
# for pyside
export LD_LIBRARY_PATH=~/.pyenv/versions/miniconda3-3.9.1/lib/python3.4/site-packages/PySide

# for cec2013 banchmark suite
# export CEC13DATA=${PYTHONPATH}/cec2013single/cec2013single/cec2013_data
export CEC13DATA=${HOME}/lab_yoshida/cec2013single/cec2013single/cec2013_data

# for supervisor, hostname を展開してsocketファイル名に
export HOST=`hostname`

#---------------------
# 環境依存設定
#---------------------
case "${OSTYPE}" in
# mac
darwin*)
    [ -f ~/.zshrc.osx ] && source ~/.zshrc.osx
    [ -f ~/.aliases.zsh ] && source ~/.aliases.zsh
    # for antigen
    [ -f ~/.antigen/antigen.zsh ] && source ~/.antigen/antigen.zsh
    [ -f ~/.antigen_bundles ] && source ~/.antigen_bundles
    # set default postgresql
    export PGDATA=/usr/local/var/postgres
    # for qr workers by supervisor
    export RQWORKER_NUM=3 # supervisor + rq で起動するワーカ数
    ;;
linux*)
    [ -f ~/.zshrc.linux ] && source ~/.zshrc.linux
    # set default postgresql
    [ -e /var/lib/pgsql/9.4/data ] && export PGDATA=/var/lib/pgsql/9.4/data
    # set default rq-worker url
    export REDIS_URL='redis://localhost:6379/0'  # port 6379, db 0
    # プロセッサーの数だけ開く
    export RQWORKER_NUM=`grep processor /proc/cpuinfo | wc -l`
    ;;
esac


# for rbenv
if [ -d $HOME/.rbenv ]; then
    eval "$(rbenv init - --no-rehash)"
    # homebrew で入れた場合にはrbenv init -のみでOKのよう.
    # https://github.com/sstephenson/rbenv#understanding-path
    # rehashしないように変更
fi

# for pyenv
# if [ -d $HOME/.pyenv ]; then
#     export PYENV_ROOT="$HOME/.pyenv"
#     export PATH="$PYENV_ROOT/bin:$PATH"
#     eval "$(pyenv init -)" # zshrcの最後に書かないと効かない?
# fi

# added by Anaconda3 installer
# if [ -d $HOME/anaconda3/bin ]; then
# export PATH="$HOME/anaconda3/bin:$PATH"  # commented out by conda initialize
# fi

[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/yyamnk/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/yyamnk/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/yyamnk/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/yyamnk/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#

#
conda activate lab
