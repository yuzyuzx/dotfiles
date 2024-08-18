local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local mux = wezterm.mux

-- 起動時ウィンドウサイズ
config.initial_rows = 80
config.initial_cols = 120

-- config.font = wezterm.font 'Hack Nerd Font'
config.font = wezterm.font 'Source Han Code JP'
config.font_size = 14.0

-- タイトルバー設定
-- https://wezfurlong.org/wezterm/config/lua/config/window_decorations.html
config.window_decorations = "RESIZE"

-- タブバーを非表示にする
config.enable_tab_bar = false

-- terminal全体のテーマ設定
-- https://github.com/nekowinston/wezterm-bar
config.color_scheme = 'Catppuccin Latte'
wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(config, {
  position = "bottom",
  max_width = 32,
  dividers = "rounded", -- "slant_right", "slant_left", "arrows", "rounded", false
  indicator = {
    leader = {
      enabled = true,
      off = " ",
      on = " ",
    },
    mode = {
      enabled = true,
      names = {
        resize_mode = "RESIZE",
        copy_mode = "VISUAL",
        search_mode = "SEARCH",
      },
    },
  },
  tabs = {
    numerals = "arabic", -- or "roman"
    pane_count = "superscript", -- or "subscript", false
    brackets = {
      active = { "", ":" },
      inactive = { "", ":" },
    },
  },
  clock = { -- note that this overrides the whole set_right_status
    enabled = true,
    format = "%H:%M", -- use https://wezfurlong.org/wezterm/config/lua/wezterm.time/Time/format.html
  },
})

return config

