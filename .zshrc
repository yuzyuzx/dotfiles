export LANG=ja_JP.UTF-8
export CLICOLOR=1
#export TERM=xterm-256color
#export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"
#export PATH="/opt/homebrew/opt/php@8.0/sbin:$PATH"
#export PATH="/Users/yuz/Library/Python/3.8/bin:$PATH"
export NVM_DIR="$HOME/.nvm"

#alias ls="exa -aF --icons"
#alias ll="exa -alghB --icons"
alias ls="ls -a"
alias ll="ls -l"
alias nv="nvim"
alias view="nvim -R"
alias man='env LANG=C man'
alias jman='env LANG=ja_JP.UTF-8 man'
alias history='history -i -1000'

# 履歴ファイルの保存先
HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
SAVEHIST=100000
# 重複を記録しない
#setopt hist_ignore_dups
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

