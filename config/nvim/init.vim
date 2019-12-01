" VimPlug Loading {{{
call plug#begin('~/.config/nvim/plugins')

" UI Tweaks
" Needs to be called before themes
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'

" UI/Themes Plugins
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

" Autocompletion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()
" }}}

" VIM {{{
set mouse=a
set number relativenumber
set noshowmode
set noshowcmd
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
nmap <M-Left> :bp<CR>
nmap <M-Right> :bn<CR>
nmap <leader>t :NERDTreeToggle<CR>

au VimEnter * if !argc() | Startify | NERDTree | wincmd w | endif
" }}}

" UI/Themes/Fixes {{{
set termguicolors
set background=dark
let g:gruvbox_italic = 1
let g:airline#extensions#tabline#enabled = 1
let g:webdevicons_enable_startify = 1

nmap <leader>fe :Goyo 80x80%<CR>
nmap <leader>fc :Goyo!<CR>

au! User GoyoEnter Limelight 0.8
au! User GoyoLeave Limelight!

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

" COC {{{
let g:coc_global_extensions = 
    \ [ 
    \   'coc-json', 'coc-git', 'coc-lists'
    \ ]

nmap <leader>lb :CocList buffers<CR>
nmap <leader>lf :CocList files<CR>
nmap <leader>lg :CocList grep<CR>
nmap <F2> <Plug>(coc-rename)
" }}}
