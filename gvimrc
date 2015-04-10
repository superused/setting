scriptencoding utf-8
" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)
"
" An example for a Japanese version gvimrc file.
" 日本語版のデフォルトGUI設定ファイル(gvimrc) - Vim7用試作
"
" Last Change: 08-Apr-2015.
" Maintainer:  MURAOKA Taro <koron.kaoriya@gmail.com>
"
" 解説:
" このファイルにはVimの起動時に必ず設定される、GUI関連の設定が書かれていま
" す。編集時の挙動に関する設定はvimrcに書かかれています。
"
" 個人用設定は_gvimrcというファイルを作成しそこで行ないます。_gvimrcはこの
" ファイルの後に読込まれるため、ここに書かれた内容を上書きして設定することが
" 出来ます。_gvimrcは$HOMEまたは$VIMに置いておく必要があります。$HOMEは$VIM
" よりも優先され、$HOMEでみつかった場合$VIMは読込まれません。
"
" 管理者向けに本設定ファイルを直接書き換えずに済ませることを目的として、サイ
" トローカルな設定を別ファイルで行なえるように配慮してあります。Vim起動時に
" サイトローカルな設定ファイル($VIM/gvimrc_local.vim)が存在するならば、本設
" 定ファイルの主要部分が読み込まれる前に自動的に読み込みます。
"
" 読み込み後、変数g:gvimrc_local_finishが非0の値に設定されていた場合には本設
" 定ファイルに書かれた内容は一切実行されません。デフォルト動作を全て差し替え
" たい場合に利用して下さい。
"
" 参考:
"   :help gvimrc
"   :echo $HOME
"   :echo $VIM
"   :version

"---------------------------------------------------------------------------
" サイトローカルな設定($VIM/gvimrc_local.vim)があれば読み込む。読み込んだ後
" に変数g:gvimrc_local_finishに非0な値が設定されていた場合には、それ以上の設
" 定ファイルの読込を中止する。
if 1 && filereadable($VIM . '/gvimrc_local.vim')
  source $VIM/gvimrc_local.vim
  if exists('g:gvimrc_local_finish') && g:gvimrc_local_finish != 0
    finish
  endif
endif

"---------------------------------------------------------------------------
" ユーザ優先設定($HOME/.gvimrc_first.vim)があれば読み込む。読み込んだ後に変
" 数g:gvimrc_first_finishに非0な値が設定されていた場合には、それ以上の設定
" ファイルの読込を中止する。
if 0 && exists('$HOME') && filereadable($HOME . '/.gvimrc_first.vim')
  unlet! g:gvimrc_first_finish
  source $HOME/.gvimrc_first.vim
  if exists('g:gvimrc_first_finish') && g:gvimrc_first_finish != 0
    finish
  endif
endif

"---------------------------------------------------------------------------
" Bram氏の提供する設定例をインクルード (別ファイル:vimrc_example.vim)。これ
" 以前にg:no_gvimrc_exampleに非0な値を設定しておけばインクルードしない。
if 1 && (!exists('g:no_gvimrc_example') || g:no_gvimrc_example == 0)
  source $VIMRUNTIME/gvimrc_example.vim
endif

"---------------------------------------------------------------------------
" カラー設定:
colorscheme morning

"---------------------------------------------------------------------------
" フォント設定:
"
if has('win32')
  " Windows用
  set guifont=MS_Gothic:h12:cSHIFTJIS
  "set guifont=MS_Mincho:h12:cSHIFTJIS
  " 行間隔の設定
  set linespace=1
  " 一部のUCS文字の幅を自動計測して決める
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Osaka－等幅:h14
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif

"---------------------------------------------------------------------------
" ウインドウに関する設定:
"
" ウインドウの幅
set columns=80
" ウインドウの高さ
set lines=25
" コマンドラインの高さ(GUI使用時)
set cmdheight=2
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme evening " (GUI使用時)

"---------------------------------------------------------------------------
" 日本語入力に関する設定:
"
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"---------------------------------------------------------------------------
" マウスに関する設定:
"
" 解説:
" mousefocusは幾つか問題(一例:ウィンドウを分割しているラインにカーソルがあっ
" ている時の挙動)があるのでデフォルトでは設定しない。Windowsではmousehide
" が、マウスカーソルをVimのタイトルバーに置き日本語を入力するとチラチラする
" という問題を引き起す。
"
" どのモードでもマウスを使えるようにする
set mouse=a
" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide
" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
"set guioptions+=a

