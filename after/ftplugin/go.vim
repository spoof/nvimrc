" vim:foldmethod=marker:foldlevel=0
"
setlocal textwidth=120
execute "setlocal colorcolumn=" . join(range(&textwidth+1,335), ',')

" deoplete {{{
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#use_cache = 1
" let g:deoplete#sources#go#gocode_binary=$GOPATH.'/bin/gocode'
" }}}

" vim-go {{{
let g:go_def_mode = 'godef'
let g:go_fmt_command = "goimports"
let g:go_term_enabled = 1
let g:go_fmt_fail_silently = 1
let g:go_auto_type_info = 0

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

nmap <buffer> <leader>r <Plug>(go-run)
nmap <buffer> <leader>rt <Plug>(go-run-tab)
nmap <buffer> <Leader>rs <Plug>(go-run-split)
nmap <buffer> <Leader>rv <Plug>(go-run-vertical)

nmap <buffer> <leader>b <Plug>(go-build)
nmap <buffer> <leader>t <Plug>(go-test)
nmap <buffer> <leader>c <Plug>(go-coverage)

nmap <buffer> <Leader>d <Plug>(go-def)
nmap <buffer> <Leader>ds <Plug>(go-def-split)
nmap <buffer> <Leader>dv <Plug>(go-def-vertical)
nmap <buffer> <Leader>dt <Plug>(go-def-tab)

nmap <buffer> <Leader>gd <Plug>(go-doc)
nmap <buffer> <Leader>gv <Plug>(go-doc-vertical)

nmap <buffer> <Leader>gb <Plug>(go-doc-browser)

nmap <buffer> <Leader>s <Plug>(go-implements)
" }}}

" neomake {{{
let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
" let g:neomake_go_go_serialize = 1
" let g:neomake_go_go_serialize_abort_on_error = 2

let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--enable-gc',
  \   '--concurrency=3',
  \   '--fast',
  \   '-D', 'aligncheck',
  \   '-D', 'dupl',
  \   '-D', 'gocyclo',
  \   '-D', 'gotype',
  \   '-E', 'errcheck',
  \   '-E', 'misspell',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }
" }}}

" TagBar {{{
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
" }}}
