" vim:foldmethod=marker:foldlevel=0
"
setlocal textwidth=120
execute "setlocal colorcolumn=" . join(range(&textwidth+1,335), ',')

" let g:go_bin_path = expand("~/.gotools")
" let g:deoplete#sources#go#gocode_binary = expand("~/.gotools/gocode")
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
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

let g:go_def_mode = 'godef'
let g:go_fmt_command = "goimports"
let g:go_term_enabled = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 0

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
