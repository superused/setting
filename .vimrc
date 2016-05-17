set nocompatible
filetype off

" init command
"$ mkdir -p ~/.vim/bundle
"$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  " call neobundle#rc(expand('~/.vim/bundle'))
endif
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundle 'itchyny/lightline.vim' " VIMのコマンドラインをかっこよくする
NeoBundle 'vim-scripts/mru.vim' "最近開いたファイルの履歴を見る :MRU
NeoBundle 'scrooloose/nerdtree' " ファイラ
NeoBundle 'jistr/vim-nerdtree-tabs' " nerdtreeをより使いやすく
NeoBundle 'tomtom/tcomment_vim' "コメントON,OFFをCtrl+-で簡単に実行
NeoBundle 'vim-scripts/vcscommand.vim' " git, svnプラグイン
NeoBundle 'gregsexton/gitv' "gitプラグイン
NeoBundle 'tpope/vim-fugitive' "gitプラグイン用
NeoBundle 'bronson/vim-trailing-whitespace' "行末の不要な半角スペースを可視化する :FixWhitespace
NeoBundle 'Townk/vim-autoclose' "括弧を入力した際に自動で閉じ括弧を挿入する
NeoBundle 'scrooloose/syntastic' "syntaxチェック
NeoBundle 'tmhedberg/matchit' "対応する括弧に飛ぶ機能を強化
NeoBundle 'violetyk/neocomplete-php.vim' " PHP用補完プラグイン
NeoBundle 'AndrewRadev/splitjoin.vim' "複数行になっているものを一行にまとめたり、その逆を行える
" NeoBundle 'mattn/emmet-vim' "HTML書く
NeoBundle 'ujihisa/unite-colorscheme' " Unite -auto-preview colorscheme   colorscheme view bundle
NeoBundle 'thinca/vim-ref' " PHPのマニュアルをShift + kで出せるようにする　マニュアルは別途追加  http://loumo.jp/wp/archive/20120715001807/
" NeoBundle 'vim-scripts/taglist.vim' " タグリストを表示

NeoBundle 'Shougo/unite.vim' " なんかいろいろできる
NeoBundle 'Shougo/vimshell' "vimからシェルを起動する
NeoBundle 'Shougo/vimproc' "vimshellの起動に必要
" NeoBundle 'Shougo/vimfiler' " ファイラ
" NeoBundle 'Shougo/neomru.vim' " ファイル履歴
NeoBundle 'Shougo/neocomplete.vim' " 補完プラグイン
NeoBundle 'Shougo/neosnippet' " 補完用ファイル
NeoBundle 'Shougo/neosnippet-snippets' " 補完用ファイル群
" NeoBundle 'thinca/vim-quickrun' "編集中のコードを手軽に実行して結果を確認できる
"
"bundle color
" NeoBundle 'sjl/badwolf'
NeoBundle 'wolf-dog/lightline-nighted.vim'
NeoBundle 'nielsmadan/harlequin'
" NeoBundle 'itchyny/landscape.vim'
" NeoBundle 'vim-scripts/carrot.vim'
" NeoBundle 'vim-scripts/Colour-Sampler-Pack'
NeoBundle 'superused/vimcolor'

call neobundle#end()

" neocomplete-php
let g:neocomplete_php_locale = 'ja'

" vim-ref用設定ファイル
let g:ref_cache_dir=$HOME.'/.vim/vim-ref/cache'
let g:ref_phpmanual_path=$HOME.'/.vim/vim-ref/php-chunked-xhtml'
" let g:ref_use_vimproc=0

let g:ref_detect_filetype={
\    'laravel.php':     'phpmanual',
\    'codeigniter.php': 'phpmanual',
\    'fuel.php':        'phpmanual',
\    'yii.php':         'phpmanual',}
"}}}

" ESCでIMEを確実にOFF
inoremap <ESC> <ESC><ESC>:set iminsert=0<CR>

" <C-s>でvimshellを開くウィンドウが固まる場合は~/.bashrcに記述を追加→stty stop undef
" set splitbelow "新しいウインドウを下に開く
nnoremap <silent> <C-s>      :new<CR><C-w>20-:VimShell<CR>

" mru.vim <C-h>で最近開いたファイルの履歴を見る
nmap <silent> <C-h>      :MRU<CR>
" MRUで履歴を保存するファイル数
let MRU_Max_Entries = 10000

