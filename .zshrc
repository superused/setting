# PROMPT="[%n%m](%*% %~ %% "
#
# autoload -Uz compinit
# compinit -u
#
# HISTFILE=~/.zsh_history
# HISTSIZE=1000000
# SAVEHIST=1000000u


# #shの設定を使う
# source ~/.bashrc
#
# #補完機能を使用する
# autoload -U compinit promptinit
# compinit
# zstyle ':completion::complete:*' use-cache true
# #zstyle ':completion:*:default' menu select true
# zstyle ':completion:*:default' menu select=1
#
# #大文字、小文字を区別せず補完する
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#
# #補完でカラーを使用する
# autoload colors
# zstyle ':completion:*' list-colors "${LS_COLORS}"
#
# #kill の候補にも色付き表示
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'
#
# #コマンドにsudoを付けても補完
# zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
#
# #zsh内蔵エディタを使う
# autoload -U zcalc
# autoload zed
#
# #予測入力させる
# #autoload predict-on
# #zle -N predict-on
# #zle -N predict-off
# #bindkey '^X^P' predict-on
# #bindkey '^O' predict-off
# #zstyle ':predict' verbose true
#
# #入力途中の履歴補完を有効化する
# autoload history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
#
# #入力途中の履歴補完
# bindkey "^P" history-beginning-search-backward-end
# bindkey "^N" history-beginning-search-forward-end
#
# #インクリメンタルサーチの設定
# #bindkey "^R" history-incremental-search-backward
# #bindkey "^S" history-incremental-search-forward
#
# #履歴のインクリメンタル検索でワイルドカード利用可能
# bindkey '^R' history-incremental-pattern-search-backward
# bindkey '^S' history-incremental-pattern-search-forward
#
# #プロンプト関係
# PROMPT="[%n@%m %~]%(!.#.$) "
# #PROMPT2="%n %_%%"
# #SPROMPT="%r is correct? [n,y,a,e]: "
# #RPROMPT="[%l/zsh]"
#
# #ヒストリーサイズ設定
# HISTFILE=$HOME/.zsh_history
# HISTSIZE=1000000
# SAVEHIST=1000000
# PATH=${PATH}:~/bin
#
# #ヒストリの一覧を読みやすい形に変更
# HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "
#
# #補完リストが多いときに尋ねない
# LISTMAX=1000
#
# #"|,:"を単語の一部とみなさない
# WORDCHARS="$WORDCHARS|:"
#
# #http://www.ayu.ics.keio.ac.jp/~mukai/translate/zshoptions.html
# #タブキーの連打で自動的にメニュー補完
# setopt AUTO_MENU
# #/foo/barでいきなりcd
# setopt AUTO_CD
# #"~$var" でディレクトリにアクセス
# setopt AUTO_NAME_DIRS
# #補完が/で終って、つぎが、語分割子か/かコマンドの後(;とか&)だったら、補完末尾の/を取る
# unsetopt AUTO_REMOVE_SLASH
# #曖昧な補完で、自動的に選択肢をリストアップ
# setopt AUTO_LIST
# #変数名を補完する
# setopt AUTO_PARAM_KEYS
# #プロンプト文字列で各種展開を行なう
# setopt PROMPT_SUBST
# # サスペンド中のプロセスと同じコマンド名を実行した場合はリジュームする
# setopt AUTO_RESUME
# #rm * などの際確認しない
# setopt rm_star_silent
# #ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
# setopt MARK_DIRS
# #明確なドットの指定なしで.から始まるファイルをマッチ
# #rm *で確認
# unsetopt RM_STAR_WAIT
# #行の末尾がバッククォートでも無視する
# setopt SUN_KEYBOARD_HACK
# #~hoge以外にマッチする機能を使う
# setopt EXTENDED_GLOB
# #補完対象のファイルの末尾に識別マークをつける
# setopt LIST_TYPES
# #BEEPを鳴らさない
# setopt NO_BEEP
# #補完候補など表示する時はその場に表示し、終了時に画面から消す
# setopt ALWAYS_LAST_PROMPT
# #cd kotaで/home/kotaに移動する
# setopt CDABLE_VARS
# #クォートされていない変数拡張が行われたあとで、フィールド分割
# setopt SH_WORD_SPLIT
# #定義された全ての変数は自動的にexportする
# setopt ALL_EXPORT
# #ディレクトリ名を補完すると、末尾がスラッシュになる。
# setopt AUTO_PARAM_SLASH
# #普通のcdでもスタックに入れる
# setopt AUTO_PUSHD
# #コマンドのスペルの訂正を使用する
# setopt CORRECT
# #aliasを展開して補完
# unsetopt complete_aliases
# #"*" にドットファイルをマッチ
# unsetopt GLOB_DOTS
# #補完候補を詰めて表示
# setopt LIST_PACKED
# #ディレクトリスタックに、同じディレクトリを入れない
# setopt PUSHD_IGNORE_DUPS
# #補完の時にベルを鳴らさない
# setopt NO_LIST_BEEP
# #^Dでログアウトしないようにする
# unsetopt IGNORE_EOF
# #ジョブの状態をただちに知らせる
# setopt NOTIFY
# #複数のリダイレクトやパイプに対応
# setopt MULTIOS
# #ファイル名を数値的にソート
# setopt NUMERIC_GLOB_SORT
# #リダイレクトで上書き禁止
# unsetopt NOCLOBBER
# #=以降でも補完できるようにする
# setopt MAGIC_EQUAL_SUBST
# #補完候補リストの日本語を正しく表示
# setopt PRINT_EIGHT_BIT
# #右プロンプトに入力がきたら消す
# setopt TRANSIENT_RPROMPT
# #戻り値が0以外の場合終了コードを表示
# unsetopt PRINT_EXIT_VALUE
# #echo {a-z}などを使えるようにする
# setopt BRACE_CCL
# #!!などを実行する前に確認する
# setopt HISTVERIFY
# #余分な空白は詰めて記録
# setopt HIST_IGNORE_SPACE
# #ヒストリファイルを上書きするのではなく、追加するようにする
# setopt APPEND_HISTORY
# #ジョブがあっても黙って終了する
# setopt NO_CHECK_JOBS
# #ヒストリに時刻情報もつける
# setopt EXTENDED_HISTORY
# #履歴がいっぱいの時は最も古いものを先ず削除
# setopt HIST_EXPIRE_DUPS_FIRST
# #履歴検索中、重複を飛ばす
# setopt HIST_FIND_NO_DUPS
# #ヒストリリストから関数定義を除く
# setopt HIST_NO_FUNCTIONS
# #前のコマンドと同じならヒストリに入れない
# setopt HIST_IGNORE_DUPS
# #重複するヒストリを持たない
# setopt HIST_IGNORE_ALL_DUPS
# #ヒストリを呼び出してから実行する間に一旦編集可能
# unsetopt HIST_VERIFY
# #履歴をインクリメンタルに追加
# setopt INC_APPEND_HISTORY
# #history コマンドをヒストリに入れない
# setopt HIST_NO_STORE
# #履歴から冗長な空白を除く
# setopt HIST_REDUCE_BLANKS
# #改行コードで終らない出力もちゃんと出力する
# setopt NO_PROMPTCR
# #loop の短縮形を許す
# setopt SHORT_LOOPS
# #コマンドラインがどのように展開され実行されたかを表示する
# unsetopt XTRACE
# #ディレクトリの最後のスラッシュを自動で削除
# unsetopt AUTOREMOVESLASH
# #シンボリックリンクは実体を追うようになる
# unsetopt CHASE_LINKS
# #履歴を共有
# setopt SHARE_HISTORY
# #$0 にスクリプト名/シェル関数名を格納
# setopt FUNCTION_ARGZERO
# #Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
# setopt NO_FLOW_CONTROL
# #コマンドラインでも # 以降をコメントと見なす
# setopt INTERACTIVE_COMMENTS
# #デフォルトの複数行コマンドライン編集ではなく、１行編集モードになる
# unsetopt SINGLE_LINE_ZLE
# #語の途中でもカーソル位置で補完
# setopt COMPLETE_IN_WORD
# #バックグラウンドジョブが終了したらすぐに知らせる。
# setopt NO_TIFY
#
#
# #ライン操作はEmacsスタイルで行う
# bindkey -e
#
# #C-Uで行頭まで削除
# bindkey "^U" backward-kill-line
#
# # C-^ で一つ上のディレクトリへ
# function cdup() {
#   echo
#   cd ..
#   zle reset-prompt
# }
# zle -N cdup
# bindkey '^^' cdup
#
# #ttyで省電力のための画面を消す機能を無効化する(xterm)
# #setterm -blank 0
#
# #端末設定
# #Ctrl+H に 1 文字削除
# #stty erase '^H'
# #Ctrl+C に割り込み
# #stty intr '^C'
# # Ctrl+Z にサスペンド
# #stty susp '^Z'
#
# # 補完候補のメニュー選択で、矢印キーの代わりにhjklで移動出来るようにする。
# zmodload zsh/complist
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
#
# #zsh Git
# autoload -Uz vcs_info
# zstyle ":vcs_info:*" enable git
# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr "+"
# zstyle ':vcs_info:git:*' unstagedstr "-"
# zstyle ':vcs_info:git:*' actionformats '%F{5}[%f%s%F{5}]%F{3}%F{5}[%f%r%F{5}]%F{3}%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f%F{1}%u%f%F{6}%c%f'
# zstyle ':vcs_info:git:*' formats       '%F{5}[%f%s%F{5}]%F{3}%F{5}[%f%r%F{5}]%F{3}%F{5}[%F{2}%b%F{5}]%F{1}%u%f%F{6}%c%f'
# precmd() { vcs_info }
# RPROMPT='${vcs_info_msg_0_}%f'



