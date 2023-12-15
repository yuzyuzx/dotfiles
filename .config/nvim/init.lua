vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.helplang = "ja,en"
vim.o.number = true
vim.o.cursorline = true
vim.o.virtualedit = 'onemore'
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.list = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrapscan = true
vim.o.hlsearch = true
vim.o.showbreak = "↪"
vim.o.keywordprg = ":help"
vim.o.scrolloff = 3

vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.clipboard:append{'unnamed'}

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<Space>j', '10j')
vim.keymap.set('n', '<Space><Space>j', '20j')
vim.keymap.set('n', '<Space>k', '10k')
vim.keymap.set('n', '<Space><Space>k', '20k')
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
vim.keymap.set('i', '<C-p>', '<Up>')
vim.keymap.set('i', '<C-n>', '<Down>')
vim.keymap.set('i', '<C-b>', '<Left>')
vim.keymap.set('i', '<C-f>', '<Right>')
