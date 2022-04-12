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
