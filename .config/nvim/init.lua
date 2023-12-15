-- Default file encoding displayed
vim.o.encoding = 'utf-8'
-- Default file encoding written
vim.o.fileencoding = 'utf-8'

vim.o.helplang = "ja,en"

-- 行番号表示
vim.o.number = true

-- 現在行を強調表示
vim.o.cursorline = true

-- 行末の1文字先までカーソルを移動できるように
vim.o.virtualedit = 'onemore'

-- インデント系
-- tabをspaceに変換する
vim.o.expandtab = true
-- インデントをスペース2つ分にする
vim.o.tabstop = 2
vim.o.shiftwidth = 2
-- /インデント系

-- 非表示の文字を可視化する
-- タブ 改行 末尾の半角スペースなど
--					listchars Test			   
vim.o.list = true
vim.opt.listchars = { tab = '▸ ', trail = '·' }

-- ヤンクをクリップボードに保持する
vim.opt.clipboard:append{'unnamed'}

-- 検索系
-- 検索文字入力中でもマッチすれば該当箇所をハイライトにする
vim.o.incsearch = true
-- 検索文字列が小文字の場合は大文字小文字を区別なく検索する
vim.o.ignorecase = true
--検索文字列に大文字が含まれている場合は区別して検索する
vim.o.smartcase = true
-- 最後まで検索したら最初に戻る
vim.o.wrapscan = true
vim.o.hlsearch = true
-- /検索系

-- 折り返された行の先頭に表示する文字列
vim.o.showbreak = "↪"

-- shift + kでカーソル位置のhelpを表示
vim.o.keywordprg = ":help"

-- ウィンドウ端からのオフセット
vim.o.scrolloff = 3

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
