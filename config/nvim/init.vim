" VimPlug Loading {{{
call plug#begin('~/.config/nvim/plugins')

" UI Tweaks
" Needs to be called before themes
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'yuttie/comfortable-motion.vim'

" UI/Themes Plugins
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

" Autocompletion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'raimondi/delimitmate'

" Lang specific
Plug 'rhysd/vim-clang-format'
Plug 'vim-scripts/asmx86_64'
Plug 'sheerun/vim-polyglot'
Plug 'drmikehenry/vim-headerguard'

" Others
Plug 'embear/vim-localvimrc'
Plug 'antoyo/vim-licenses'
Plug 'skywind3000/asyncrun.vim'
Plug 'editorconfig/editorconfig-vim'

call plug#end()
" }}}

" VIM {{{
set mouse=a
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
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
set clipboard=unnamedplus
let mapleader = ","

nmap <leader>cc :cclose<CR>
nmap <leader>sf :source %<CR>
nmap <leader>w :bp <BAR> bd #<CR>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
nmap <C-K> <C-W><C-K>
nmap <C-J> <C-W><C-J>
nmap <M-Left> :bp<CR>
nmap <M-Right> :bn<CR>
nmap <leader>n :Startify<CR>

nmap <leader>vp :vsplit<CR>
nmap <leader>hp :split<CR>
nmap <leader>vt :vsplit<CR>:terminal<CR>i
tnoremap <Esc> <C-\><C-n>:q<CR>

au VimEnter * if !argc() | Startify | NERDTree | wincmd w | endif
au BufNewFile,BufRead *.S set syntax=asmx86_64
" }}}

" UI/Themes/Fixes {{{
set termguicolors
set background=dark
let g:gruvbox_italic = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{get(g:,"coc_git_status","")}%{get(b:,"coc_git_status","")}'
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
let NERDTreeWinSize = 55
let NERDTreeNaturalSort = 1
let NERDTreeIgnore = 
    \ [ 
    \   '\.DS_Store', 'node_modules', '^.git$', '^.ccls-cache$',
    \   'CMakeFiles', 'CMakeCache.*', 'cmake_install.*', 'vendor',
    \   'bin', 'obj'
    \ ]

nmap <leader>t :NERDTreeToggle<CR>
" }}}

" Startify {{{
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [ {'v': '~/.config/nvim/init.vim'}, {'z': '~/.zshrc'} ]
" }}}

" COC {{{
let g:coc_global_extensions = 
    \ [ 
    \   'coc-json', 'coc-git', 'coc-lists', 'coc-omnisharp', 'coc-phpls', 'coc-tsserver',
    \   'coc-html', 'coc-css', 'coc-python'
    \ ]

nmap <leader>lb :CocList buffers<CR>
nmap <leader>lf :CocList files<CR>
nmap <leader>lg :CocList grep<CR>
nmap <leader>ca  <Plug>(coc-codeaction)
nmap <leader>cf  <Plug>(coc-fix-current)
nmap <F2> <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

au CursorHold * silent call CocActionAsync('highlight')
au! CompleteDone * if pumvisible() == 0 | pclose | endif
" }}}

" Others {{{
let g:licenses_copyright_holders_name = 'Nicola Leonardi <nic95.leo@gmail.com>'
let g:licenses_author_name = 'Nicola Leonardi <nic95.leo@gmail.com>'
let g:localvimrc_whitelist = '/Users/nicola/Repos/.*'
let g:localvimrc_sandbox = 0
" }}}


" EXPERIMENTALS {{{
" Got some problems during scroll in long files, those config
" seems to partially solve the issue under iTerm. Temporary 
" switched to alacritty
"
" PS. Nothing is more permanent than temporary things/fixes.
set regexpengine=1
set noshowcmd
set synmaxcol=200
" }}}
