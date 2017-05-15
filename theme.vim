" vim:foldmethod=marker:foldlevel=0
" ==============
" Theme settings
" ==============

"set t_Co=256                " enable 256 colors
set background=dark           " We are using dark background in vim

" colorscheme Tomorrow-Night
" lucius realted settings {{{
" let g:lucius_style = "dark"
" }}}
" colorscheme lucius
" colorscheme darcula
" colorscheme Tomorrow-Night-Eighties

" colorscheme hybrid
" colorscheme clear_colors_dark
" clear_colors_dark related settings {{{
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=238
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0
" }}}
" vim indent guides
let g:indent_guides_auto_colors = 1

" Limelight {{{
nmap <silent> <leader>ll :Limelight!!<CR>
xmap <leader>ll <Plug>(Limelight)

let g:limelight_paragraph_span = 0
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'
" }}}

" colorscheme janah
" janah related settings {{{
" autocmd VimEnter,Colorscheme * :hi ColorColumn ctermbg=238
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=232
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0
" autocmd VimEnter,ColorScheme * :hi Comment ctermfg=240

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" }}}
" gruvbox overrides {{{
" autocmd VimEnter,Colorscheme * :hi SignColumn ctermbg=236 guibg=#32302f
" autocmd VimEnter,Colorscheme * :hi GruvboxGreenSign ctermfg=142 ctermbg=236 guifg=#b8bb26 guibg=#32302f
" autocmd VimEnter,Colorscheme * :hi GruvboxAquaSign ctermfg=108 ctermbg=236 guifg=#8ec07c guibg=#32302f
" autocmd VimEnter,Colorscheme * :hi GruvboxRedSign ctermfg=167 ctermbg=236 guifg=#fb4934 guibg=#32302f
" autocmd VimEnter,Colorscheme * :hi FoldColumn ctermfg=245 ctermbg=236 guifg=#928374 guibg=#32302f
"let g:gruvbox_termcolors=256

let g:gruvbox_bold = 0
let g:gruvbox_contrast_dark = 'hard' " hard, medium
let g:gruvbox_invert_selection = 0
let g:gruvbox_sign_column = 'bg0'
let g:gruvbox_vert_split = 'bg0'
" }}}

function! SetSoftContrast()
    let g:gruvbox_contrast_dark = 'soft' " hard, medium
    augroup fix_colorscheme
        autocmd!
        autocmd VimEnter,Colorscheme * :hi FoldColumn ctermfg=246 ctermbg=237 guifg=#928374 guibg=#32302f
    augroup END
    colorscheme gruvbox
    "colorscheme Tomorrow-Night
endfunction

function! SetHardContrast()
    let g:gruvbox_contrast_dark = 'hard' " hard, medium
    augroup fix_colorscheme
        autocmd!
        autocmd VimEnter,Colorscheme * :hi FoldColumn ctermfg=229 ctermbg=234 guifg=#fdf4c1 guibg=#1d2021
    augroup END
    colorscheme gruvbox
    "colorscheme Tomorrow-Night-Bright
endfunction

nnoremap <leader>1 :call SetSoftContrast()<cr>
nnoremap <leader>2 :call SetHardContrast()<cr>

call SetSoftContrast()
" colorscheme nova
