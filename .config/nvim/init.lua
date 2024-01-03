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
vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.hlsearch = true
vim.opt.showbreak = "↪"
vim.opt.keywordprg = ":help"
vim.opt.scrolloff = 3
vim.opt.clipboard:append{'unnamed'}

vim.g.mapleader = ','

vim.keymap.set('n', '<Leader>a', 'ggVG')
vim.keymap.set('n', '<Leader>q', ':nohlsearch<CR>')

-- 折り返し行の移動
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- 上下移動の幅
vim.keymap.set('n', '<Space>j', '10j')
vim.keymap.set('n', '<Space><Space>j', '20j')
vim.keymap.set('n', '<Space>k', '10k')
vim.keymap.set('n', '<Space><Space>k', '20k')

-- window移動
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- normal modeのまま改行を挿入する
vim.keymap.set('n', '<Leader>o', 'o<Esc>0"_D')
vim.keymap.set('n', '<Leader>O', 'O<Esc>0"_D')

-- insert mode状態でのカーソル移動
vim.keymap.set('i', '<C-p>', '<Up>')
vim.keymap.set('i', '<C-n>', '<Down>')
vim.keymap.set('i', '<C-b>', '<Left>')
vim.keymap.set('i', '<C-f>', '<Right>')

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
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "numToStr/Comment.nvim", opts = {}, lazy = false, },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
  "vim-jp/vimdoc-ja",
  "nvim-lualine/lualine.nvim",
})

local on_attach = function(client, bufnr)
  -- LSPサーバーのフォーマット機能を無効にするには下の行をコメントアウト
  -- 例えばtypescript-language-serverにはコードのフォーマット機能が付いているが代わりにprettierでフォーマットしたいときなど
  -- client.resolved_capabilities.document_formatting = false

  local set = vim.keymap.set
  set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
  set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
  set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
  set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  set("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
  set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach
    }
  end,
}

capabilities = require("cmp_nvim_lsp").default_capabilities()

local cmp = require"cmp"
cmp.setup({
  snippet = {
    -- expand = function(args)
    --   require("luasnip").lsp_expand(args.body)
    -- end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    -- { name = "luasnip" },
  }, {
    -- { name = "buffer" },
  })
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

