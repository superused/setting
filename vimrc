scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)
"
" An example for a Japanese version vimrc file.
" 日本語版のデフォルト設定ファイル(vimrc) - Vim7用試作
"
" Last Change: 01-Oct-2015.
" Maintainer:  MURAOKA Taro <koron.kaoriya@gmail.com>
"
" 解説:
" このファイルにはVimの起動時に必ず設定される、編集時の挙動に関する設定が書
" かれています。GUIに関する設定はgvimrcに書かかれています。
"
" 個人用設定は_vimrcというファイルを作成しそこで行ないます。_vimrcはこのファ
" イルの後に読込まれるため、ここに書かれた内容を上書きして設定することが出来
" ます。_vimrcは$HOMEまたは$VIMに置いておく必要があります。$HOMEは$VIMよりも
" 優先され、$HOMEでみつかった場合$VIMは読込まれません。
"
" 管理者向けに本設定ファイルを直接書き換えずに済ませることを目的として、サイ
" トローカルな設定を別ファイルで行なえるように配慮してあります。Vim起動時に
" サイトローカルな設定ファイル($VIM/vimrc_local.vim)が存在するならば、本設定
" ファイルの主要部分が読み込まれる前に自動的に読み込みます。
"
" 読み込み後、変数g:vimrc_local_finishが非0の値に設定されていた場合には本設
" 定ファイルに書かれた内容は一切実行されません。デフォルト動作を全て差し替え
" たい場合に利用して下さい。
"
" 参考:
"   :help vimrc
"   :echo $HOME
"   :echo $VIM
"   :version

"---------------------------------------------------------------------------
" サイトローカルな設定($VIM/vimrc_local.vim)があれば読み込む。読み込んだ後に
" 変数g:vimrc_local_finishに非0な値が設定されていた場合には、それ以上の設定
" ファイルの読込を中止する。
if 1 && filereadable($VIM . '/vimrc_local.vim')
  unlet! g:vimrc_local_finish
  source $VIM/vimrc_local.vim
  if exists('g:vimrc_local_finish') && g:vimrc_local_finish != 0
    finish
  endif
endif

"---------------------------------------------------------------------------
" ユーザ優先設定($HOME/.vimrc_first.vim)があれば読み込む。読み込んだ後に変数
" g:vimrc_first_finishに非0な値が設定されていた場合には、それ以上の設定ファ
" イルの読込を中止する。
if 1 && exists('$HOME') && filereadable($HOME . '/.vimrc_first.vim')
  unlet! g:vimrc_first_finish
  source $HOME/.vimrc_first.vim
  if exists('g:vimrc_first_finish') && g:vimrc_first_finish != 0
    finish
  endif
endif

" plugins下のディレクトリをruntimepathへ追加する。
for s:path in split(glob($VIM.'/plugins/*'), '\n')
  if s:path !~# '\~$' && isdirectory(s:path)
    let &runtimepath = &runtimepath.','.s:path
  end
endfor
unlet s:path

"---------------------------------------------------------------------------
" 日本語対応のための設定:
"
" ファイルを読込む時にトライする文字エンコードの順序を確定する。漢字コード自
" 動判別機能を利用する場合には別途iconv.dllが必要。iconv.dllについては
" README_w32j.txtを参照。ユーティリティスクリプトを読み込むことで設定される。
source $VIM/plugins/kaoriya/encode_japan.vim
" メッセージを日本語にする (Windowsでは自動的に判断・設定されている)
if !(has('win32') || has('mac')) && has('multi_lang')
  if !exists('$LANG') || $LANG.'X' ==# 'X'
    if !exists('$LC_CTYPE') || $LC_CTYPE.'X' ==# 'X'
      language ctype ja_JP.eucJP
    endif
    if !exists('$LC_MESSAGES') || $LC_MESSAGES.'X' ==# 'X'
      language messages ja_JP.eucJP
    endif
  endif
endif
" MacOS Xメニューの日本語化 (メニュー表示前に行なう必要がある)
if has('mac')
  set langmenu=japanese
endif
" 日本語入力用のkeymapの設定例 (コメントアウト)
if has('keymap')
  " ローマ字仮名のkeymap
  "silent! set keymap=japanese
  "set iminsert=0 imsearch=0