" neocomplete用設定
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
"<CR>: close popup and save indent.
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
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""""""

" insertモードから戻るのが遅いので対策
if !has('gui_running')
    set notimeout
    set ttimeout
    set timeoutlen=100
endif
"<C-e>でNERDTreeをオンオフ。いつでもどこでも
" map <silent> <C-e>   :NERDTreeTabsToggle<CR>
" lmap <silent> <C-e>  :NERDTreeTabsToggle<CR>
nmap <silent> <C-e>      :NERDTreeTabsToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeTabsToggle<CR>
omap <silent> <C-e>      :NERDTreeTabsToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeTabsToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeTabsToggle<CR>

"引数なしでvimを開いたらNERDTreeを起動、
"引数ありならNERDTreeは起動しない、引数で渡されたファイルを開く。
"How can I open a NERDTree automatically when vim starts up if no files were specified?
"autocmd vimenter * if !argc() | NERDTreeTabs | endif

"他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
"How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeTabsType") && b:NERDTreeTabsType == "primary") | q | endif

" 新しいタブでctagのタグジャンプを開く
" nnoremap <F3> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
nnoremap <F3> <C-w><C-]><C-w>T

"\ エスケープ記号
"$ ファイル名の最後
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$'] "NERDTreeIgnore 無視するファイルを設定する。
"let g:NERDTreeIgnore=['\.vim$', '\.clean$']
"let g:NERDTreeIgnore=['\.vim$', '\~$']
"let g:NERDTreeIgnore=[]
let g:NERDTreeShowHidden=1 "1 : 隠しファイルを表示する。
let g:NERDTreeWinSize=30 "NERDTreeのツリーの幅
let g:NERDTreeMinimalUI=1 "ブックマークや、ヘルプのショートカットをメニューに表示する。
let g:NERDTreeDirArrows=0 "NERDTreeを+|`などを使ってツリー表示をする。 1 : +|`などを使わない
let g:NERDTreeMouseMode=2 "マウス操作方法 1 : ファイル、ディレクトリ両方共ダブルクリックで開く。 2 : ディレクトリのみシングルクリックで開く。3 : ファイル、ディレクトリ両方共シングルクリックで開く。
let g:NERDTreeShowBookmarks=1 " ブックマークを最初から表示
let NERDTreeShowLineNumbers=0 "ブックマークを記録したファイルの設置場所を指定。 0 : 行番号を表示しない。

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

let colors_name = "darkblue"

set encoding=utf8 "エンコード
set fenc=utf-8 "エンコード
scriptencoding utf8
" if exists('&ambiwidth')
"     set ambiwidth=double    " UTF-8の□や○でカーソル位置がずれないようにする
" endif "
set fileformat=unix
set fileformats=unix,dos,mac
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
" カレント行にアンダーラインを引く
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
highlight CursorLine gui=underline ctermfg=NONE ctermbg=NONE

set laststatus=2   " ステータス行を常に表示
set cmdheight=1    " メッセージ表示欄を1行確保
set tw=0           " 自動改行しない(twは自動改行させる文字数。0だと自動改行しない)
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
" 不可視文字の表示記号指定
set listchars=tab:▸_
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
set undodir=~/.vim/undo " undoファイルの置き場
set undofile   " ファイル編集中にundoファイルを作る "

" 検索/置換の設定
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=4     " 画面上でタブ文字が占める幅
set shiftwidth=4  " 自動インデントでずれる幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

au BufNewFile,BufRead *.php set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.html.twig set nowrap tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.ctp set nowrap tabstop=4 shiftwidth=4

" 動作環境との統合関連の設定
" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
set clipboard+=autoselect
set mouse=a " マウスの入力を受け付ける
set ttymouse=xterm2
set shellslash " Windows でもパスの区切り文字を / にする
" インサートモードから抜けると自動的にIMEをオフにする
" set iminsert=2

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

nnoremap sT <C-w>T
nnoremap s] <C-w><C-]>
nnoremap <F3> <C-w><C-]><C-w>T

" jjでノーマルモードに戻す
inoremap <silent> jj <ESC>

" 矢印キーでなら行内を動けるようにする
nnoremap <Down> gj
nnoremap <Up>   gk

" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っj <ESC>
inoremap <silent> ｊｊ <ESC>

" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap ｄｄ dd
nnoremap っy yy
nnoremap ｙｙ yy

