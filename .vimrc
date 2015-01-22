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

NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Align'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'erikw/tmux-powerline'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
"NeoBundle 'tyru/restart.vim'
"NeoBundle 'Lokaltog/powerline'
" NeoBundle 'osyo-manga/vim-precious'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'sgur/vim-textobj-parameter'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'osyo-manga/vim-textobj-multitextobj'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'Lokaltog/powerline-fontpatcher'
NeoBundle 'delphinus35/dotfiles'
NeoBundle 'tomtom/tcomment_vim' "コメントON,OFFをCtrl+-で簡単に実行
" NeoBundle 'nathanaelkane/vim-indent-guides' " インデントに色を付けて見やすくする
NeoBundle 'bronson/vim-trailing-whitespace' "行末の不要な半角スペースを可視化する :FixWhitespace
NeoBundle 'vim-scripts/mru.vim' "最近開いたファイルの履歴を見る :MRU
NeoBundle 'Shougo/vimshell' "vimからシェルを起動する
" NeoBundle 'Shougo/vimproc' "vimshellの起動に必要
" NeoBundle 'xolox/vim-session', {
"         \ 'depends' : 'xolox/vim-misc',
"         \ }
NeoBundle 'Townk/vim-autoclose' "括弧を入力した際に自動で閉じ括弧を挿入する
NeoBundle 'mattn/emmet-vim' "HTML書く
NeoBundle 'scrooloose/syntastic' "syntaxチェック
NeoBundle 'tmhedberg/matchit' "対応する括弧に飛ぶ機能を強化
" NeoBundle 'alpaca-tc/alpaca_powertabline'
" NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
" NeoBundle 'Lokaltog/powerline-fontpatcher'
NeoBundle 'kana/vim-fakeclip' "tmux や screen を使っていてもVimのヤンク(y)やペースト(p)のときにクリップボード(正確には pbcopy/pbpaste )が使われるようになります。

"bundle color
" NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'vim-scripts/twilight'
" NeoBundle 'jonathanfilip/vim-lucius'
" NeoBundle 'jpo/vim-railscasts-theme'
" NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
" NeoBundle 'vim-scripts/rdark'
" NeoBundle 'croaker/mustang-vim'
" NeoBundle 'mrkn/mrkn256.vim'
" NeoBundle 'ciaranm/inkpot'
" NeoBundle 'sjl/badwolf'
" NeoBundle 'sickill/vim-monokai'
" NeoBundle 'djjcast/mirodark'
" NeoBundle '29decibel/codeschool-vim-theme'
" NeoBundle 'morhetz/gruvbox'
" NeoBundle 'cocopon/colorswatch.vim'
" NeoBundle 'skammer/vim-css-color'
" NeoBundle 'chriskempson/vim-tomorrow-theme'
" NeoBundle 'vim-scripts/phd'
" NeoBundle 'vim-scripts/darktango.vim'
" NeoBundle 'vim-scripts/BusyBee'
" NeoBundle 'cocopon/Iceberg.vim'
" NeoBundle 'wolf-dog/nighted.vim'
NeoBundle 'wolf-dog/lightline-nighted.vim'

" NeoBundle 'alpaca-tc/alpaca_powertabline'
" NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
" NeoBundle 'Lokaltog/powerline-fontpatcher'

"colorscheme view bundle
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme' " Unite -auto-preview colorscheme

call neobundle#end()

"<C-s>でvimshellを開くウィンドウが固まる場合は~/.bashrcに記述を追加→stty stop undef
" set splitbelow "新しいウインドウを下に開く
" nnoremap <silent> <C-s>      :new<CR><C-w>20-:VimShell<CR>

"<C-h>で最近開いたファイルの履歴を見る
nmap <silent> <C-h>      :MRU<CR>

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
"autocmd vimenter * if !argc() | NERDTreeTabs | endif

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
let g:NERDTreeWinSize=30 "NERDTreeのツリーの幅
let g:NERDTreeMinimalUI=1 "ブックマークや、ヘルプのショートカットをメニューに表示する。
let g:NERDTreeDirArrows=0 "NERDTreeを+|`などを使ってツリー表示をする。 1 : +|`などを使わない
let g:NERDTreeMouseMode=2 "マウス操作方法 1 : ファイル、ディレクトリ両方共ダブルクリックで開く。 2 : ディレクトリのみシングルクリックで開く。3 : ファイル、ディレクトリ両方共シングルクリックで開く。
let NERDTreeShowLineNumbers=0 "ブックマークを記録したファイルの設置場所を指定。 0 : 行番号を表示しない。

"NERDTreeStatusline NERDtreeウィンドウにステータスラインを表示。
"Values: Any valid statusline setting.
"Default: %{b:NERDTreeRoot.path.strForOS(0)}

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
let colors_name = "darkblue"

set encoding=utf8 "エンコード
set fenc=utf-8 "エンコード
scriptencoding utf8
set ambiwidth=double
set fileformat=unix
" set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileformats=unix,dos,mac
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set ambiwidth=double
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
" set nocursorline     " カーソル行の強調表示をしない
" set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=1    " メッセージ表示欄を1行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
" 不可視文字の表示記号指定
set listchars=eol:↲,tab:▸\
" set listchars=tab:▸\
" set listchars=tab:>\ ,trail:_
" カーソル移動関連の設定

set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

" ファイル処理関連の設定
set nowrap
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

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

"autocmd vimenter * NERDTreeTabsOpen

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
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap S <C-w><
nnoremap F <C-w>>
nnoremap C <C-w>+
nnoremap X <C-w>-

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

" TabMove: Move tabpage with reltive number
command! -nargs=1 TabMove :call <SID>MoveTabpage(<f-args>)

nnoremap <silent><C-k> :call <SID>MoveTabpage(1)<Return><CR>
nnoremap <silent><C-j> :call <SID>MoveTabpage(-1)<Return><CR>


"F4でインサートモードの切り替えを行う
imap <F4> <nop>
set pastetoggle=<F4>

set foldmethod=marker

"colorscheme zenburn
" colorscheme hybrid
" colorscheme mrkn256
" colorscheme jellybeans
" colorscheme railscasts
" colorscheme solarized
" colorscheme iceberg
colorscheme molokai
autocmd vimenter * highlight Comment ctermfg=247
autocmd vimenter * highlight visual ctermbg=88
autocmd vimenter * highlight Normal guifg=#ffffff ctermfg=white
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

" Setting Of Lightline.vim
let g:lightline = {
      \ 'colorscheme': 'nighted',
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
  set fileencoding=utf-8
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