endif
" 非GUI日本語コンソールを使っている場合の設定
if !has('gui_running') && &encoding != 'cp932' && &term == 'win32'
  set termencoding=cp932
endif

"---------------------------------------------------------------------------
" メニューファイルが存在しない場合は予め'guioptions'を調整しておく
if 1 && !filereadable($VIMRUNTIME . '/menu.vim') && has('gui_running')
  set guioptions+=M
endif

"---------------------------------------------------------------------------
" Bram氏の提供する設定例をインクルード (別ファイル:vimrc_example.vim)。これ
" 以前にg:no_vimrc_exampleに非0な値を設定しておけばインクルードはしない。
if 1 && (!exists('g:no_vimrc_example') || g:no_vimrc_example == 0)
  if &guioptions !~# "M"
    " vimrc_example.vimを読み込む時はguioptionsにMフラグをつけて、syntax on
    " やfiletype plugin onが引き起こすmenu.vimの読み込みを避ける。こうしない
    " とencに対応するメニューファイルが読み込まれてしまい、これの後で読み込
    " まれる.vimrcでencが設定された場合にその設定が反映されずメニューが文字
    " 化けてしまう。
    set guioptions+=M
    source $VIMRUNTIME/vimrc_example.vim
    set guioptions-=M
  else
    source $VIMRUNTIME/vimrc_example.vim
  endif
endif

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=8
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set nonumber
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
" colorscheme evening " (Windows用gvim使用時はgvimrcを編集すること)

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
"set nobackup


"---------------------------------------------------------------------------
" ファイル名に大文字小文字の区別がないシステム用の設定:
"   (例: DOS/Windows/MacOS)
"
if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
  " tagsファイルの重複防止
  set tags=./tags,tags
endif

"---------------------------------------------------------------------------
" コンソールでのカラー表示のための設定(暫定的にUNIX専用)
if has('unix') && !has('gui_running')
  let s:uname = system('uname')
  if s:uname =~? "linux"
    set term=builtin_linux
  elseif s:uname =~? "freebsd"
    set term=builtin_cons25
  elseif s:uname =~? "Darwin"
    set term=beos-ansi
  else
    set term=builtin_xterm
  endif
  unlet s:uname
endif

"---------------------------------------------------------------------------
" コンソール版で環境変数$DISPLAYが設定されていると起動が遅くなる件へ対応
if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

"---------------------------------------------------------------------------
" プラットホーム依存の特別な設定

" WinではPATHに$VIMが含まれていないときにexeを見つけ出せないので修正
if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

if has('mac')
  " Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
  set iskeyword=@,48-57,_,128-167,224-235
endif

"---------------------------------------------------------------------------
" KaoriYaでバンドルしているプラグインのための設定

" autofmt: 日本語文章のフォーマット(折り返し)プラグイン.
set formatexpr=autofmt#japanese#formatexpr()

" vimdoc-ja: 日本語ヘルプを無効化する.
if kaoriya#switch#enabled('disable-vimdoc-ja')
  let &rtp = join(filter(split(&rtp, ','), 'v:val !~ "[/\\\\]plugins[/\\\\]vimdoc-ja"'), ',')
endif

" Copyright (C) 2009-2013 KaoriYa/MURAOKA Taro


set nocompatible
filetype off

" init command
"$ mkdir -p ~/.vim/bundle
"$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
if has('vim_starting')
  " set runtimepath+=../../vim74-kaoriya-win64/bundle/neobundle.vim
  set runtimepath+=C:/vim74-kaoriya-win64/bundle/neobundle.vim
  " call neobundle#rc(expand('../../vim74-kaoriya-win64/bundle'))
endif
call neobundle#begin(expand('C:/vim74-kaoriya-win64/bundle'))

" NeoBundle 'h1mesuke/unite-outline'
" NeoBundle 'Align'
NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'gregsexton/gitv'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
" NeoBundle 'Shougo/context_filetype.vim'
" NeoBundle 'Lokaltog/powerline-fontpatcher'
NeoBundle 'vim-scripts/mru.vim' "最近開いたファイルの履歴を見る :MRU
" NeoBundle 'Townk/vim-autoclose' "括弧を入力した際に自動で閉じ括弧を挿入する
NeoBundle 'tomtom/tcomment_vim' "コメントを楽に行う
" NeoBundle 'Shougo/vimfiler.vim'
" NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/neocomplete.vim'

