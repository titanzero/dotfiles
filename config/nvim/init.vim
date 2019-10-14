" vim-plug config
call plug#begin('~/.config/nvim/plugins')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'embear/vim-localvimrc'
Plug 'antoyo/vim-licenses'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
Plug 'drmikehenry/vim-headerguard'
Plug 'ryanoasis/vim-devicons'
Plug 'skywind3000/asyncrun.vim'
Plug 'vim-scripts/asmx86_64'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Theme
syntax on
colorscheme gruvbox
set t_Co=256
set background=dark
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
set hid
set showmatch
set sidescroll=1
set encoding=utf-8
set nobackup
set noswapfile
set mouse=a
set updatetime=100
set autoread

" NERDTree
let mapleader = ","
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>l :NERDTreeFind<CR>

" Buffers
nmap <leader>b :Buffers<CR>
nmap <leader>ff :Files<CR>
nmap <leader>ag :Ag<CR>

" Tabs
nmap <leader>w :bp <BAR> bd #<CR>
nmap <A-Left> :bp<CR>
nmap <A-Right> :bn<CR>

" Fugitive
nmap <leader>a :Gwrite<CR>
nmap <leader>c :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" COC VIM
inoremap <silent><expr> <c-space> coc#refresh()

" nerdtree config, automatically open nt on directory
" prevent opening buffers on nt pane
let NERDTreeMinimalUI = 1
let NERDTreeIgnore=['\.DS_Store']
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" line numbers
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" local vimrc config
let g:localvimrc_whitelist = '/Users/nicola/Repos/.*'
let g:localvimrc_sandbox = 0

" licenser
let g:licenses_copyright_holders_name = 'Nicola Leonardi <nic95.leo@gmail.com>'
let g:licenses_author_name = 'Nicola Leonardi <nic95.leo@gmail.com>'

" Fugitive icons
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
