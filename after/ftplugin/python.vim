set foldmethod=indent

if !has("python")
  let g:loaded_jedi = 1
  " Add the virtualenv's site-packages to vim path
  py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

endif

" Braceless
autocmd FileType python BracelessEnable  +fold

" python.vim
let python_highlight_all = 1

" SimplyFold
" let g:SimpylFold_fold_docstring = 0
" autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
" autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" pep8
setlocal textwidth=80
execute "setlocal colorcolumn=" . join(range(&textwidth+1,335), ',')

" cut spaces from line end
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

" virtualenv
let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '(%n)'

"autocmd FileType python setlocal completeopt-=preview
setlocal completeopt-=preview
" autocmd FileType python setlocal omnifunc=jedi#completions

" jedi settings
let g:jedi#rename_command = "<leader>jr"
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#goto_command = "<leader>d"
" let g:jedi#use_splits_not_buffers = "right"
let g:jedi#use_splits_not_buffers = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "2"
nmap <buffer> <Leader>dv :let g:jedi#use_splits_not_buffers="right"<CR> :call jedi#goto()<CR>:let g:jedi#use_splits_not_buffers=0<CR>
nmap <buffer> <Leader>ds :let g:jedi#use_splits_not_buffers="bottom"<CR> :call jedi#goto()<CR>:let g:jedi#use_splits_not_buffers=0<CR>
nmap <buffer> <Leader>dt :tab split<CR> :call jedi#goto()<CR>

" run py.test's
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

"nnoremap <leader>ju :YcmCompleter GoToDefinitionElseDeclaration<CR>

" <Leader>0: Run the visually selected code in python and replace it with the
" " output
vnoremap <silent> <Leader>0 :!python<cr>
" Neomake {{{
let g:neomake_python_enabled_makers = ['flake8']
autocmd! FileType python map <buffer> <leader>8 :Neomake<CR>
" }}}