#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors
export TERM=xterm-256color




########### .zshrc
# chsh /bin/zsh
# Esc-h   : help
# Esc-q   : コマンドを一時的に待避
# Esc-a   : カーソル位置や文字列をそのままにコマンドを実行
# Esc-p   : ヒストリから置換 [後に入力]
# Ctrl-r  : ヒストリから置換 [先に入力]
# Ctrl-d  : 補完リスト
# Ctrl-u  : 削除
# ls **/index.* : 簡単に再帰的検索
# /usr/share/zsh/4.2.1/functions/_subversion LANG=C

############# 環境変数
# . /etc/profile.d/lang.sh

export PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin:$HOME/bin
export LESS='-X -F -i -m'
export LESSOPEN="|/usr/bin/lesspipe.sh %s"
#export VISUAL=gedit
export EDITOR=vi
#unset USERNAME
#export [CFLAGS, LD_LIBRARY_PATH, LD_RUN_PATH]
export RUBYLIB=$HOME/lib/ruby
export PERL5LIB=$HOME/lib/perl

############# 基本設定
setopt ignoreeof       # ^Dでログアウトしない
setopt NOHUP           # ターミナルが閉じてもプログラムが死なない
setopt print_eight_bit # 文字化け対策 (不完全)
setopt auto_cd         # 自動で cd
unsetopt promptcr      # echo -n foo への対策
#setopt no_clobber     # 上書きリダイレクトの禁止 (許可: >|)
#unsetopt LIST_BEEP    # 補完時にビープを鳴らさない
#setopt NO_BEEP        # never ever beep ever
#setopt NOBGNICE       # バックグラウンドを高速に