" 配列のインデントコマンド
nmap s- :SplitjoinSplit<CR>
nmap s^ :SplitjoinJoin<CR>

" 連番入力
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let snf=&nf|set nf-=octal|let cl = col('.')|for nc in range(1, <count>?<count>-line('.'):1)|exe 'normal! j' . nc . <q-args>|call cursor('.', cl)|endfor|unlet cl|unlet snf

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

" F4でインサートモードの切り替えを行う
imap <F4> <nop>
set pastetoggle=<F4>

set foldmethod=marker

" colorscheme jellybeans
" colorscheme railscasts
" autocmd vimenter * highlight Normal ctermbg=16

" colorscheme badwolf
" autocmd vimenter * highlight Comment ctermfg=246
" autocmd vimenter * highlight Normal guifg=#ffffff ctermfg=white
" autocmd vimenter * highlight Normal ctermbg=16

" colorscheme harlequin
colorscheme harlequin2

" colorscheme xoria256
" autocmd vimenter * highlight Normal ctermbg=16

" colorscheme molokai
" autocmd vimenter * highlight Comment ctermfg=246
" autocmd vimenter * highlight visual ctermbg=88
" autocmd vimenter * highlight Normal guifg=#ffffff ctermfg=white

" Setting Of Lightline.vim
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Blue',
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
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
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
endif
"テスト

" 外部Grepの設定
set grepprg=grep\ -nH
au QuickfixCmdPost grep copen "grep検索結果を自動で表示

" vim-indent-guidesプラグイン: vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" PHP環境
let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_parent_error_close = 1

" mysqlの場合
let g:sql_type_default='mysql'

augroup VCSCommand
  autocmd!
  autocmd User VCSBufferCreated call s:vcscommand_buffer_settings()
augroup END

"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 200
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''
"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()

function! s:unite_my_settings()
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+jで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction

function! s:vcscommand_buffer_settings()
  if !exists('b:VCSCommandCommand') | return | endif
  if b:VCSCommandCommand !=# 'commitlog' | setlocal readonly     | endif
  if b:VCSCommandCommand !=# 'vimdiff'   | setlocal nofoldenable | endif
  if &filetype ==# 'gitlog'              | setlocal syntax=git   | endif
  nmap <unique> <buffer> <silent> q :bwipeout<CR>
  if &filetype =~# '^\(svnlog\|gitlog\|hglog\)$'
    nnoremap <silent> <buffer> <CR> :<C-u>call <SID>vcscommand_filetype('log', 'VCSDiff')<CR>gg
    nnoremap <silent> <buffer> v    :<C-u>call <SID>vcscommand_filetype('log', 'VCSVimDiff')<CR>gg
    nnoremap <silent> <buffer> r    :<C-u>call <SID>vcscommand_filetype('log', 'VCSReview')<CR>gg
    nnoremap <silent> <buffer> i    :<C-u>call <SID>vcscommand_filetype('log', 'VCSInfo')<CR>gg
  elseif b:VCSCommandCommand =~# '.*annotate'
    nnoremap <silent> <buffer> <CR> :<C-u>call <SID>vcscommand_filetype('annotate', 'VCSDiff')<CR>gg
    nnoremap <silent> <buffer> v    :<C-u>call <SID>vcscommand_filetype('annotate', 'VCSVimDiff')<CR>gg
    nnoremap <silent> <buffer> r    :<C-u>call <SID>vcscommand_filetype('annotate', 'VCSReview')<CR>gg
    nnoremap <silent> <buffer> l    :<C-u>call <SID>vcscommand_filetype('annotate', 'VCSLog')<CR>gg
    nnoremap <silent> <buffer> i    :<C-u>call <SID>vcscommand_filetype('annotate', 'VCSInfo')<CR>gg
  endif
endfunction

function! s:vcscommand_exec(command, option)
  if a:command =~# '^\(VCSDiff\|VCSLog\)$'
    let g:VCSCommandSplit = winnr('$') == 1 ? 'vertical' : 'horizontal'
  endif
  execute a:command a:option
  unlet! g:VCSCommandSplit
endfunction