"bundle color
" NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'nielsmadan/harlequin'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'jonathanfilip/vim-lucius'
" NeoBundle 'altercation/vim-colors-solarized'

"colorscheme view bundle
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'ujihisa/unite-colorscheme' " Unite -auto-preview colorscheme

call neobundle#end()

"<C-s>でvimshellを開くウィンドウが固まる場合は~/.bashrcに記述を追加→stty stop undef
" set splitbelow "新しいウインドウを下に開く
" nnoremap <silent> <C-s>      :new<CR><C-w>20-:VimShell<CR>

"<C-h>で最近開いたファイルの履歴を見る
nmap <silent> <C-h>      :MRU<CR>

" neocomplete用設定
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" insertモードから戻るのが遅いので対策
if !has('gui_running')
    set notimeout
    set ttimeout
    set timeoutlen=100
endif
"<C-e>でNERDTreeをオンオフ。いつでもどこでも
"	map <silent> <C-e>   :NERDTreeTabsToggle<CR>
"	lmap <silent> <C-e>  :NERDTreeTabsToggle<CR>
nmap <silent> <C-e>      :NERDTreeTabsToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeTabsToggle<CR>
omap <silent> <C-e>      :NERDTreeTabsToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeTabsToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeTabsToggle<CR>

"引数なしでvimを開いたらNERDTreeを起動、
"引数ありならNERDTreeは起動しない、引数で渡されたファイルを開く。
"How can I open a NERDTree automatically when vim starts up if no files were specified?
" autocmd vimenter * if !argc() | NERDTreeTabs | endif

"他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
"How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeTabsType") && b:NERDTreeTabsType == "primary") | q | endif



"\ エスケープ記号
"$ ファイル名の最後
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$'] "NERDTreeIgnore 無視するファイルを設定する。
"let g:NERDTreeIgnore=['\.vim$', '\.clean$']
"let g:NERDTreeIgnore=['\.vim$', '\~$']
"let g:NERDTreeIgnore=[]
let g:NERDTreeShowHidden=1 "1 : 隠しファイルを表示する。
let g:NERDTreeWinSize=20 "NERDTreeのツリーの幅
let g:NERDTreeMinimalUI=1 "ブックマークや、ヘルプのショートカットをメニューに表示する。
let g:NERDTreeDirArrows=0 "NERDTreeを+|`などを使ってツリー表示をする。 1 : +|`などを使わない
let g:NERDTreeMouseMode=2 "マウス操作方法 1 : ファイル、ディレクトリ両方共ダブルクリックで開く。 2 : ディレクトリのみシングルクリックで開く。3 : ファイル、ディレクトリ両方共シングルクリックで開く。
let g:NERDTreeShowBookmarks=1 " ブックマークを最初から表示
let NERDTreeShowLineNumbers=0 "ブックマークを記録したファイルの設置場所を指定。 0 : 行番号を表示しない。

" 起動時にはNERDTreeを表示しない
autocmd vimenter * NERDTree|normal gg3j

"NERDTreeStatusline NERDtreeウィンドウにステータスラインを表示。
"Values: Any valid statusline setting.
"Default: %{b:NERDTreeRoot.path.strForOS(0)}


autocmd FileType gitv call s:my_gitv_settings()
function! s:my_gitv_settings()
  " s:my_gitv_setting 内
  setlocal iskeyword+=/,-,.
  nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
  nnoremap <buffer> <Space>rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
  nnoremap <buffer> <Space>R :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Space>h :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> <Space>rh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>
  noremap <silent><buffer> t :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
endfunction

function! s:gitv_get_current_hash()
  return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
endfunction

autocmd FileType git setlocal nofoldenable foldlevel=0
function! s:toggle_git_folding()
  if &filetype ==# 'git'
    setlocal foldenable!
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""tag" その他オプション
""tag" 未設定＆未使用＆未翻訳。
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocp
filetype plugin indent on

