vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.helplang = 'ja', 'en'
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.virtualedit = 'onemore'
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.list = true
vim.opt.listchars = {
  tab = '▸ ',
  trail = '·'
}
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.hlsearch = true
vim.opt.showbreak = "↪"
vim.opt.keywordprg = ":help"
vim.opt.scrolloff = 3
vim.opt.clipboard = 'unnamedplus'

vim.g.mapleader = ','

-- 全選択をする
vim.keymap.set('n', '<Leader>a', 'ggVG')

-- 検索マッチしたハイライトを消す
vim.keymap.set('n', '<Leader>q', ':nohlsearch<CR>')

-- 折り返し行の移動
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- 上下移動の幅
vim.keymap.set('n', '<Space>j', '10j')
vim.keymap.set('n', '<Space><Space>j', '20j')
vim.keymap.set('n', '<Space>k', '10k')
vim.keymap.set('n', '<Space><Space>k', '21k')

-- window移動
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- buffer移動
vim.keymap.set('n', '<Space>[', ':bprev<CR>')
vim.keymap.set('n', '<Space>]', ':bnext<CR>')

-- normal modeのまま改行を挿入する
vim.keymap.set('n', '<Leader>o', 'o<Esc>0"_D')
vim.keymap.set('n', '<Leader>O', 'O<Esc>0"_D')

-- insert mode状態でのカーソル移動
vim.keymap.set('i', '<C-p>', '<Up>')
vim.keymap.set('i', '<C-n>', '<Down>')
vim.keymap.set('i', '<C-b>', '<Left>')
vim.keymap.set('i', '<C-f>', '<Right>')

-- 選択範囲をクリップボードにコピーする
vim.keymap.set('v', '<C-c>', 'y')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "numToStr/Comment.nvim", opts = {}, lazy = false, },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
  "nvim-lualine/lualine.nvim",
  "vim-jp/vimdoc-ja",
})

-- colorscheme
--[[
catppuccin-latte
catppuccin-frappe
catppuccin-macchiato
catppuccin-mocha
]]
vim.cmd.colorscheme "catppuccin-latte"

require("nvim-treesitter.configs").setup {
  -- treesitterのthemeをcatppuccinに設定
  -- https://github.com/catppuccin/nvim?tab=readme-ov-file#wrong-treesitter-highlights
  highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
  },
}

-- status line
require('lualine').setup {
  options = {
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    theme = "catppuccin"
  }
}

-- bufferline
-- catppuccinセットアップ後にbufferlineをセットアップする
local latte = require("catppuccin.palettes").get_palette "latte"
require("bufferline").setup {
  highlights = require("catppuccin.groups.integrations.bufferline").get {
    styles = { "italic", "bold" },
    custom = {
      all = {
        -- fill = { bg = "#000000" },
      },
      mocha = {
        -- background = { fg = mocha.text },
      },
      latte = {
        -- background = { fg = "#000000" },
        fill = { bg = latte.base },
      },
    },
  },
}

require('nvim-autopairs').setup({
  -- Map the <C-h> key to delete a pair
  map_c_h = true,
})

