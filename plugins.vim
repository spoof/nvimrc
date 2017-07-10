" ================
" Plugins settings
" ================

let s:mac = has('mac')
set sessionoptions-=options

" airline {{{
let g:airline_powerline_fonts = 0
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions = ['tabline', 'neomake', 'hunks', 'whitespace', 'unite', 'netrw']
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#tabline#show_tab_type = 2
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#close_symbol = '✖'
let g:airline_theme='onedark'

let g:airline_mode_map = {
     \ '__' : '-',
     \ 'n'  : 'N',
     \ 'i'  : 'I',
     \ 'R'  : 'R',
     \ 'c'  : 'C',
     \ 'v'  : 'V',
     \ 'V'  : 'V',
     \ 's'  : 'S',
     \ 'S'  : 'S',
     \ }
"}}}

" tmuxline {{{
" let g:tmuxline_powerline_separators = 0
" let g:tmuxline_preset = 'full'
" }}}

" startify
let g:startify_bookmarks = [ '~/.vimrc' ]
let g:startify_list_order = [
      \ ['   MRU:'],
      \ 'files' ,
      \ ['   MRU (dir):'],
      \ 'dir',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ]
let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ '\.fugitiveblame',
      \ $VIMRUNTIME .'/doc',
      \ 'bundle/.*/doc',
      \ '\.vimgolf',
      \ ]

function! s:center_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines), 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_custom_header = s:center_header(split(system('fortune | '. (s:mac ? 'cowthink' : 'cowsay -f apt')), '\n'))
let g:startify_custom_footer = ['', "   Vim is charityware. Please read ':help uganda'.", '']
let g:startify_change_to_dir = 0
let g:startify_relative_path = 1
let g:startify_files_number = 8
let g:startify_enable_special = 0
let g:startify_enable_unsafe = 1

" Vitality
let g:vitality_fix_focus = 0

" NERDCommenter
let g:NERDSpaceDelims = 1

" netrw
"let g:loaded_netrwPlugin = 1
let g:netrw_localrmdir='rm -r'
let g:netrw_list_hide='.*\.swp$,\.pyc$'

" Explore current (CWD) directory
nnoremap <silent> <leader>e :e .<cr>
nnoremap <silent> <leader>ev :vsp .<cr>
nnoremap <silent> <leader>es :sp .<cr>
" Explore directory contains a file in the current buffer
nnoremap <silent> <leader>E :Explore<cr>
nnoremap <silent> <leader>Ev :Vex!<cr>
nnoremap <silent> <leader>Es :Sex<cr>

" Shougo/Unite {{{
let g:unite_candidate_icon="→ "
let g:unite_marked_icon="☆"
let g:unite_source_history_yank_enable = 1
" replacing unite with ctrl-p
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''
let g:unite_source_grep_max_candidates = 500
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async', 'sorters', 'sorter_rank')
"call unite#custom#source('file_rec/async', 'sorters', 'sorter_length')
call unite#custom#source('file_rec/neovim', 'ignore_globs', [])
call unite#custom_source('file_rec,file_rec/neovim,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.DBStore/',
      \ '\.vagrant/',
      \ '\.pyc/',
      \ ], '\|'))

" Open the file search buffer (search in CWD)
" nnoremap <silent> <leader>f :Unite -start-insert -no-split -buffer-name=files file_rec/async:<cr>
" Open the file search in the current file's directory
nnoremap <silent> <leader>F :UniteWithBufferDir -start-insert -no-split -buffer-name=files file_rec<cr>
" Recently accessed files
nnoremap <silent> <leader>fr :Unite -no-split -buffer-name=recent -start-insert file_mru<cr>
"nnoremap <silent> <leader>fb :<C-u>Unite -no-split -buffer-name=buffer buffer<cr>

" Like ctrlp.vim settings.
call unite#custom#profile('default', 'context', {
    \   'start_insert': 0,
    \   'winheight': 10,
    \   'direction': 'botright',
    \   'default_action': 'open',
    \   'vertical_preview': 1,
    \   'keep_focus': 1,
    \   'prompt_direction': 'top',
    \   'input': '',
    \ })

" Yank history
nnoremap <silent> <Leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>

