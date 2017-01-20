" many settings taken from here https://github.com/sontek/dotfiles/
let &shell='/usr/local/bin/fish'
let &shell='/usr/local/bin/zsh'

"let g:python3_host_prog = '/usr/local/bin/python3'
"let g:python_host_prog = '/usr/local/bin/python'

source ~/.config/nvim/plug.vim

source ~/.config/nvim/base.vim
source ~/.config/nvim/theme.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim
" source ~/.config/nvim/python.vim
" source ~/.config/nvim/golang.vim
source ~/.config/nvim/languages.vim

if filereadable(".vimrc.local")
   source .vimrc.local
endif