WORDCHARS="*?_-.[]~=&;\!#$%^(){}<>" # Ctrl-w でディレクトリ前まで削除
MAILCHECK=0                         # メールチェックしない

# プロンプト
# %n = username
# %m = hostname
# %~ = current directory
# %c = current directory (short)
# $1 = execute command
test $REMOTEHOST
case $? in
  0) PROMPT="%U$USER@%m:%c%(!.#.$)%u ";;  # 左側 REMOTE
  1) PROMPT="%U$USER:%c%(!.#.$)%u ";;     # 左側 LOCAL
esac
RPROMPT="[%~]"              # 右側

if [ "$TERM" = "kterm" ] || [ "$TERM" = "xterm" ] || [ "$TERM" = "screen" ];then
  precmd()  { print -Pn "\e]0;%c %n@%m\a" }
  preexec() { print -Pn "\e]0;[$1] %n@%m\a" }
fi

############# キーバインド
#bindkey -e  # キーバインドを Emacs 風に
#bindkey "^[[A" history-beginning-search-backward
#bindkey "^[[B" history-beginning-search-forward
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey "^[[3~" delete-char        # [DEL]

########### 色
COLORS=/etc/DIR_COLORS
[ -e "/etc/DIR_COLORS.$TERM" ] && COLORS="/etc/DIR_COLORS.$TERM"
[ -e "$HOME/.dircolors" ] && COLORS="$HOME/.dircolors"
[ -e "$HOME/.dircolors.$TERM" ] && COLORS="$HOME/.dircolors.$TERM"
[ -e "$HOME/.dir_colors" ] && COLORS="$HOME/.dir_colors"
[ -e "$HOME/.dir_colors.$TERM" ] && COLORS="$HOME/.dir_colors.$TERM"
[ -e "$COLORS" ] || return
eval `dircolors --sh "$COLORS"`

