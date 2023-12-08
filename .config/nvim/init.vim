" 標準エンコーディング
set encoding=utf8
" 入力中のコマンドをステータスに表示する
set showcmd
" ヤンクをクリップボードに保持する
set clipboard+=unnamed
" ヘルプの言語の優先順位
set helplang=ja,en
" ウィンドウ端からのオフセット
set scrolloff=3
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示 set showmatch ステータスラインを常に表示
set laststatus=2
set list
set listchars=tab:>- " Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC反応速度
set ttimeoutlen=100
" 右端で折り返さない
"set nowrap
" 水平スクロール刻み幅
set sidescroll=0
" Shift+Kでキーワードのヘルプに移動する
set keywordprg=:help

" 折返しの目印
set showbreak=↪

let mapleader = ","
nnoremap <Leader>a ggVG
nnoremap <Leader>q :nohlsearch<CR>

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" 前後移動
nnoremap <Space>j 10j
nnoremap <Space><Space>j 20j
nnoremap <Space>k 10k
nnoremap <Space><Space>k 20k

" split間の移動
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" insert modeでのカーソル移動
" macに合わせている
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>

" plugin manager
" https://github.com/junegunn/vim-plug
" save -> source % -> :PlugInstall
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-jp/vimdoc-ja'
Plug 'windwp/nvim-autopairs'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
call plug#end()

"colorscheme
"catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
colorscheme catppuccin-latte

" template
let g:sonictemplate_vim_template_dir = '~/.config/nvim/template'

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

lua << EOF
require('lualine').setup {
  options = {
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    theme = "catppuccin"
  }
}
EOF