"---------------------------------------------------------------------------
" メニューに関する設定:
"
" 解説:
" "M"オプションが指定されたときはメニュー("m")・ツールバー("T")供に登録され
" ないので、自動的にそれらの領域を削除するようにした。よって、デフォルトのそ
" れらを無視してユーザが独自の一式を登録した場合には、それらが表示されないと
" いう問題が生じ得る。しかしあまりにレアなケースであると考えられるので無視す
" る。
"
if &guioptions =~# 'M'
  let &guioptions = substitute(&guioptions, '[mT]', '', 'g')
endif

"---------------------------------------------------------------------------
" その他、見栄えに関する設定:
"
" 検索文字列をハイライトしない(_vimrcではなく_gvimrcで設定する必要がある)
"set nohlsearch

"---------------------------------------------------------------------------
" 印刷に関する設定:
"
" 注釈:
" 印刷はGUIでなくてもできるのでvimrcで設定したほうが良いかもしれない。この辺
" りはWindowsではかなり曖昧。一般的に印刷には明朝、と言われることがあるらし
" いのでデフォルトフォントは明朝にしておく。ゴシックを使いたい場合はコメント
" アウトしてあるprintfontを参考に。
"
" 参考:
"   :hardcopy
"   :help 'printfont'
"   :help printing
"
" 印刷用フォント
if has('printer')
  if has('win32')
    set printfont=MS_Mincho:h12:cSHIFTJIS
    "set printfont=MS_Gothic:h12:cSHIFTJIS
  endif
endif

" Copyright (C) 2009-2013 KaoriYa/MURAOKA Taro






" molokai!!!
" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
" https://github.com/tomasr/molokai
"
" Note: Based on the Monokai theme for TextMate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"

hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="molokai"

if exists("g:molokai_original")
    let s:molokai_original = g:molokai_original
else
    let s:molokai_original = 0
endif


hi Boolean         guifg=#AE81FF
hi Character       guifg=#E6DB74
hi Number          guifg=#AE81FF
hi String          guifg=#E6DB74
hi Conditional     guifg=#F92672               gui=bold
hi Constant        guifg=#AE81FF               gui=bold
hi Cursor          guifg=#000000 guibg=#F8F8F0
hi iCursor         guifg=#000000 guibg=#F8F8F0
hi Debug           guifg=#BCA3A3               gui=bold
hi Define          guifg=#66D9EF
hi Delimiter       guifg=#8F8F8F
hi DiffAdd                       guibg=#13354A
hi DiffChange      guifg=#89807D guibg=#4C4745
hi DiffDelete      guifg=#960050 guibg=#1E0010
hi DiffText                      guibg=#4C4745 gui=italic,bold

hi Directory       guifg=#A6E22E               gui=bold
hi Error           guifg=#E6DB74 guibg=#1E0010
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
hi Exception       guifg=#A6E22E               gui=bold
hi Float           guifg=#AE81FF
hi FoldColumn      guifg=#465457 guibg=#000000
hi Folded          guifg=#465457 guibg=#000000
hi Function        guifg=#A6E22E
hi Identifier      guifg=#FD971F
hi Ignore          guifg=#808080 guibg=bg
hi IncSearch       guifg=#C4BE89 guibg=#000000

hi Keyword         guifg=#F92672               gui=bold
hi Label           guifg=#E6DB74               gui=none
hi Macro           guifg=#C4BE89               gui=italic
hi SpecialKey      guifg=#66D9EF               gui=italic

hi MatchParen      guifg=#000000 guibg=#FD971F gui=bold
hi ModeMsg         guifg=#E6DB74
hi MoreMsg         guifg=#E6DB74
hi Operator        guifg=#F92672

" complete menu
hi Pmenu           guifg=#66D9EF guibg=#000000
hi PmenuSel                      guibg=#808080
hi PmenuSbar                     guibg=#080808
hi PmenuThumb      guifg=#66D9EF

hi PreCondit       guifg=#A6E22E               gui=bold
hi PreProc         guifg=#A6E22E
hi Question        guifg=#66D9EF
hi Repeat          guifg=#F92672               gui=bold
hi Search          guifg=#000000 guibg=#FFE792
" marks
hi SignColumn      guifg=#A6E22E guibg=#232526
hi SpecialChar     guifg=#F92672               gui=bold
hi SpecialComment  guifg=#7E8E91               gui=bold
hi Special         guifg=#66D9EF guibg=bg      gui=italic
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
hi Statement       guifg=#F92672               gui=bold
hi StatusLine      guifg=#455354 guibg=fg
hi StatusLineNC    guifg=#808080 guibg=#080808
hi StorageClass    guifg=#FD971F               gui=italic
hi Structure       guifg=#66D9EF
hi Tag             guifg=#F92672               gui=italic
hi Title           guifg=#ef5939
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

