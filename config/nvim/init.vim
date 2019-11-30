" VimPlug Loading {{{
call plug#begin('~/.config/nvim/plugins')

" UI/Themes Plugins
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

" UI Tweaks
Plug 'junegunn/goyo.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" }}}

" VIM {{{
set mouse=a
set number relativenumber
set noshowmode
set autoindent
set signcolumn=yes
set encoding=utf-8
set nobackup
set nowritebackup
set noswapfile
set updatetime=100
set autoread
set splitright
set splitbelow
let mapleader = ","

nmap <leader>cc :cclose<CR>
nmap <leader>sf :source %<CR>
nmap <leader>w :bp <BAR> bd #<CR>
nmap <leader>t :NERDTreeToggle<CR>

au VimEnter * if !argc() | Startify | wincmd w | endif
" }}}

" UI/Themes/Fixes {{{
set termguicolors
set background=dark
let g:gruvbox_italic = 1
let g:lightline = { 'colorscheme': 'gruvbox' }

nmap <leader>fe :Goyo 120<CR>
nmap <leader>fc :Goyo!<CR>

colorscheme gruvbox
" }}}

" NERDTree {{{
let NERDTreeMinimalMenu = 1
let NERDTreeMinimalUI = 1
let NERDTreeWinSize = 35
let NERDTreeNaturalSort = 1
" }}}

" Startify {{{
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [ {'v': '~/.config/nvim/init.vim'}, {'z': '~/.zshrc'} ]
" }}}
