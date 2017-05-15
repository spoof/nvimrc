" ================
" Mappings settings
" ================

" don't let us be lazy, no arrow keys in the command mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" normal mode
inoremap jk <Esc>
inoremap kj <Esc>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" open/close the location list window
nmap <leader>l :lopen<CR>
nmap <leader>ll :lclose<CR>


" easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Close window
map <c-c> <c-w>c

" Reload Vimrc
map <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo '~/.config/nvim/init.vim reloaded'"<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" save fast
nmap <leader>s :w<cr>
" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" hide matches on <leader>space and by enter
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>""

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Paste from clipboard
map <leader>p "+p

" current line movement
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <leader>j <Esc>:m .+1<CR>==gi
inoremap <leader>k <Esc>:m .-2<CR>==gi
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

" formatting
map Q gq

" set filetype
map <Leader>ftp <ESC>:set filetype=python<CR>

" tabs
:map tn :tabnew<CR>
:map td :tabclose<CR>
noremap <silent> <C-t>h :execute "tabmove" tabpagenr() - 2<CR>
noremap <silent> <C-t>l :execute "tabmove" tabpagenr()<CR>

" don't outdent hashes
inoremap # X<BS>#

" toggle invisibles
noremap <Leader>i :set list!<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

nmap ,cp :let @+=expand("%")<CR>
nmap ,cP :let @+=expand("%:p")<CR>
nmap ,cf :let @+=expand("%:t")<CR>

" Moving around, tabs, windows and buffers {{{

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Remember info about open buffers on close
set viminfo^=%

" }}}

tnoremap <Esc> <C-\><C-n>

" vim:foldmethod=marker:foldlevel=0
