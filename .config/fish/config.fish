export NVM_DIR="$HOME/.nvm"

# This loads nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# This loads nvm bash_completion
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# ----------
# peco config
# ----------
#set fish_plugins theme peco
#function fish_user_key_bindings
#  bind \cw peco_select_history # Bind for prco history to Ctrl+r
#end

alias vi="nvim"
alias man='env LANG=C man'
alias jman='env LANG=ja_JP.UTF-8 man'

# ----------
# bobthefish config
# ----------
set -g fish_prompt_pwd_dir_length 0  # ディレクトリ省略しない
set -g theme_newline_cursor yes  # プロンプトを改行した先に設ける
set -g theme_display_git_master_branch yes  # git の branch 名を表示
set -g theme_color_scheme dracula
set -g theme_display_date no  # 時刻を表示しないように設定
set -g theme_display_cmd_duration no  # コマンド実行時間の非表示

# <C-d>によるログアウトを防止
#bind \cd delete-char
