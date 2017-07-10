if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
           \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
    endif

call plug#begin('~/.local/share/nvim/plugged')

" Files and search {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }          " General-purpose command-line fuzzy finder
Plug 'junegunn/fzf.vim'                                                    " Wrapper for FZF
Plug 'justinmk/vim-gtfo'                                                   " Opens the file manager or terminal at the directory of the current file in Vim
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] } " Wrapper for grep commands
Plug 'tpope/vim-abolish'                                                   " easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-vinegar'                                                   " Enchancements for netrw
Plug 'dyng/ctrlsf.vim'                                                     " An ack/ag/pt/rg powered code search and view tool, like ack.vim or :vimgrep but together with more context
" }}}

" UI {{{
Plug 'bling/vim-airline'               " Statusline customization
Plug 'vim-airline/vim-airline-themes'  " Themes for airline
Plug 'nathanaelkane/vim-indent-guides' " Indent guides
Plug 'mhinz/vim-startify'              " Start screen
Plug 'junegunn/limelight.vim'          " Hyperfocus-writing
Plug 'junegunn/goyo.vim'               " Distraction-free writing
Plug 'benatkin/vim-move-between-tabs'  " Moving the current window between tabs
" }}}

" Text and motions {{{
Plug 'kana/vim-textobj-user'      " plugin to create your own text objects without pain
Plug 'tweekmonster/braceless.vim' " Text objects, folding, and more for Python and other indented languages
Plug 'tpope/vim-surround'         " The plugin provides mappings to easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-repeat'           " Better repeatition of .
Plug 'tpope/vim-unimpaired'       " Complementary pairs of mappings
Plug 'junegunn/vim-easy-align'    " Alignment plugin
Plug 'godlygeek/tabular'          " Text filtering and alignment
Plug 'justinmk/vim-sneak'         " Jump to any location specified by two characters
" }}}

" Unite {{{
Plug 'Shougo/unite.vim'                     " Unite and create user interfaces
Plug 'Shougo/neomru.vim'                    " MRU plugin for Unite
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " Asynchronous execution library
Plug 'Shougo/unite-outline'                 " Outline source for unite.vim
Plug 'tsukkee/unite-tag'                    " tags soruce for unite.vim
Plug 'osyo-manga/unite-quickfix'            " Source for unite.vim that shows outputs from quickfix
" }}}

" Non-sorted plugins {{{
Plug 'sjl/gundo.vim'               " Visualize your Vim undo tree
Plug 'tpope/vim-obsession'         " Sessions
Plug 'Shougo/echodoc.vim'          " Print documentation in echo area
Plug 'Shougo/context_filetype.vim' " Context filetype library for Vim script
Plug 'ervandew/supertab'           " Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs
Plug 'Shougo/neco-syntax'          " Syntax source for neocomplete/deoplete/ncm.
" }}}

" Integrations {{{
Plug 'sjl/vitality.vim'      " Restores the FocusLost and FocusGained autocommand functionality. In tmux too
Plug 'rizzatti/funcoo.vim'   " Required for 'rizzatti/dash.vim'
Plug 'rizzatti/dash.vim'     " Search for terms using the excellent Dash.app
" }}}

" tmux {{{
Plug 'tmux-plugins/vim-tmux' " Vim plugin for .tmux.conf
" Plug 'edkolev/tmuxline.vim'  " Simple tmux statusline generator, uses airline colors
" }}}
"
" Development. Common {{{
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Asynchronous keyword completion system in the current buffer
Plug 'scrooloose/nerdcommenter'                               " Commenter plugin
Plug 'SirVer/ultisnips'                                       " Useful snippets
Plug 'honza/vim-snippets'                                     " contains snippets files for various programming languages
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }            " Tags
Plug 'neomake/neomake'                                        " Asynchronous linting and make framework
" }}}

" Git {{{
Plug 'tpope/vim-fugitive'     " Git wrapper so awesome
Plug 'tpope/vim-git'          " Syntax, indent, and filetype plugin files for git, gitcommit, gitconfig, gitrebase, and gitsendemail
Plug 'junegunn/gv.vim'        " Git commit browser
Plug 'airblade/vim-gitgutter' " Shows a git diff in the gutter (sign column) and stages/undoes hunks
Plug 'mattn/gist-vim'         " Vimscript for creating gists
Plug 'lambdalisue/gina.vim'   " Plugin to asynchrnously control git repositorie
" }}}

" Python {{{
Plug 'vim-python/python-syntax', { 'for': 'python' }                     " Sytax
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }                " A nicer Python indentation style for vim
Plug 'fs111/pydoc.vim', { 'for': 'python' }                              " Python help intergration
Plug 'alfredodeza/pytest.vim', { 'for': 'python' }                       " Runs your UnitTests with py.test displaying red/green bars and errors
Plug 'zchee/deoplete-jedi', { 'for': 'python' }                          " Deoplete plugin for Python
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }                    " :python or :!python will behave like you would expect for the chosen virtualenv
Plug 'python-rope/ropevim', { 'for': 'python', 'do': 'pip install rope'} " Ropevim is a vim mode that uses rope library to provide features like python refactorings and code-assists
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }                         " Folding
Plug 'thiderman/vim-snakecharmer', { 'for': 'python' }                   " Folding
Plug 'michaeljsmith/vim-indent-object'                                   " Make text objects based on indentation
Plug 'mitsuhiko/vim-jinja'                                               " Jinja template filetype
" }}}

" Go {{{
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries \| gometalinter --install -u > /dev/null' }
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' } " Deoplete plugin for Go
" }}}

" Javascript {{{
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } " deoplete.nvim source for javascript
Plug 'pangloss/vim-javascript' " Provides syntax highlighting and improved indentation
Plug 'mxw/vim-jsx' " Syntax highlighting and indenting for JSX
" }}}

" HTML {{{
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
" }}}

" Markdown {{{
Plug 'nelstrom/vim-markdown-preview'
" }}}

Plug 'MarcWeber/vim-addon-local-vimrc'

" other staff
Plug 'ryanss/vim-hackernews'

" Vim dev {{{
Plug 'gerw/vim-HiLinkTrace'
Plug 'guns/xterm-color-table.vim'
" }}}

" Colorschemes {{{
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
Plug 'davidklsn/vim-sialoquent'
Plug 'danilo-augusto/vim-afterglow'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'KeitaNakamura/neodark.vim'
Plug 'romainl/Apprentice'
Plug 'cocopon/iceberg.vim'
Plug 'rhysd/vim-color-spring-night'
Plug 'kamwitsta/mythos'
Plug 'kamwitsta/nordisk'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'trevordmiller/nova-vim'
Plug 'freeo/vim-kalisi'
Plug 'jnurmine/Zenburn'
Plug 'mhinz/vim-janah'
" }}}

call plug#end()
" vim:foldmethod=marker:foldlevel=0
