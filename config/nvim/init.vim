" vim-plug config
call plug#begin('~/.config/nvim/plugins')

" Autocompetion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ASM/C Dev
Plug 'rhysd/vim-clang-format'
Plug 'drmikehenry/vim-headerguard'
Plug 'vim-scripts/asmx86_64'

" UI/Theme
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'liuchengxu/vista.vim'

" Others
Plug 'embear/vim-localvimrc'
Plug 'antoyo/vim-licenses'
Plug 'skywind3000/asyncrun.vim'

call plug#end()

" VIM
"
let mapleader = ","
nmap <leader>cc :cclose<CR>
nmap <leader>w :bp <BAR> bd #<CR>
nmap <leader>n :Startify<CR>

au BufRead,BufNewFile *.md setlocal textwidth=80

" Basic Configs
"
set termguicolors     
colorscheme gruvbox
set background=dark
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set number relativenumber
set hid
set showmatch
set autoindent
set copyindent
set sidescroll=1
set encoding=utf-8
set nobackup
set nowritebackup
set noswapfile
set noautochdir
set signcolumn=yes
set mouse=a
set updatetime=100
set autoread
set splitright
set splitbelow

" COC Configs
" 
let g:coc_global_extensions = 
    \ [ 
    \   'coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 
    \   'coc-vetur', 'coc-yaml', 'coc-omnisharp', 'coc-git', 
    \   'coc-lists', 'coc-tslint-plugin' 
    \ ]
autocmd CursorHoldI,CursorMovedI * silent! call CocActionAsync('showSignatureHelp')
nmap <leader>lb :CocList buffers<CR>
nmap <leader>lf :CocList files<CR>
nmap <leader>lg :CocList grep<CR>
nmap <F2> <Plug>(coc-rename)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <c-space> coc#refresh()

" NERDTree config:
"   Auto open on folder
"   Auto open on empty params
"
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = 
    \ [ 
    \   '\.DS_Store', 'node_modules', '.git/',
    \   'CMakeFiles', 'CMakeCache.*', 'cmake_install.*'
    \ ]
au VimEnter * if !argc() | Startify | NERDTree | Vista | wincmd w | endif

" Devicons
"
let g:DevIconsEnableFoldersOpenClose = 1

" Tabline
"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{get(g:,"coc_git_status","")}%{get(b:,"coc_git_status","")}%{get(b:,"coc_git_blame","")}'

" Licenser
"
let g:licenses_copyright_holders_name = 'Nicola Leonardi <nic95.leo@gmail.com>'
let g:licenses_author_name = 'Nicola Leonardi <nic95.leo@gmail.com>'

" Local VIMRC Loading
"
let g:localvimrc_whitelist = '/Users/nicola/Repos/.*'
let g:localvimrc_sandbox = 0

" Startify Settings
"
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [ {'v': '~/.config/nvim/init.vim'}, {'z': '~/.zshrc'} ]