hi Typedef         guifg=#66D9EF
hi Type            guifg=#66D9EF               gui=none
hi Underlined      guifg=#808080               gui=underline

hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS                     guibg=#403D3D
hi Visual                        guibg=#403D3D
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu        guifg=#66D9EF guibg=#000000

hi TabLineFill     guifg=#1B1D1E guibg=#1B1D1E
hi TabLine         guibg=#1B1D1E guifg=#808080 gui=none

if s:molokai_original == 1
   hi Normal          guifg=#F8F8F2 guibg=#272822
   hi Comment         guifg=#75715E
   hi CursorLine                    guibg=#3E3D32
   hi CursorLineNr    guifg=#FD971F               gui=none
   hi CursorColumn                  guibg=#3E3D32
   hi ColorColumn                   guibg=#3B3A32
   hi LineNr          guifg=#BCBCBC guibg=#3B3A32
   hi NonText         guifg=#75715E
   hi SpecialKey      guifg=#75715E
else
   hi Normal          guifg=#F8F8F2 guibg=#1B1D1E
   hi Comment         guifg=#7E8E91
   hi CursorLine                    guibg=#293739
   hi CursorLineNr    guifg=#FD971F               gui=none
   hi CursorColumn                  guibg=#293739
   hi ColorColumn                   guibg=#232526
   hi LineNr          guifg=#465457 guibg=#232526
   hi NonText         guifg=#465457
   hi SpecialKey      guifg=#465457
end

"
" Support for 256-color terminal
"
if &t_Co > 255
   if s:molokai_original == 1
      hi Normal                   ctermbg=234
      hi CursorLine               ctermbg=235   cterm=none
      hi CursorLineNr ctermfg=208               cterm=none
   else
      hi Normal       ctermfg=252 ctermbg=233
      hi CursorLine               ctermbg=234   cterm=none
      hi CursorLineNr ctermfg=208               cterm=none
   endif
   hi Boolean         ctermfg=135
   hi Character       ctermfg=144
   hi Number          ctermfg=135
   hi String          ctermfg=144
   hi Conditional     ctermfg=161               cterm=bold
   hi Constant        ctermfg=135               cterm=bold
   hi Cursor          ctermfg=16  ctermbg=253
   hi Debug           ctermfg=225               cterm=bold
   hi Define          ctermfg=81
   hi Delimiter       ctermfg=241

   hi DiffAdd                     ctermbg=24
   hi DiffChange      ctermfg=181 ctermbg=239
   hi DiffDelete      ctermfg=162 ctermbg=53
   hi DiffText                    ctermbg=102 cterm=bold

   hi Directory       ctermfg=118               cterm=bold
   hi Error           ctermfg=219 ctermbg=89
   hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
   hi Exception       ctermfg=118               cterm=bold
   hi Float           ctermfg=135
   hi FoldColumn      ctermfg=67  ctermbg=16
   hi Folded          ctermfg=67  ctermbg=16
   hi Function        ctermfg=118
   hi Identifier      ctermfg=208               cterm=none
   hi Ignore          ctermfg=244 ctermbg=232
   hi IncSearch       ctermfg=193 ctermbg=16

   hi keyword         ctermfg=161               cterm=bold
   hi Label           ctermfg=229               cterm=none
   hi Macro           ctermfg=193
   hi SpecialKey      ctermfg=81

   hi MatchParen      ctermfg=233  ctermbg=208 cterm=bold
   hi ModeMsg         ctermfg=229
   hi MoreMsg         ctermfg=229
   hi Operator        ctermfg=161

   " complete menu
   hi Pmenu           ctermfg=81  ctermbg=16
   hi PmenuSel        ctermfg=255 ctermbg=242
   hi PmenuSbar                   ctermbg=232
   hi PmenuThumb      ctermfg=81

   hi PreCondit       ctermfg=118               cterm=bold
   hi PreProc         ctermfg=118
   hi Question        ctermfg=81
   hi Repeat          ctermfg=161               cterm=bold
   hi Search          ctermfg=0   ctermbg=222   cterm=NONE

   " marks column
   hi SignColumn      ctermfg=118 ctermbg=235
   hi SpecialChar     ctermfg=161               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=81
   if has("spell")
       hi SpellBad                ctermbg=52
       hi SpellCap                ctermbg=17
       hi SpellLocal              ctermbg=17
       hi SpellRare  ctermfg=none ctermbg=none  cterm=reverse
   endif
   hi Statement       ctermfg=161               cterm=bold
   hi StatusLine      ctermfg=238 ctermbg=253
   hi StatusLineNC    ctermfg=244 ctermbg=232
   hi StorageClass    ctermfg=208
   hi Structure       ctermfg=81
   hi Tag             ctermfg=161
   hi Title           ctermfg=166
   hi Todo            ctermfg=231 ctermbg=232   cterm=bold

   hi Typedef         ctermfg=81
   hi Type            ctermfg=81                cterm=none
   hi Underlined      ctermfg=244               cterm=underline

   hi VertSplit       ctermfg=244 ctermbg=232   cterm=bold
   hi VisualNOS                   ctermbg=238
   hi Visual                      ctermbg=235
   hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=16

   hi Comment         ctermfg=59
   hi CursorColumn                ctermbg=236
   hi ColorColumn                 ctermbg=236
   hi LineNr          ctermfg=250 ctermbg=236
   hi NonText         ctermfg=59

   hi SpecialKey      ctermfg=59

   if exists("g:rehash256") && g:rehash256 == 1
       hi Normal       ctermfg=252 ctermbg=234
       hi CursorLine               ctermbg=236   cterm=none
       hi CursorLineNr ctermfg=208               cterm=none

       hi Boolean         ctermfg=141
       hi Character       ctermfg=222
       hi Number          ctermfg=141
       hi String          ctermfg=222
       hi Conditional     ctermfg=197               cterm=bold
       hi Constant        ctermfg=141               cterm=bold

       hi DiffDelete      ctermfg=125 ctermbg=233

       hi Directory       ctermfg=154               cterm=bold
       hi Error           ctermfg=222 ctermbg=233
       hi Exception       ctermfg=154               cterm=bold
       hi Float           ctermfg=141
       hi Function        ctermfg=154
       hi Identifier      ctermfg=208

       hi Keyword         ctermfg=197               cterm=bold
       hi Operator        ctermfg=197
       hi PreCondit       ctermfg=154               cterm=bold
       hi PreProc         ctermfg=154
       hi Repeat          ctermfg=197               cterm=bold

       hi Statement       ctermfg=197               cterm=bold
       hi Tag             ctermfg=197
       hi Title           ctermfg=203
       hi Visual                      ctermbg=238

       hi Comment         ctermfg=247
       hi LineNr          ctermfg=239 ctermbg=235
       hi NonText         ctermfg=239
       hi SpecialKey      ctermfg=239
   endif
