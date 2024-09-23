# 先頭に記述する
# abbrなどzshrcで使用するプラグインが反映しないため
eval "$(sheldon source)"

export LANG=ja_JP.UTF-8
export CLICOLOR=1
#export NVM_DIR="$HOME/.nvm"

alias tnv="NVIM_APPNAME=nvim-test nvim"

# java setting
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

alias man='env LANG=C man'
alias jman='env LANG=ja_JP.UTF-8 man'
alias history='history -i -1000'
alias ls="ls -a"
alias ll="ls -l"

abbr -S nv="nvim" >>/dev/null
abbr -S dcr="docker container run" >>/dev/null
abbr -S dcl="docker container ls -a" >>/dev/null >>/dev/null
abbr -S dil="docker image ls" >>/dev/null
abbr -S dvl="docker volume ls" >>/dev/null
abbr -S dnl="docker netowork ls" >>/dev/null

# 履歴ファイルの保存先
HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
SAVEHIST=10000
# 重複を記録しない
setopt hist_ignore_dups
# 実行時刻記録
setopt extended_history
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 同時に起動したzshの間でヒストリを共有
setopt share_history
# Ctrl + Dでログアウトを防ぐ
setopt IGNOREEOF
# リダイレクトの上書きをエラーにする
setopt noclobber

# zsh-completionの設定
autoload -Uz compinit
compinit

