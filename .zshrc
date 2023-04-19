# プロファイリング機能
#zmodload zsh/zprof

# 起動計測コマンド
#time zsh -i -c exit

# PATH重複削除
#typeset -U path PATH
# 確認
#echo $PATH | tr ':' '\n'


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

export LANG=ja_JP.UTF-8
#export CLICOLOR=1
#export TERM=xterm-256color
#export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"
#export PATH="/opt/homebrew/opt/php@8.0/sbin:$PATH"
#export PATH="/Users/yuz/Library/Python/3.8/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bat command colortheme
export BAT_THEME="TwoDark"

fpath+=($HOME/.zsh/pure)

alias ls="exa -a --icons"
alias ll="exa -alghB --icons"
alias vi="nvim"
alias view="nvim -R"
alias man='env LANG=C man'
alias jman='env LANG=ja_JP.UTF-8 man'

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
alias history='history -i -1000'

# prompt plugin 
autoload -U promptinit; promptinit
prompt pure

# 補完機能設定
# 補完機能有効化
# https://gihyo.jp/dev/serial/01/zsh-book/0005
autoload -U compinit && compinit
# ファイル名補完
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk


# pluginインストール
# プラグイン削除方法
  # 対象のプラグインを削除 or コメントアウト
  # zsh再起動
  # zinit delete --clean
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light agkozak/zsh-z
zinit light marlonrichert/zsh-autocomplete
#zinit light zsh-users/zsh-completions
#zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#eval "$(starship init zsh)"


# プロファイリング機能
#zprof
