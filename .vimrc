" Last Change:2017-Feb-25.

" neobundle 設定を読む
source $HOME/.vimrc.neobundle

" ------------------------------------------------------- "
" General
" ------------------------------------------------------- " {{{
set nocompatible      " viの互換性を優先せず, vimの機能を制限しない
set clipboard+=unnamed " ヤンクとクリップボードを共有できると聞いて
set notimeout         " no timeout for keymap
"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない
" 0埋め数字を10進数として扱う for インクリメント
set nf=""
" }}}

"-------------------------------------------------------"
" set FileType
"-------------------------------------------------------" {{{
au BufNewFile,BufRead *.md   set filetype=markdown
au BufNewFile,BufRead *.snip set filetype=neosnippet
au BufNewFile,BufRead *.pyx  set filetype=python
" }}}

" ------------------------------------------------------- "
" key maps
" ------------------------------------------------------- " {{{
let mapleader = "\<Space>"
nnoremap ZQ <Nop> " 保存せず閉じるZQ, 保存して閉じるZZ
" inoremap <Space>e <End>
" inoremap <C-d> <Del> " インサートモードでインデント操作したいので無効化
inoremap <C-b> <Left>
" inoremap <C-n> <BS>
" inoremap <C-m> <CR>
" HOME and END in insert mode
inoremap <C-a> <HOME>
inoremap <C-e> <END>
inoremap <silent> jj <Esc>
" inoremap <silent> hh <Esc>
" j,  k による移動を折り返されたテキストでも自然に振る舞うように変更
" 単語削除 カーソル前の単語を削除
inoremap <C-w> <C-o>db
" カーソルが文末にあるときの挙動が気に入らない...
nnoremap j gj
nnoremap k gk
" nnoremap :: :w<cr> " ホームポジションでやりたい．小指だと辛い．
nnoremap tt :w<cr>
nnoremap Q <Nop>

" vim設定ファイル
nnoremap <silent> <Leader>ev :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Leader>en :<C-u>edit $DOTSDIR/.vimrc.neobundle<CR>
nnoremap <silent> <Leader>ep :<C-u>edit $DOTSDIR/.vimrc.plugin<CR>
nnoremap <silent> <Leader>rv :<C-u>source $MYVIMRC<CR>
nnoremap <silent> <Leader>es :NeoSnippetEdit<CR>

" インデント操作, <<, >>は不便, インサートモードと同じ設定にする
nnoremap <Leader>t >>
nnoremap <Leader>d <<
vnoremap <Leader>t >>
vnoremap <Leader>d <<

" }}}

" ------------------------------------------------------- "
" syntax
" ------------------------------------------------------- " {{{
syntax on " 構文ハイライトを有効化

" ---------カーソル下のHighlightInfoを表示--------- " {{{
function! s:get_syn_id(transparent)
    let synid = synID(line('.'), col('.'), 1)
    return a:transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid)
    return synIDattr(a:synid, 'name')
endfunction
function! s:get_highlight_info()
    execute "highlight " . s:get_syn_name(s:get_syn_id(0))
    execute "highlight " . s:get_syn_name(s:get_syn_id(1))
endfunction
command! HighlightInfo call s:get_highlight_info()
" ---------カーソル下のHighlightInfoを表示--------- " }}}
" }}}

" ------------------------------------------------------- "
" タブ, インデント関連
" ------------------------------------------------------- " {{{
set expandtab
set tabstop=4     " 画面上でタブ文字が占める幅
set shiftwidth=4  " 自動インデントでずれる幅
set softtabstop=4 " 連続した空白に対してタブやバックスペースでカーソルが動く幅
" タブ幅を変更
au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.rb    set tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.rake  set tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.erb   set tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.yml   set tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.css   set tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.js    set tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.xml   set tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.tex   set tabstop=2 shiftwidth=2 softtabstop=2
au BufNewFile,BufRead *.html  set tabstop=2 shiftwidth=2 softtabstop=2

set autoindent           " 改行時に前の行のインデントを継続する
set smartindent          " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set backspace=indent,eol " BSでインデント, 改行を削除
autocmd BufNewFile,BufRead *.snip setlocal noexpandtab " snippetはハードタブ入力
autocmd BufNewFile,BufRead,BufWritePre *.snip setlocal noexpandtab | retab!
autocmd BufNewFile,BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" }}}

" ------------------------------------------------------- "
" 折りたたみ
" ------------------------------------------------------- " {{{
set foldmethod=marker   " markerで折りたたみ位置を決定
" set foldmethod=indent
set foldcolumn=2
set foldlevel=0 " vimで開くときにどのレベルまで折りたたんで表示するか
autocmd FileType neosnippet set nofoldenable " snippet だけは折り畳まない
" autocmd FileType tex set foldmarker=%{{{%,%}}}% " マーカが数式と競合するのを回避
autocmd FileType markdown set foldlevel=2
" autocmd FileType xml :set foldmethod=syntax foldlevel=3
" let g:xml_syntax_folding = 1
" autocmd FileType xml set foldmethod=syntax foldlevel=4
autocmd FileType xml set foldlevel=0 foldmarker=[[[,]]]
autocmd FileType python set foldmethod=indent
" }}}

" ------------------------------------------------------- "
" カーソル移動
" ------------------------------------------------------- " {{{
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
" }}}

" ------------------------------------------------------- "
" 保存処理
" ------------------------------------------------------- " {{{
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 未保存ファイルがあるときでも別のファイルを開くことが出来る
set autoread   " 外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" autocmd BufWritePre * :%s/\s\+$//ge " 保存時に行末の空白を除去する
" autocmd BufWritePre * :%s/\s\{1\}$//ge " 保存時に行末の空白1文字を除去する

" &filetype=markdownのみ行末スペースを削除しない
function! RemoveSpace() " {{{
    if &filetype!='markdown'
        :%s/\s\+$//ge
        " echo "remove space"
    endif
endfunction " }}}
autocmd BufWritePre * call RemoveSpace() " 保存時に行末の空白を除去する

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %
" }}}

" ------------------------------------------------------- "
" 検索, 置換
" ------------------------------------------------------- " {{{
set hlsearch   " 検索文字列をハイライトする
" set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大小文字混在で検索した場合のみ、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
" nmap <ESC><ESC> :noh<CR><ESC>  "Escの2回押しでハイライト消去
nmap <ESC><ESC> :noh<CR>  "Escの2回押しでハイライト消去
" }}}

" ------------------------------------------------------- "
" コマンドモード
" ------------------------------------------------------- " {{{
" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu
set wildmode=longest:full,full
set history=100 " コマンドラインの履歴保存数

" 現在開いているのファイルと同じディレクトリのファイルを開く
" http://qiita.com/ukitazume/items/c1d2814497bc036f1a82
" コマンドラインで%%とすると現在のpathを補完
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%

cnoremap <C-a> <HOME>
cnoremap <C-e> <END>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-d> <Del>
cnoremap <C-b> <Left>
" }}}

" ------------------------------------------------------- "
" エンコーディング
" ------------------------------------------------------- " {{{
set fileencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp,utf-8,cp932,euc-jp,default,latin
set fileformat=unix

" --------- 日本語を含まない場合のfileencoding --------- " {{{
if has('autocmd')
    function! AU_ReCheck_FENC()
        if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
            let &fileencoding=&encoding
        endif
    endfunction
    autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" }}}

" --------- 改行コード自動認識 --------- " {{{
set fileformats=unix,dos,mac
 " □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
    set ambiwidth=double
endif

au BufWritePost * call SetUTF8Xattr(expand("<afile>"))

function! SetUTF8Xattr(file)
    let isutf8 = &fileencoding == "utf-8" || ( &fileencoding == "" && &encoding == "utf-8")
    if has("unix") && match(system("uname"),'Darwin') != -1 && isutf8
        call system("xattr -w com.apple.TextEncoding 'utf-8;134217984' '" . a:file . "'")
    endif
endfunction
" }}}
" }}}

" ------------------------------------------------------- "
" open adobe
" ------------------------------------------------------- " {{{
function! s:open_adobe()
    let l:pdfname = expand("%:r") . ".pdf"
    " echo l:pdfname
    echo " open '"  . l:pdfname . "' -a Adobe\ Reader"
    call system("open " . l:pdfname . " -a Adobe\\ Reader")
endfunction
command! Adobe call s:open_adobe()
" }}}

" ------------------------------------------------------- "
" auto paste mode
" http://qiita.com/ringo/items/bb9cf61a3ccfe6183c7b
" ------------------------------------------------------- " {{{
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function! XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif
" }}}

" ------------------------------------------------------- "
" for Ginger
" https://github.com/mattn/ginger-vim/blob/master/plugin/ginger.vim
" ------------------------------------------------------- " {{{
" Usage ':Ginger This is a test'
let s:endpoint = 'http://services.gingersoftware.com/Ginger/correct/json/GingerTheText'
let s:apikey = '6ae0c3a0-afdc-4532-a810-82ded0054236'
function! s:ginger(text)
  let res = webapi#json#decode(webapi#http#get(s:endpoint, {
  \ 'lang': 'US',
  \ 'clientVersion': '2.0',
  \ 'apiKey': s:apikey,
  \ 'text': a:text}).content)
  let i = 0
  let correct = ''
  echon "Mistake: "
  for rs in res['LightGingerTheTextResult']
    let [from, to] = [rs['From'], rs['To']]
    if i < from
      echon a:text[i : from-1]
      let correct .= a:text[i : from-1]
    endif
    echohl WarningMsg
    echon a:text[from : to]
    echohl None
    let correct .= rs['Suggestions'][0]['Text']
    let i = to + 1
  endfor
  if i < len(a:text)
    echon a:text[i :]
    let correct .= a:text[i :]
  endif
  echo "Correct: ".correct
endfunction

command! -nargs=+ Ginger call s:ginger(<q-args>)
" }}}

" ------------------------------------------------------- "
" for ctag
" ------------------------------------------------------- " {{{
" 現在のdirからhomeまで再帰的にtagを追加
if has('path_extra')
    set tags+=tags;/Users/yyama
endif
" }}}


" neobundle pluginの設定追加
source $HOME/.vimrc.plugin


" ------------------------------------------------------- "
" 画面表示
" put after vundle#end()
" ------------------------------------------------------- " {{{
set ambiwidth=double " 全角文字の表示指定
" 同時にiterm2 Preferences > Profile > Text > Double-Width Charactersの
" Treat ambiguous-width characters as double width.
" にチェックを入れる.
set number " 行番号表示
set laststatus=2 " 画面最下部のステータス行を 常に表示(2)
set cmdheight=2  " ステータス行より下のメッセージ表示欄の行数
set showmatch    " カーソル位置の括弧と対応する括弧を強調表示

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" autocmd FileType *tex set spell " texのみスペルチェックをonに
" autocmd FileType matlab set nospell " matlabのみスペルチェックをoff
autocmd FileType tex set spell " texのみスペルチェックをoff
set spelllang+=cjk " spellチェックから日本語を除外する
" http://d.hatena.ne.jp/osyo-manga/20131117/1384691873

" タブ文字等々を可視化
" http://futuremix.org/2011/02/display-tab-full-width-space-chars-on-vim
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:_ " 改行も表示する場合 ,eol:↲,
set list          " 不可視文字を表示
highlight SpecialKey cterm=NONE ctermfg=8
highlight JpSpace cterm=underline ctermfg=9
au BufRead,BufNew * match JpSpace /　/

" 折り返し幅
" set textwidth=80 " 自動的に改行を挿入する幅
set numberwidth=2 " 行数表示の桁数
" set columns=85 " numberwidthを含め, この列数で折りたたみ, vspでも適用されてる...
set wrap " 折りたたみ行う
set colorcolumn=80 " 80文字でラインを入れる

" ---------カーソル下のhighlightInfoを表示--------- " {{{
" http://qiita.com/pasela/items/903bb9f5ac1b9b17af2c
function! s:get_syn_id(transparent)
    let synid = synID(line('.'), col('.'), 1)
    return a:transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid)
    return synIDattr(a:synid, 'name')
endfunction
function! s:get_highlight_info()
    execute "highlight " . s:get_syn_name(s:get_syn_id(0))
    execute "highlight " . s:get_syn_name(s:get_syn_id(1))
endfunction
command! HighlightInfo call s:get_highlight_info()
" }}}

" -----------cursorlineを必要なときにだけ有効にする " {{{
" http://d.hatena.ne.jp/thinca/20090530/1243615055
augroup vimrc-auto-cursorline
    autocmd!
    autocmd CursorMoved,CursorMovedI * call Auto_cursorline('CursorMoved')
    autocmd CursorHold,CursorHoldI * call Auto_cursorline('CursorHold')
    autocmd WinEnter * call Auto_cursorline('WinEnter')
    autocmd WinLeave * call Auto_cursorline('WinLeave')

    let g:cursorline_lock = 0
    function! Auto_cursorline(event)
        if a:event ==# 'WinEnter'
            setlocal cursorline
            setlocal cursorcolumn
            let g:cursorline_lock = 2
        elseif a:event ==# 'WinLeave'
            setlocal nocursorline
            setlocal nocursorcolumn
        elseif a:event ==# 'CursorMoved'
            if g:cursorline_lock
                if 1 < g:cursorline_lock
                    let g:cursorline_lock = 1
                else
                    setlocal nocursorline
                    setlocal nocursorcolumn
                    let g:cursorline_lock = 0
                endif
            endif
        elseif a:event ==# 'CursorHold'
            setlocal cursorline
            setlocal cursorcolumn
            let g:cursorline_lock = 1
        endif
    endfunction
augroup END
" }}}


" カラースキーマ関連
set t_Co=256  " before colorscheme configure
" http://blog.remora.cx/2012/10/let-us-use-solarized.html
" ==== colorschemeの選択 ==
" colorscheme solarized
" colorscheme hybrid
" colorscheme desert
" colorscheme desert-warm-256
" set background=dark
colorscheme jellybeans  " no transparent in lxterm

" カーソルラインの色
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

" --- desert用設定
if get(g:, 'colors_name', '') ==? 'desert'
    " hybridより借用
    highlight Visual term=none cterm=none ctermbg=237   " 選択時の色
    highlight Search term=none ctermfg=234 ctermbg=221  " 検索ハイライト
    highlight   Pmenu ctermfg=250 ctermbg=237                       " NeocomplCasheでの補完候補窓
    highlight   PmenuSel term=reverse cterm=reverse ctermfg=250 ctermbg=237 " NeocomplCasheでの候補選択時の色
    highlight   MatchParen ctermfg=232 ctermbg=166
    highlight Function term=bold ctermfg=221
    " highlight Statement ctermfg=110
    highlight CursorColumn ctermfg=NONE ctermbg=256
endif

" --- jellybeans用設定
if get(g:, 'colors_name', '') ==? 'jellybeans'
    " highlight CursorColumn ctermfg=NONE ctermbg=234
    " " highlight LineNr ctermfg=186
    " highlight Statement ctermfg=111
    " highlight LineNr ctermfg=95 ctermbg=234 term=underline
    " highlight Normal ctermbg=235
    "
    " transparency setting
    let g:jellybeans_background_color_256='NONE'
    set background=light
    highlight LineNr ctermfg=95
endif

" --- solarized用設定
if get(g:, 'colors_name', '') ==? 'solarized'
    let g:solarized_contrast = "high"
    let g:solarized_degrade = 1
    set background=light
    highlight linenr ctermfg=103
    autocmd filetype *tex highlight comment term=bold ctermfg=4
endif

" --- morning設定( neocomplcasheウインドウ見えない...
if get(g:, 'colors_name', '') ==? 'morning'
    highlight Pmenu ctermbg=8 guibg=#606060
    highlight PmenuSel ctermfg=130 ctermbg=81 guifg=#dddd00 guibg=#1f82cd
    highlight PmenuSbar ctermbg=0 guibg=#d6d6d6
endif
