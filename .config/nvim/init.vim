" setting
" 標準エンコーディング
set encoding=utf8
"文字コードをUFT-8に設定
"set fenc=utf-8
" バックアップファイルを作らない
"set nobackup
" スワップファイルを作らない
"set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
"set autoread
" バッファが編集中でもその他のファイルを開けるように
"set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" ヤンクをクリップボードに保持する
set clipboard+=unnamed
" ヘルプの言語の優先順位
set helplang=ja,en

set scrolloff=3

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の列を強調表示
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
"set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
"set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" 行を跨いだカーソル移動
set whichwrap=b,s,h,l,<,>,[,],~

"現在カーソルからの相対行数を表示
"set relativenumber


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
"set list listchars=tab:\▸\-
set list
set listchars=tab:>-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
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
" Escを2回押すとハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>

" jjでインサートモードを抜ける 
inoremap jj <Esc>

" plugin install
" save -> source command -> :PlugInstall
call plug#begin('~/.local/share/nvim/plugged')
Plug 'sainnhe/gruvbox-material'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'lambdalisue/fern.vim'
"Plug 'lambdalisue/fern-git-status.vim'
"Plug 'lambdalisue/nerdfont.vim'
"Plug 'lambdalisue/fern-renderer-nerdfont.vim'
"Plug 'lambdalisue/glyph-palette.vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-jp/vimdoc-ja'
Plug 'windwp/nvim-autopairs'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

lua << EOF
require("nvim-autopairs").setup {
  -- Map the <C-h> key to delete a pair
  map_c_h = true
}
EOF

" シンタックスハイライトの有効化
"syntax enable
"colorscheme darcula
"colorscheme gruvbox
"colorscheme onehalfdark
"catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
colorscheme catppuccin-macchiato

" highlight変更
"highlight CursorLine ctermfg=NONE
"highlight Visual ctermfg=black
"highlight Search ctermfg=black ctermbg=LightBlue

" Ctrl+nでファイルツリーを表示/非表示する
"nnoremap <C-n> :Fern . -reveal=% -drawer -toggle<CR>

" fernアイコン有効化
"let g:fern#renderer='nerdfont'

" fernアイコンに色を付ける
"augroup my-glyph-palette
"  autocmd! *
"  autocmd FileType fern call glyph_palette#apply()
"  autocmd FileType nerdtree,startify call glyph_palette#apply()
"augroup END

let mapleader = "\<Space>"
nnoremap <Leader>a ggVG
nnoremap <Leader>k 5k
nnoremap <Leader>j 5j
nnoremap <Leader><Leader>k 15k
nnoremap <Leader><Leader>j 15j

" template
let g:sonictemplate_vim_template_dir = '~/.config/nvim/template'

" Coc.vimをdisableモードで起動
" 起動は```: CocStart```
"let g:coc_start_at_startup = v:false


inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 背景透明
highlight Normal      ctermbg=NONE guibg=NONE
highlight NonText     ctermbg=NONE guibg=NONE
highlight LineNr      ctermbg=NONE guibg=NONE
highlight Folded      ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

" ▼vim-airline setting
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#whitespace#mixed_indent_algo = 1
" https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme = 'violet'
" ▲vim-airline setting
