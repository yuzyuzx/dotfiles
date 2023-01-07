# 起動時にnodejsのバージョンを指定する
set --universal nvm_default_version v18.12.1

alias vi="nvim"
alias view="nvim -R"
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
