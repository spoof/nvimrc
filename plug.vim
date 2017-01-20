if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
           \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
    endif

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-gtfo'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-janah'
Plug 'mhinz/vim-grepper'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'jnurmine/Zenburn'
Plug 'freeo/vim-kalisi'
"Plug 'roman/golden-ratio'

" useful plugins
" Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'benatkin/vim-move-between-tabs'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'
Plug 'sjl/vitality.vim'
" Plug 'kien/ctrlp.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim'
Plug 'rking/ag.vim'
Plug 'reinh/vim-makegreen'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
" Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'dyng/ctrlsf.vim'
" Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/context_filetype.vim'
Plug 'ervandew/supertab'

"Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neco-syntax'
Plug 'tsukkee/unite-tag'
Plug 'osyo-manga/unite-quickfix'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'

" text objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
" Plug 'bps/vim-textobj-python'
Plug 'tweekmonster/braceless.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'mattn/gist-vim'

" python
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'fs111/pydoc.vim', { 'for': 'python' }
Plug 'alfredodeza/pytest.vim', { 'for': 'python' }
" test python code on the fly
"Plug 'mitechie/kevinw/pyflakes-vim'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
" Plug 'scrooloose/syntastic'
" Plug 'python-rope/ropevim', { 'for': 'python' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
" Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
Plug 'Konfekt/FastFold'
Plug 'neomake/neomake'
Plug 'thiderman/vim-snakecharmer'

" other languages
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'nelstrom/vim-markdown-preview'
Plug 'chase/vim-ansible-yaml', { 'for': 'ansible' }
" temprorary disabled
" Plug 'Valloric/MatchTagAlways'
Plug 'mitsuhiko/vim-jinja'
Plug 'sophacles/vim-bundle-mako'
Plug 'vim-scripts/SQLUtilities'

" Go
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'garyburd/go-explorer', { 'do': 'go get github.com/garyburd/go-explorer/src/getool' }

" Swift
Plug '~/.config/nvim/plugged/swift.vim'
" Plug 'landaire/deoplete-swift'
Plug 'mitsuse/autocomplete-swift'

" Javascript
Plug 'carlitux/deoplete-ternjs'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'guns/xterm-color-table.vim'

Plug 'MarcWeber/vim-addon-local-vimrc'

" other staff
Plug 'ryanss/vim-hackernews'

" Task management
Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki', { 'do': 'pip install --upgrade git+git://github.com/tbabej/tasklib@develop' }
Plug 'powerman/vim-plugin-AnsiEsc/'
Plug 'farseer90718/vim-taskwarrior'

" Theme
Plug 'ryanoasis/vim-devicons'
Plug 'flazz/vim-colorschemes'
Plug 'arcticicestudio/nord-vim'
Plug '29decibel/codeschool-vim-theme'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'brafales/vim-desert256'
Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'w0ng/vim-hybrid'
Plug 'spoof/clear_colors'
Plug 'fatih/molokai'
Plug 'mhartington/oceanic-next'
Plug 'jonathanfilip/vim-lucius'
Plug 'altercation/vim-colors-solarized'
Plug 'alem0lars/vim-colorscheme-darcula'
Plug 'rakr/vim-two-firewatch'

call plug#end()
