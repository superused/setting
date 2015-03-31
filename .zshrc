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
#autoload -U colors
#colors

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