" If there area uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set bg=dark
hi clear
if exists("syntax_on")
syntax reset
endif
"
" let colors_name = "darkblue"

set encoding=utf8 "エンコード
set fenc=utf-8 "エンコード
scriptencoding utf8
set ambiwidth=double
" set fileformat=unix
" set fileformats=unix,dos,mac
set fileformat=dos
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set ambiwidth=double
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
" カレント行にアンダーラインを引く
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
highlight CursorLine gui=underline ctermfg=NONE ctermbg=NONE

" set nocursorline     " カーソル行の強調表示をしない
" set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=1    " メッセージ表示欄を1行確保
set tw=0           " 自動改行しない(twは自動改行させる文字数。0だと自動改行しない)
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
" 不可視文字の表示記号指定
" set listchars=eol:竊ｲ,tab:笆ｸ\
" set listchars=tab:笆ｸ\
" set listchars=tab:>\ ,trail:_
" カーソル移動関連の設定

set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

" ファイル処理関連の設定
set nowrap     " 画面の端で行を折り返さない
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない
set undodir=C:/vim74-kaoriya-win64/undo/ " undoファイルの置き場
set undofile   " ファイル編集中にundoファイルを作る "

" 検索/置換の設定
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

au BufNewFile,BufRead *.php set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.html.twig set nowrap tabstop=4 shiftwidth=4

" 動作環境との統合関連の設定
" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
set clipboard+=autoselect
set mouse=a " マウスの入力を受け付ける
set ttymouse=xterm2
set shellslash " Windows でもパスの区切り文字を / にする
" インサートモードから抜けると自動的にIMEをオフにする
"set iminsert=2

" コマンドラインの設定
set wildmenu "コマンドラインモードでファイル名を補完する
set wildmenu wildmode=list:longest,full " コマンドラインモードでTABキーによるファイル名補完を有効にする
set history=10000 " コマンドラインの履歴を10000件保存する
set visualbell t_vb= "ビープ音すべてを無効にする
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

filetype indent plugin on
syntax on

set showcmd
set syn=php
"set colorscheme torte
set t_Co=256
set t_ut=
set hlsearch
set nomodeline
set ignorecase
set smartcase
set smarttab
set backspace=indent,eol,start
set nostartofline
set ruler "カーソルが何行目の何列目か表示
set visualbell
set notimeout ttimeout ttimeoutlen=200

"set syntax=htmldjango
map Y y$

nnoremap <C-L> :nohl<CR><C-L>
noremap ; :

" autocmd vimenter * NERDTreeTabsOpen

augroup filetypedetect
    au BufRead,BufNewFile *.twig set filetype=htmldjango
augroup END

nnoremap <silent><C-n> :tabn<CR>
nnoremap <silent><C-p> :tabp<CR>
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q <C-u>cfirst<CR>
nnoremap ]Q <C-u>clast<CR>

" ショートカット
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sx <C-w>x
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap S <C-w><
nnoremap F <C-w>>
nnoremap C <C-w>+
nnoremap X <C-w>-
nnoremap sT :Unite tab<CR>
nnoremap sB :Unite buffer<CR>

" タブの移動
function! s:MoveTabpage(num)
  if type(a:num) != type(0)
    return
  endif

  let pos = tabpagenr() - 1 + a:num
  let tabcount = tabpagenr("$")

  if pos < 0
    let pos = tabcount - 1
  elseif pos >= tabcount 
    let pos = 0
  endif

  execute "tabmove " . pos
endfunction

" タブ移動：タブページの番号をC-k,C-jで移動させる
command! -nargs=1 TabMove :call <SID>MoveTabpage(<f-args>)

nnoremap <silent><C-k> :call <SID>MoveTabpage(1)<Return><CR>
nnoremap <silent><C-j> :call <SID>MoveTabpage(-1)<Return><CR>

inoremap <silent> jj <ESC>

" F4でインサートモードの切り替えを行う
imap <F4> <nop>
set pastetoggle=<F4>

set foldmethod=marker