end

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
" hi Comment ctermfg=247
" hi visual ctermbg=88
" hi Normal guifg=#ffffff ctermfg=white



" " " Vim color file
" "
" "  "    __       _ _       _                             "
" "  "    \ \  ___| | |_   _| |__   ___  __ _ _ __  ___    "
" "  "     \ \/ _ \ | | | | |  _ \ / _ \/ _  |  _ \/ __|   "
" "  "  /\_/ /  __/ | | |_| | |_| |  __/ |_| | | | \__ \   "
" "  "  \___/ \___|_|_|\__  |____/ \___|\____|_| |_|___/   "
" "  "                 \___/                               "
" "
" "         "A colorful, dark color scheme for Vim."
" "
" " File:         jellybeans.vim
" " URL:          github.com/nanotech/jellybeans.vim
" " Scripts URL:  vim.org/scripts/script.php?script_id=2555
" " Maintainer:   NanoTech (nanotech.nanotechcorp.net)
" " Version:      1.6~git
" " Last Change:  January 15th, 2012
" " License:      MIT
" " Contributors: Daniel Herbert (pocketninja)
" "               Henry So, Jr. <henryso@panix.com>
" "               David Liang <bmdavll at gmail dot com>
" "               Rich Healey (richo)
" "               Andrew Wong (w0ng)
" "
" " Copyright (c) 2009-2012 NanoTech
" "
" " Permission is hereby granted, free of charge, to any per‐
" " son obtaining a copy of this software and associated doc‐
" " umentation  files  (the “Software”), to deal in the Soft‐
" " ware without restriction,  including  without  limitation
" " the rights to use, copy, modify, merge, publish, distrib‐
" " ute, sublicense, and/or sell copies of the Software,  and
" " to permit persons to whom the Software is furnished to do
" " so, subject to the following conditions:
" "
" " The above copyright notice  and  this  permission  notice
" " shall  be  included in all copies or substantial portions
" " of the Software.
" "
" " THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY
" " KIND,  EXPRESS  OR  IMPLIED, INCLUDING BUT NOT LIMITED TO
" " THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICU‐
" " LAR  PURPOSE  AND  NONINFRINGEMENT. IN NO EVENT SHALL THE
" " AUTHORS OR COPYRIGHT HOLDERS BE  LIABLE  FOR  ANY  CLAIM,
" " DAMAGES  OR OTHER LIABILITY, WHETHER IN AN ACTION OF CON‐
" " TRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CON‐
" " NECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" " THE SOFTWARE.
"
" set background=dark
"
" hi clear
"
" if exists("syntax_on")
"   syntax reset
" endif
"
" let colors_name = "jellybeans"
"
" if has("gui_running") || &t_Co == 88 || &t_Co == 256
"   let s:low_color = 0
" else
"   let s:low_color = 1
" endif
"
" " Color approximation functions by Henry So, Jr. and David Liang {{{
" " Added to jellybeans.vim by Daniel Herbert
"
" " returns an approximate grey index for the given grey level
" fun! s:grey_number(x)
"   if &t_Co == 88
"     if a:x < 23
"       return 0
"     elseif a:x < 69
"       return 1
"     elseif a:x < 103
"       return 2
"     elseif a:x < 127
"       return 3
"     elseif a:x < 150
"       return 4
"     elseif a:x < 173
"       return 5
"     elseif a:x < 196
"       return 6
"     elseif a:x < 219
"       return 7
"     elseif a:x < 243
"       return 8
"     else
"       return 9
"     endif
"   else
"     if a:x < 14
"       return 0
"     else
"       let l:n = (a:x - 8) / 10
"       let l:m = (a:x - 8) % 10
"       if l:m < 5
"         return l:n
"       else
"         return l:n + 1
"       endif
"     endif
"   endif
" endfun
"
" " returns the actual grey level represented by the grey index
" fun! s:grey_level(n)
"   if &t_Co == 88
"     if a:n == 0
"       return 0
"     elseif a:n == 1
"       return 46
"     elseif a:n == 2
"       return 92
"     elseif a:n == 3
"       return 115
"     elseif a:n == 4
"       return 139
"     elseif a:n == 5
"       return 162
"     elseif a:n == 6
"       return 185
"     elseif a:n == 7
"       return 208
"     elseif a:n == 8
"       return 231
"     else
"       return 255
"     endif
"   else
"     if a:n == 0
"       return 0
"     else
"       return 8 + (a:n * 10)
"     endif
"   endif
" endfun
"
" " returns the palette index for the given grey index
" fun! s:grey_color(n)
"   if &t_Co == 88
"     if a:n == 0
"       return 16
"     elseif a:n == 9
"       return 79
"     else
"       return 79 + a:n
"     endif
"   else
"     if a:n == 0
"       return 16
"     elseif a:n == 25
"       return 231
"     else
"       return 231 + a:n
"     endif
"   endif
" endfun
"
" " returns an approximate color index for the given color level
" fun! s:rgb_number(x)
"   if &t_Co == 88
"     if a:x < 69
"       return 0
"     elseif a:x < 172
"       return 1
"     elseif a:x < 230
"       return 2
"     else
"       return 3
"     endif
"   else
"     if a:x < 75
"       return 0
"     else
"       let l:n = (a:x - 55) / 40
"       let l:m = (a:x - 55) % 40
"       if l:m < 20
"         return l:n
"       else
"         return l:n + 1
"       endif
"     endif
"   endif
" endfun
"
" " returns the actual color level for the given color index
" fun! s:rgb_level(n)
"   if &t_Co == 88
"     if a:n == 0
"       return 0
"     elseif a:n == 1
"       return 139
"     elseif a:n == 2
"       return 205
"     else
"       return 255
"     endif
"   else
"     if a:n == 0
"       return 0
"     else
"       return 55 + (a:n * 40)
"     endif
"   endif
" endfun
"
" " returns the palette index for the given R/G/B color indices
" fun! s:rgb_color(x, y, z)
"   if &t_Co == 88
"     return 16 + (a:x * 16) + (a:y * 4) + a:z
"   else
"     return 16 + (a:x * 36) + (a:y * 6) + a:z
"   endif
" endfun
"
" " returns the palette index to approximate the given R/G/B color levels
" fun! s:color(r, g, b)
"   " get the closest grey
"   let l:gx = s:grey_number(a:r)
"   let l:gy = s:grey_number(a:g)
"   let l:gz = s:grey_number(a:b)
"
"   " get the closest color
"   let l:x = s:rgb_number(a:r)
"   let l:y = s:rgb_number(a:g)
"   let l:z = s:rgb_number(a:b)
"
"   if l:gx == l:gy && l:gy == l:gz
"     " there are two possibilities
"     let l:dgr = s:grey_level(l:gx) - a:r
"     let l:dgg = s:grey_level(l:gy) - a:g
"     let l:dgb = s:grey_level(l:gz) - a:b
"     let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
"     let l:dr = s:rgb_level(l:gx) - a:r
"     let l:dg = s:rgb_level(l:gy) - a:g
"     let l:db = s:rgb_level(l:gz) - a:b
"     let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
"     if l:dgrey < l:drgb
"       " use the grey
"       return s:grey_color(l:gx)
"     else
"       " use the color
"       return s:rgb_color(l:x, l:y, l:z)
"     endif
"   else
"     " only one possibility
"     return s:rgb_color(l:x, l:y, l:z)
"   endif
" endfun
"
" " returns the palette index to approximate the 'rrggbb' hex string
" fun! s:rgb(rgb)
"   let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
"   let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
"   let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
"   return s:color(l:r, l:g, l:b)
" endfun
"
" " sets the highlighting for the given group
" fun! s:X(group, fg, bg, attr, lcfg, lcbg)
"   if s:low_color
"     let l:fge = empty(a:lcfg)
"     let l:bge = empty(a:lcbg)
"
"     if !l:fge && !l:bge
"       exec "hi ".a:group." ctermfg=".a:lcfg." ctermbg=".a:lcbg
"     elseif !l:fge && l:bge
"       exec "hi ".a:group." ctermfg=".a:lcfg." ctermbg=NONE"
"     elseif l:fge && !l:bge
"       exec "hi ".a:group." ctermfg=NONE ctermbg=".a:lcbg
"     endif
"   else
"     let l:fge = empty(a:fg)
"     let l:bge = empty(a:bg)
"
"     if !l:fge && !l:bge
"       exec "hi ".a:group." guifg=#".a:fg." guibg=#".a:bg." ctermfg=".s:rgb(a:fg)." ctermbg=".s:rgb(a:bg)
"     elseif !l:fge && l:bge
"       exec "hi ".a:group." guifg=#".a:fg." guibg=NONE ctermfg=".s:rgb(a:fg)." ctermbg=NONE"
"     elseif l:fge && !l:bge
"       exec "hi ".a:group." guifg=NONE guibg=#".a:bg." ctermfg=NONE ctermbg=".s:rgb(a:bg)
"     endif
"   endif
"
"   if a:attr == ""
"     exec "hi ".a:group." gui=none cterm=none"
"   else
"     let l:noitalic = join(filter(split(a:attr, ","), "v:val !=? 'italic'"), ",")
"     if empty(l:noitalic)
"       let l:noitalic = "none"
"     endif
"     exec "hi ".a:group." gui=".a:attr." cterm=".l:noitalic
"   endif
" endfun
" " }}}
"
" if !exists("g:jellybeans_background_color")
"   let g:jellybeans_background_color = "151515"
" end
"
" call s:X("Normal","e8e8d3",g:jellybeans_background_color,"","White","")
" set background=dark
"
" if !exists("g:jellybeans_use_lowcolor_black") || g:jellybeans_use_lowcolor_black
"     let s:termBlack = "Black"
" else
"     let s:termBlack = "Grey"
" endif
"
" if version >= 700
"   call s:X("CursorLine","","1c1c1c","","",s:termBlack)
"   call s:X("CursorColumn","","1c1c1c","","",s:termBlack)
"   call s:X("MatchParen","ffffff","556779","bold","","DarkCyan")
"
"   call s:X("TabLine","000000","b0b8c0","italic","",s:termBlack)
"   call s:X("TabLineFill","9098a0","","","",s:termBlack)
"   call s:X("TabLineSel","000000","f0f0f0","italic,bold",s:termBlack,"White")
"
"   " Auto-completion
"   call s:X("Pmenu","ffffff","606060","","White",s:termBlack)
"   call s:X("PmenuSel","101010","eeeeee","",s:termBlack,"White")
" endif
"
" call s:X("Visual","","404040","","",s:termBlack)
" call s:X("Cursor",g:jellybeans_background_color,"b0d0f0","","","")
"
" call s:X("LineNr","605958",g:jellybeans_background_color,"none",s:termBlack,"")
" call s:X("CursorLineNr","ccc5c4","","none","White","")
" call s:X("Comment","888888","","italic","Grey","")
" call s:X("Todo","c7c7c7","","bold","White",s:termBlack)
"
" call s:X("StatusLine","000000","dddddd","italic","","White")
" call s:X("StatusLineNC","ffffff","403c41","italic","White","Black")
" call s:X("VertSplit","777777","403c41","",s:termBlack,s:termBlack)
" call s:X("WildMenu","f0a0c0","302028","","Magenta","")
"
" call s:X("Folded","a0a8b0","384048","italic",s:termBlack,"")
" call s:X("FoldColumn","535D66","1f1f1f","","",s:termBlack)
" call s:X("SignColumn","777777","333333","","",s:termBlack)
" call s:X("ColorColumn","","000000","","",s:termBlack)
"
" call s:X("Title","70b950","","bold","Green","")
"
" call s:X("Constant","cf6a4c","","","Red","")
" call s:X("Special","799d6a","","","Green","")
" call s:X("Delimiter","668799","","","Grey","")
"
" call s:X("String","99ad6a","","","Green","")
" call s:X("StringDelimiter","556633","","","DarkGreen","")
"
" call s:X("Identifier","c6b6ee","","","LightCyan","")
" call s:X("Structure","8fbfdc","","","LightCyan","")
" call s:X("Function","fad07a","","","Yellow","")
" call s:X("Statement","8197bf","","","DarkBlue","")
" call s:X("PreProc","8fbfdc","","","LightBlue","")
"
" hi! link Operator Structure
"
" call s:X("Type","ffb964","","","Yellow","")
" call s:X("NonText","606060",g:jellybeans_background_color,"",s:termBlack,"")
"
" call s:X("SpecialKey","444444","1c1c1c","",s:termBlack,"")
"
" call s:X("Search","f0a0c0","302028","underline","Magenta","")
"
" call s:X("Directory","dad085","","","Yellow","")
" call s:X("ErrorMsg","","902020","","","DarkRed")
" hi! link Error ErrorMsg
" hi! link MoreMsg Special
" call s:X("Question","65C254","","","Green","")
"
"
" " Spell Checking
"
" call s:X("SpellBad","","902020","underline","","DarkRed")
" call s:X("SpellCap","","0000df","underline","","Blue")
" call s:X("SpellRare","","540063","underline","","DarkMagenta")
" call s:X("SpellLocal","","2D7067","underline","","Green")
"
" " Diff
"
" hi! link diffRemoved Constant
" hi! link diffAdded String
"
" " VimDiff
"
" call s:X("DiffAdd","D2EBBE","437019","","White","DarkGreen")
" call s:X("DiffDelete","40000A","700009","","DarkRed","DarkRed")
" call s:X("DiffChange","","2B5B77","","White","DarkBlue")
" call s:X("DiffText","8fbfdc","000000","reverse","Yellow","")
"
" " PHP
"
" hi! link phpFunctions Function
" call s:X("StorageClass","c59f6f","","","Red","")
" hi! link phpSuperglobal Identifier
" hi! link phpQuoteSingle StringDelimiter
" hi! link phpQuoteDouble StringDelimiter
" hi! link phpBoolean Constant
" hi! link phpNull Constant
" hi! link phpArrayPair Operator
" hi! link phpOperator Normal
" hi! link phpRelation Normal
" hi! link phpVarSelector Identifier
"
" " Python
"
" hi! link pythonOperator Statement
"
" " Ruby
"
" hi! link rubySharpBang Comment
" call s:X("rubyClass","447799","","","DarkBlue","")
" call s:X("rubyIdentifier","c6b6fe","","","Cyan","")
" hi! link rubyConstant Type
" hi! link rubyFunction Function
"
" call s:X("rubyInstanceVariable","c6b6fe","","","Cyan","")
" call s:X("rubySymbol","7697d6","","","Blue","")
" hi! link rubyGlobalVariable rubyInstanceVariable
" hi! link rubyModule rubyClass
" call s:X("rubyControl","7597c6","","","Blue","")
"
" hi! link rubyString String
" hi! link rubyStringDelimiter StringDelimiter
" hi! link rubyInterpolationDelimiter Identifier
"
" call s:X("rubyRegexpDelimiter","540063","","","Magenta","")
" call s:X("rubyRegexp","dd0093","","","DarkMagenta","")
" call s:X("rubyRegexpSpecial","a40073","","","Magenta","")
"
" call s:X("rubyPredefinedIdentifier","de5577","","","Red","")
"
" " Erlang
"
" hi! link erlangAtom rubySymbol
" hi! link erlangBIF rubyPredefinedIdentifier
" hi! link erlangFunction rubyPredefinedIdentifier
" hi! link erlangDirective Statement
" hi! link erlangNode Identifier
"
" " JavaScript
"
" hi! link javaScriptValue Constant
" hi! link javaScriptRegexpString rubyRegexp
"
" " CoffeeScript
"
" hi! link coffeeRegExp javaScriptRegexpString
"
" " Lua
"
" hi! link luaOperator Conditional
"
" " C
"
" hi! link cFormat Identifier
" hi! link cOperator Constant
"
" " Objective-C/Cocoa
"
" hi! link objcClass Type
" hi! link cocoaClass objcClass
" hi! link objcSubclass objcClass
" hi! link objcSuperclass objcClass
" hi! link objcDirective rubyClass
" hi! link objcStatement Constant
" hi! link cocoaFunction Function
" hi! link objcMethodName Identifier
" hi! link objcMethodArg Normal
" hi! link objcMessageName Identifier
"
" " Vimscript
"
" hi! link vimOper Normal
"
" " HTML
"
" hi! link htmlTag Statement
" hi! link htmlEndTag htmlTag
" hi! link htmlTagName htmlTag
"
" " XML
"
" hi! link xmlTag Statement
" hi! link xmlEndTag xmlTag
" hi! link xmlTagName xmlTag
" hi! link xmlEqual xmlTag
" hi! link xmlEntity Special
" hi! link xmlEntityPunct xmlEntity
" hi! link xmlDocTypeDecl PreProc
" hi! link xmlDocTypeKeyword PreProc
" hi! link xmlProcessingDelim xmlAttrib
"
" " Debugger.vim
"
" call s:X("DbgCurrent","DEEBFE","345FA8","","White","DarkBlue")
" call s:X("DbgBreakPt","","4F0037","","","DarkMagenta")
"
" " vim-indent-guides
"
" if !exists("g:indent_guides_auto_colors")
"   let g:indent_guides_auto_colors = 0
" endif
" call s:X("IndentGuidesOdd","","232323","","","")
" call s:X("IndentGuidesEven","","1b1b1b","","","")
"
" " Plugins, etc.
"
" hi! link TagListFileName Directory
" call s:X("PreciseJumpTarget","B9ED67","405026","","White","Green")
"
" if !exists("g:jellybeans_background_color_256")
"   let g:jellybeans_background_color_256=233
" end
" " Manual overrides for 256-color terminals. Dark colors auto-map badly.
" if !s:low_color
"   hi StatusLineNC ctermbg=235
"   hi Folded ctermbg=236
"   hi FoldColumn ctermbg=234
"   hi SignColumn ctermbg=236
"   hi CursorColumn ctermbg=234
"   hi CursorLine ctermbg=234
"   hi SpecialKey ctermbg=234
"   exec "hi NonText ctermbg=".g:jellybeans_background_color_256
"   exec "hi LineNr ctermbg=".g:jellybeans_background_color_256
"   hi DiffText ctermfg=81
"   exec "hi Normal ctermbg=".g:jellybeans_background_color_256
"   hi DbgBreakPt ctermbg=53
"   hi IndentGuidesOdd ctermbg=235
"   hi IndentGuidesEven ctermbg=234
" endif
"
" if exists("g:jellybeans_overrides")
"   fun! s:load_colors(defs)
"     for [l:group, l:v] in items(a:defs)
"       call s:X(l:group, get(l:v, 'guifg', ''), get(l:v, 'guibg', ''),
"       \                 get(l:v, 'attr', ''),
"       \                 get(l:v, 'ctermfg', ''), get(l:v, 'ctermbg', ''))
"       if !s:low_color
"         for l:prop in ['ctermfg', 'ctermbg']
"           let l:override_key = '256'.l:prop
"           if has_key(l:v, l:override_key)
"             exec "hi ".l:group." ".l:prop."=".l:v[l:override_key]
"           endif
"         endfor
"       endif
"       unlet l:group
"       unlet l:v
"     endfor
"   endfun
"   call s:load_colors(g:jellybeans_overrides)
"   delf s:load_colors
" endif
"
" " delete functions {{{
" delf s:X
" delf s:rgb
" delf s:color
" delf s:rgb_color
" delf s:rgb_level
" delf s:rgb_number
" delf s:grey_color
" delf s:grey_level
" delf s:grey_number
" " }}}



"--------------------
set background=dark

au GUIEnter * simalt ~x

source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

set guifont=Consolas:h11,Lucida_Console:h11:w5 guifontwide=MS_Gothic:h11

" 勝手に改行するのをやめる
set textwidth=0
" textwidthで改行したくない
set formatoptions=q