function! s:vcscommand_log(...)
  let option = join(a:000)
  if exists('b:VCSCommandVCSType')
    if exists('b:VCSCommandCommand')
      if b:VCSCommandCommand ==# 'log'
        echo "Sorry, you cannot open vcslog on vcslog buffer"
        unlet option
      elseif b:VCSCommandCommand =~# 'diff\|review'
        if !exists('b:VCSCommandStatusText')
          echo "Sorry, you are on a working buffer"
          unlet option
        else
          " Shows only the target revision/commit
          if b:VCSCommandVCSType ==# 'SVN'
            let matched = matchlist(b:VCSCommandStatusText, '(\d\+ : \(\d\+\))')
            if len(matched) | let option = matched[1] | endif
          elseif b:VCSCommandVCSType ==# 'git'
            let matched = matchlist(b:VCSCommandStatusText, '\S\+ \(\w\+\)')
            if len(matched) | let option = '-n 1 ' . matched[1] | endif
          elseif b:VCSCommandVCSType ==# 'HG'
            let matched = matchlist(b:VCSCommandStatusText, '(\(\d\+\) : \w\+)')
            if len(matched) | let option = matched[1] | endif
          endif
        endif
      endif
    elseif v:count
      if b:VCSCommandVCSType ==# 'SVN'
        let limit_option = '-l'
      elseif b:VCSCommandVCSType ==# 'git'
        let limit_option = '-n'
      elseif b:VCSCommandVCSType ==# 'HG'
        let limit_option = '-l'
      endif
      let option = limit_option . ' ' . v:count
    endif
  endif
  if exists('option')
    call s:vcscommand_exec('VCSLog', option)
  endif
endfunction

function! s:vcscommand_filetype(filetype, command)
  let given_count1 = v:count1
  let revision = s:vcscommand_get_revision_on_cursor_line(a:filetype)
  if strlen(revision)
    let option = s:vcscommand_make_vcs_option(a:command, revision, given_count1)
    call s:vcscommand_exec(a:command, option)
  endif
endfunction

function! s:vcscommand_get_revision_on_cursor_line(filetype)
  let save_cursor = getpos('.')
  let save_yank_register = getreg('"')
  if a:filetype ==# 'log'
    if &filetype ==# 'svnlog'
      normal! j
      ?^r\d\+\ |
      normal! 0lye
    elseif &filetype ==# 'gitlog'
      normal! j
      ?^commit\ \w\+$
      normal! 0wy7l
    elseif b:VCSCommandVCSType ==# 'HG'
      normal! j
      ?^changeset:\ \+\d\+:\w\+$
      normal! Wyw
    endif
  elseif a:filetype ==# 'annotate'
    if b:VCSCommandVCSType ==# 'SVN'
      normal! 0wye
    elseif b:VCSCommandVCSType ==# 'git'
      normal! 0t yb
    elseif b:VCSCommandVCSType ==# 'HG'
      normal! 0f:yb
    endif
  endif
  let revision = @"
  call setpos('.', save_cursor)
  call setreg('"', save_yank_register)
  return revision
endfunction

function! s:vcscommand_make_vcs_option(command, revision, given_count1)
  let option = a:revision
  if b:VCSCommandVCSType ==# 'SVN'
    if a:command ==# 'VCSLog'
      let older = a:given_count1 == 1 ? '' : a:given_count1 . ':'
      let option = '-r ' . older . a:revision
    elseif a:command ==# 'VCSInfo'
      let option = '-r ' . a:revision
    elseif a:command =~# 'VCSDiff\|VCSVimDiff'
      let older = a:given_count1 == 1 ? str2nr(a:revision) - 1 : a:given_count1
      let option = older . ' ' . a:revision
    endif
  elseif b:VCSCommandVCSType ==# 'git'
    if a:command ==# 'VCSLog'
      let option = '-n ' . a:given_count1 . ' ' . a:revision
    elseif a:command =~# 'VCSDiff\|VCSVimDiff'
      let older = a:revision . '~' . a:given_count1
      let option = older . ' ' . a:revision
    endif
  elseif b:VCSCommandVCSType ==# 'HG'
    if a:command ==# 'VCSLog'
      let option = '-l ' . a:given_count1 . ' -r ' . a:revision
    elseif a:command =~# 'VCSDiff\|VCSVimDiff'
      let older = a:given_count1 == 1 ? str2nr(a:revision) - 1 : a:given_count1
      "let option = '-r ' . older . ' -r ' . a:revision
      let option = a:revision
    endif
  endif
  return option
endfunction

"NeoSnippet
"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