" colorscheme zenburn
" colorscheme hybrid
" colorscheme mrkn256
" colorscheme jellybeans
" colorscheme railscasts
" colorscheme solarized
" colorscheme iceberg
" colorscheme rdark
" colorscheme wombat
" colorscheme lucius
" colorscheme twilight
" colorscheme desert
" colorscheme pyte
" colorscheme mopkai
" colorscheme inkpot
" colorscheme inkpot
" colorscheme badwolf
" colorscheme monokai
" colorscheme mirodark
" colorscheme codeschool
" colorscheme gruvbox
" colorscheme Tomorrow-Night-Blue
" colorscheme Tomorrow-Night-Bright
" colorscheme Tomorrow-Night-Eighties
" colorscheme Tomorrow-Night
" colorscheme Tomorrow
" colorscheme phd
" colorscheme darktango
" colorscheme BusyBee
" colorscheme nighted
" colorscheme molokai
autocmd vimenter * highlight Comment ctermfg=247
autocmd vimenter * highlight visual ctermbg=88
autocmd vimenter * highlight Normal guifg=#ffffff ctermfg=white

" Setting Of Lightline.vim
let g:lightline = {
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'gitgutter', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'charcode', 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'gitgutter': 'MyGitGutter',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ }
      \ }

      " \ 'component': {
      " \   'lineinfo': ' %3l:%-2v',
      " \ },
function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  " return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '.' : ''
  return &readonly ? '' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%t') ? expand('%t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

function! MyCurrentTag()
  return tagbar#currenttag('%s', '')
endfunction

function! MyCakephp()
  return exists('*cake#buffer') ? cake#buffer('type') : ''
endfunction

if has('mac')
  set termencoding=utf-8
  set encoding=utf-8
  set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
  " set fileencoding=utf-8
  " set fileencodings=utf-8,cp932
endif
"テスト

"vim-indent-guidesプラグイン: vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" restart.vim終了時に保存するセッションオプションを設定する
let g:restart_sessionoptions
  \ = 'blank,buffers,curdir,folds,help,localoptions,tabpages'
" " 現在のディレクトリ直下の .vimsessions/ を取得
" let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.vimsessions')
" " 存在すれば
" if isdirectory(s:local_session_directory)
"   " session保存ディレクトリをそのディレクトリの設定
"   let g:session_directory = s:local_session_directory
"   " vimを辞める時に自動保存
"   let g:session_autosave = 'yes'
"    " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開く
"   let g:session_autoload = 'yes'
"   " 1分間に1回自動保存
"   let g:session_autosave_periodic = 1
" else
"   let g:session_autosave = 'no'
"   let g:session_autoload = 'no'
" endif
" unlet s:local_session_directory

" yank to remote
" let g:y2r_config = {
"             \   'tmp_file': '/tmp/exchange_file',
"             \   'key_file': expand('$HOME') . '/.exchange.key',
"             \   'host': 'localhost',
"             \   'port': 52224,
"             \}
" function Yank2Remote()
"   echo 'test'
"     call writefile(split(@", '\n'), g:y2r_config.tmp_file, 'b')
"     let s:params = ['cat %s %s | nc -w1 %s %s']
"     for s:item in ['key_file', 'tmp_file', 'host', 'port']
"         let s:params += [shellescape(g:y2r_config[s:item])]
"     endfor
"     let s:ret = system(call(function('printf'), s:params))
" endfunction
" " nnoremap <silent> <unique> <Leader>y :call Yank2Remote()<CR>
" nnoremap <silent><unique><C-y> :call Yank2Remote()<CR>

nnoremap <silent> <C-^> <Nop>
set grepprg=grep\ -nH


set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

" NeoBundle 'xolox/vim-session', {
"             \ 'depends' : 'xolox/vim-misc',
"           \ }
"
" " 現在のディレクトリ直下の .vimsessions/ を取得 
" let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.vimsessions')
" " 存在すれば
" if isdirectory(s:local_session_directory)
"   " session保存ディレクトリをそのディレクトリの設定
"   let g:session_directory = s:local_session_directory
"   " vimを辞める時に自動保存
"   let g:session_autosave = 'yes'
"   " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開く
"   let g:session_autoload = 'yes'
"   " 1分間に1回自動保存
"   let g:session_autosave_periodic = 1
" else
"   let g:session_autosave = 'no'
"   let g:session_autoload = 'no'
" endif
" unlet s:local_session_directory

set showtabline=2 