" Searching in files
nnoremap <Leader>a :Unite -no-quit -no-empty grep:.<cr>
nnoremap <Leader>A :<C-u>Unite -buffer-name=search -auto-preview -no-quit -no-empty grep:.::<CR>
nnoremap <Leader>fu :<C-u>execute 'Unite grep:.::' . expand('<cword>') . ' -no-quit'<Cr>

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
        \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' ' .
        \ '--ignore ''**/*.pyc'''
let g:unite_source_grep_recursive_opt = ''

let g:unite_source_rec_async_command = 'ag --follow --nocolor, --nogroup, --hidden, -g ""'
"let g:unite_source_rec_async_command = [ag, --follow, --skip-vcs-ignores, --nocolor, --nogroup, --hidden, -g, ]
"let g:unite_source_rec_async_command = []
"let g:unite_source_rec_async_command = 'ag --nocolor --nogroup'

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  nmap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nmap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  nmap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

" }}}

" Gundo {{{
nmap <leader>u :GundoToggle<CR>
" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1
" " a little wider for wider screens
let g:gundo_width = 60
" }}}

" YankRing {{{
let yankring_history_dir = $HOME."/.config/nvim/tmp/"
if !isdirectory(yankring_history_dir)
    call mkdir(yankring_history_dir, "p")
endif
let g:yankring_history_dir = yankring_history_dir
nnoremap ,yr :YRShow<CR>
nnoremap C-y :YRShow<CR>
" }}}

" Neomake {{{
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_list_height = 4

let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {
            \   'text': '⚠',
            \   'texthl': 'NeomakeWarningSign',
            \ }
let g:neomake_message_sign = {
            \   'text': '➤',
            \   'texthl': 'NeomakeMessageSign',
            \ }
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

autocmd! BufWritePost * Neomake
" }}}

" Shougo/echodoc {{{
let g:echodoc_enable_at_startup = 1
" }}}

" Shougo/Deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 2
set completeopt+=noselect
autocmd CompleteDone * pclose!
" }}}

" ervandew/supertab {{{
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}

" Gist {{{
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
"let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
" }}}

" Gitgutter
let g:gitgutter_sign_column_always = 1

" TabBar
nmap <silent><Leader>tb :TagbarToggle<CR>
nmap <silent><Leader>tj :TagbarOpenAutoClose<CR>

" Ultisnips {{{
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}

" Tabular {{{
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" }}}

" FZF {{{
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let $FZF_DEFAULT_OPTS = '--reverse'
let g:fzf_nvim_statusline = 0
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_command_prefix = 'FZF'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"
"function! s:ag_to_qf(line)
"  let parts = split(a:line, ':')
"  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
"        \ 'text': join(parts[3:], ':')}
"endfunction
"
"function! s:ag_handler(lines)
"  if len(a:lines) < 2 | return | endif
"
"  let cmd = get({'ctrl-x': 'split',
"               \ 'ctrl-v': 'vertical split',
"               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
"  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')
"
"  let first = list[0]
"  execute cmd escape(first.filename, ' %#\')
"  execute first.lnum
"  execute 'normal!' first.col.'|zz'
"
"  if len(list) > 1
"    call setqflist(list)
"    copen
"    wincmd p
"  endif
"endfunction
"
"command! -nargs=* AgAg call fzf#run({
"\ 'source':  printf('ag --nogroup --column --color "%s"',
"\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
"\ 'sink*':    function('<sid>ag_handler'),
"\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
"\            '--multi --bind ctrl-a:select-all,ctrl-d:deselect-all,enter:ignore '.
"\            '',
"\ 'down': '30%'
"\ })
"
nnoremap <silent> <leader>f :FZFFiles<cr>
nnoremap <silent> <leader>fv :FZFFiles { 'window': 'vnew' }<cr>
nnoremap <silent> <leader>F :FZFFiles %:p:h<cr>
nnoremap <silent> <leader>Fv :FZFFiles %:p:h {''}<cr>
nnoremap <silent> <leader>fr :FZFHistory<cr>
nnoremap <silent> <leader>fb :FZFBuffers<cr>
" }}}

" {{{ jsx
let g:jsx_ext_required = 0
" }}}
"
" {{{ vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}
" vim:foldmethod=marker:foldlevel=0