# 補完時の色
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# $fg[色名] / $bg[色名] / $reset_color などの変数を使って色指定ができる
# エスケープシーケンスを含む文字は %{ と %} で囲む必要がある
autoload -U colors
colors

############ 補完
autoload -U compinit
compinit

setopt COMPLETE_IN_WORD  # 単語の途中で補完
setopt CORRECT_ALL       # 訂正機能
LISTMAX=0                # 補完候補が多いときに尋ねる (0=自動)

# 補完候補の大文字小文字の違いを無視。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# メニューセレクト
zstyle ':completion:*:default' menu select=1

# あるコマンドの補完を他のコマンドのように補完する
# platex を latex と同じように補完できるようになる
#compdef _tex platex

# 特定のコマンドの補完を無効にする
#compdef -d w3m

########### history
HISTFILE=$HOME/.zsh_history           # 履歴をファイルに保存する
HISTSIZE=10240                        # メモリ内の履歴の数
SAVEHIST=10240                        # 保存される履歴の数
setopt SHARE_HISTORY                  # 共有可能
setopt hist_ignore_all_dups           # 重複を排除
setopt hist_save_nodups               # 重複を排除
setopt hist_reduce_blanks             # 空白は詰めて登録
#setopt hist_verify                   # ヒストリの編集を許可
#setopt extended_history              # 時刻情報も保存

########## alias
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ls='ls --color=tty'
alias ll='ls -l'
alias l.='ls -d .*'
alias la='ls -a'
alias lla='ls -al'

alias g='env -u LC_CTYPE grep -i -r'
#alias gh='history -E 1 | grep -i'
alias gh='history 1 | grep -i'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

alias df='df -h'
alias eemacs='LANG=ja_JP.eucJP emacs'
alias kb='gedit $HOME/settings/unixtips.txt'
alias e='gnome-open `pwd`'
alias javam='gnome-open /usr/local/share/doc/java-1.5.0-docs-ja/api/index.html'
alias dict='xterm -en EUC-JP -e $HOME/bin/rdic.sh'
alias go=gnome-open

unalias rm
rm () { echo -n 'trashed: '; la -d $*; mv $* $HOME/.Trash }

wl () { ll ` which $1` }

# global
alias -g G='| grep -i'
alias -g H='| head'
alias -g L='| less'
alias -g T='| tail'








