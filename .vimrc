" ===========================
" CONTENTS
" 
" = SETTINGS
" = MAPPINGS
"
" ===========================

" #===== SETTINGS =====#
syntax on
filetype plugin on
autocmd FileType netrw setl bufhidden=delete
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview

if has('termguicolors')
  set termguicolors
endif

set nocompatible
set t_Co=256
set encoding=UTF-8
set hidden                              " Hide current buffer when switching on another buffer
set cmdheight=1                         " Number of screen lines to use for the command-line                    
set updatetime=100                      " Time waits after you stop typing
set shortmess+=c                        " Don't pass messages to ins-completion-menu.
set scrolloff=8
set number                              " Show number of each line
set relativenumber                      " Show the line number relative to the line with the cursor
set cursorline                          " Highlight the current line number 
set laststatus=2                        " Always have a status line
set linespace=4                         " Number of pixel lines inserted between characters
set showmode                            " Always show what mode we're currently editing in
set nohlsearch                          " No highlight after search
set nowrap                              " Don't wrap lines
set tags=tags
set shiftround                          " Use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start          " Allow backspacing over everything in insert mode
set autoindent                          " Always set autoindenting on
set copyindent                          " Copy the previous indentation on autoindenting
set ignorecase                          " Ignore case when searching
set smartcase                           " Ignore case if search pattern is all lowercase,
set splitbelow                          " Reverse splits top to bottom
set splitright                          " Reverse splits left to right
set showcmd                             " Show (partial) command in the status line
set viewoptions-=options
set mouse=a
set ttyfast
set lazyredraw
set noswapfile
set nobackup                            " Don't create a backup when overriding a file set nowritebackup
set nowritebackup
set undodir=~/.nvim/undodir
set undofile
set clipboard=unnamedplus
set nofixendofline
set nofixeol
set tabstop=2                           " A tab is two spaces
set softtabstop=2                       " A tab is two spaces
set shiftwidth=2                        " Number of spaces to use for autoindenting

" #===== MAPPINGS =====#
" Remap <leader>
let mapleader = " "
let g:mapleader = " "

" Disable Ex Mode
map Q <nop>

" Fast saves & fast quit
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" Faster open splits
nmap <leader>vs :vsplit<cr>
nmap <leader>sp :split<cr>

" Easier split navigation
nnoremap <C-W><C-N> <C-W><C-J>
nnoremap <C-W><C-E> <C-W><C-K>
nnoremap <C-W><C-I> <C-W><C-L>
nnoremap <C-W><C-H> <C-W><C-H>

" Up and Down wrapper reverse
nnoremap <expr> <up> v:count == 0 ? 'gk' : 'k'
nnoremap <expr> <down> v:count == 0 ? 'gj' : 'j'
nnoremap <left> h 
nnoremap <right> l
nnoremap gk k
nnoremap gj j
nnoremap k gk
nnoremap j gj

" Remap beginning and ending of line 
nnoremap H ^
nnoremap L $

" Copy to system clipboard
vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy  "+yy

" Paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Hit <enter> to insert new line in normal mode
map <enter> o<esc>
map <s-enter> o<esc>
