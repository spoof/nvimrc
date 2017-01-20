" ===============================
" Other filetype specific changes
" ===============================

autocmd filetype html,xhtml,xml,css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd filetype js,json setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript set expandtab shiftwidth=2 tabstop=2 softtabstop=2
" autocmd FileType javascript silent! lcd %:p:h
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType javascript.jsx set expandtab shiftwidth=2 tabstop=2 softtabstop=2
" autocmd FileType javascript.jsx silent! lcd %:p:h

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType eruby set expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Git
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal colorcolumn=72
