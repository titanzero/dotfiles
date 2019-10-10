" vim-plug config
call plug#begin('~/.config/nvim/plugins')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'ervandew/supertab'

call plug#end()

" Theme
syntax on
colorscheme gruvbox
set t_Co=256
set background=dark
set number
set hid
set sidescroll=1
set encoding=utf-8
set nobackup
set noswapfile
set mouse=a

" remaps
let mapleader = ","
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>l :NERDTreeFind<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>ff :Files<CR>
nmap <leader>ag :Ag<CR>

" nerdtree config, automatically open nt on directory
" prevent opening buffers on nt pane
let NERDTreeMinimalUI = 1
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