# # (d) is default on
#
# # ------------------------------
# # General Settings
# # ------------------------------
# export EDITOR=vim        # エディタをvimに設定
# export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
# export KCODE=u           # KCODEにUTF-8を設定
# export AUTOFEATURE=true  # autotestでfeatureを動かす
#
# bindkey -e               # キーバインドをemacsモードに設定
# #bindkey -v              # キーバインドをviモードに設定
#
# setopt no_beep           # ビープ音を鳴らさないようにする
# setopt auto_cd           # ディレクトリ名の入力のみで移動する 
# setopt auto_pushd        # cd時にディレクトリスタックにpushdする
# setopt correct           # コマンドのスペルを訂正する
# setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
# setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
# setopt notify            # バックグラウンドジョブの状態変化を即時報告する
# setopt equals            # =commandを`which command`と同じ処理にする
#
# ### Complement ###
# autoload -U compinit; compinit # 補完機能を有効にする
# setopt auto_list               # 補完候補を一覧で表示する(d)
# setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
# setopt list_packed             # 補完候補をできるだけ詰めて表示する
# setopt list_types              # 補完候補にファイルの種類も表示する
# bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
#
# ### Glob ###
# setopt extended_glob # グロブ機能を拡張する
# unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない
#
# ### History ###
# HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
# HISTSIZE=10000            # メモリに保存されるヒストリの件数
# SAVEHIST=10000            # 保存されるヒストリの件数
# setopt bang_hist          # !を使ったヒストリ展開を行う(d)
# setopt extended_history   # ヒストリに実行時間も保存する
# setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
# setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
# setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
#
# # マッチしたコマンドのヒストリを表示できるようにする
# autoload history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "^P" history-beginning-search-backward-end
# bindkey "^N" history-beginning-search-forward-end
#
# # すべてのヒストリを表示する
# function history-all { history -E 1 }
#
#
# # ------------------------------
# # Look And Feel Settings
# # ------------------------------
# ### Ls Color ###
# # 色の設定
# export LSCOLORS=Exfxcxdxbxegedabagacad
# # 補完時の色の設定
# export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# # ZLS_COLORSとは？
# export ZLS_COLORS=$LS_COLORS
# # lsコマンド時、自動で色がつく(ls -Gのようなもの？)
# export CLICOLOR=true
# # 補完候補に色を付ける
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#
# ### Prompt ###
# # プロンプトに色を付ける
# autoload -U colors; colors
# # 一般ユーザ時
# tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
# tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
# tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
# tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"
#
# # rootユーザ時(太字にし、アンダーバーをつける)
# if [ ${UID} -eq 0 ]; then
#   tmp_prompt="%B%U${tmp_prompt}%u%b"
#   tmp_prompt2="%B%U${tmp_prompt2}%u%b"
#   tmp_rprompt="%B%U${tmp_rprompt}%u%b"
#   tmp_sprompt="%B%U${tmp_sprompt}%u%b"
# fi
#
# PROMPT=$tmp_prompt    # 通常のプロンプト
# PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
# RPROMPT=$tmp_rprompt  # 右側のプロンプト
# SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
# # SSHログイン時のプロンプト
# [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#   PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
# ;
#
# ### Title (user@hostname) ###
# case "${TERM}" in
# kterm*|xterm*|)
#   precmd() {
#     echo -ne "\033]0;${USER}@${HOST%%.*}\007"
#   }
#   ;;
# esac
#
#
# # ------------------------------
# # Other Settings
# # ------------------------------
# ### RVM ###
# if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
#
# ### Macports ###
# case "${OSTYPE}" in
#   darwin*)
#     export PATH=/opt/local/bin:/opt/local/sbin:$PATH
#     export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH
#   ;;
# esac
#
# ### Aliases ###
# alias r=rails
# alias v=vim
#
# # cdコマンド実行後、lsを実行する
# #function cd() {
# #  builtin cd $@ && ls;
# #}
#
