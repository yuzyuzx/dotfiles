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
" 行を跨いだカーソル移動
"set whichwrap=h,l
"現在カーソルからの相対行数を表示
"set relativenumber
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
" Escを2回押すとハイライトを消す
"nnoremap <Esc><Esc> :nohlsearch<CR>
" jjでインサートモードを抜ける
"inoremap jj <Esc>

nnoremap <Space>j 5j
nnoremap <Space><Space>j 10j
nnoremap <Space>k 5k
nnoremap <Space><Space>k 10k

" insert modeでのカーソル移動
" macに合わせている
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>

" Terminal動作
" インサートモードからの離脱
tnoremap <C-[> <C-\><C-n>
" Tコマンドで Terminal を開くと現在のウィンドウの下部に別ウィンドウで表示されるようにする
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
" デフォルトでインサートモードにする
autocmd TermOpen * startinsert

" plugin install
" save -> source % -> :PlugInstall
call plug#begin('~/.local/share/nvim/plugged')
"Plug 'sainnhe/gruvbox-material'
"Plug 'sonph/onehalf', { 'rtp': 'vim' }
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
Plug 'easymotion/vim-easymotion'
call plug#end()

"colorscheme setting
"syntax enable
"colorscheme darcula
"colorscheme gruvbox
"colorscheme onehalfdark
"catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
colorscheme catppuccin-latte

lua << EOF
require("nvim-autopairs").setup {
  -- Map the <C-h> key to delete a pair
  map_c_h = true
}
EOF

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

" template
let g:sonictemplate_vim_template_dir = '~/.config/nvim/template'

" Coc.vimをdisableモードで起動
" 起動は```: CocStart```
"let g:coc_start_at_startup = v:false


inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 背景透明
"highlight Normal      ctermbg=NONE guibg=NONE
"highlight NonText     ctermbg=NONE guibg=NONE
"highlight LineNr      ctermbg=NONE guibg=NONE
"highlight Folded      ctermbg=NONE guibg=NONE
"highlight EndOfBuffer ctermbg=NONE guibg=NONE

" ▼vim-airline setting
 let g:airline_theme = 'base16'
 let g:airline#extensions#tabline#enabled = 1
 let g:airline_powerline_fonts = 1
 let g:airline#extensions#branch#enabled = 0
" trailing表示（末尾空白チェック）をオフにする
"let g:airline#extensions#whitespace#enabled = 0
" ▲vim-airline setting

" vim-easymotion setup
map <Leader> <Plug>(easymotion-prefix)

