" ==============
" Base settings
" ==============
let s:mac = has('mac')

if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

let g:python3_host_skip_check = 1

" https://github.com/neovim/neovim/wiki/Following-HEAD#20160214
" filetype plugin indent on

""" common settings
let mapleader=","           " change the leader to be a comma vs slash

set nobackup                " no backup files
set noswapfile              " no swap files
set fileencodings=utf8,
set exrc                    " enable per-directory .vimrc files
set secure                  " disable unsafe commands in local .vimrc files

set noerrorbells            " don't bell

syntax on                   " syntax highlighing
filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype
set number                  " Display line numbers
set numberwidth=1           " using only 1 column (and 1 space) while possible
set title                   " show title in console title bar
set wildmenu                " Menu completion in command mode on <Tab>
set wildmode=full           " <Tab> cycles between all matching choices.


" Terminal settings {{{
set termencoding=utf-8
set mouse=a                 " enable mouse
if version >= 730 && has("macunix")
    " Default yank and paste go to Mac's clipboard
    set clipboard=unnamed
end
" }}}

" Moving Around/Editing {{{
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " avoid moving cursor to BOL when jumping around
set virtualedit=block       " let cursor move past the last char in <C-v> mode
set scrolloff=3             " keep 3 context lines above and below the cursor
set backspace=2             " allow backspacing over autoindent, EOL, and BOL
set showmatch               " briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set showbreak=↪             " if we break show this sign
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
set foldcolumn=1            " show folding
set mousehide               " hide coursor on text typing
" }}}

" Reading/Writing {{{
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.
" }}}

" Searching and Patterns {{{
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
" }}}

" Messages, Info, Status {{{
set ls=2                    " allways show status line
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " use [+]/[RO]/[w] for modified/readonly/written.
set laststatus=2            " always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}
set showtabline=2           " don't show any signs on the tabline
" }}}

""" Ignore these files when completing
set wildignore=*.o,.git,*.swp,*.swo,*~,*.pyc,build,*.egg-info/*,dist,deb_dist,pyshared
set wildignore+=eggs/**

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,preview,noinsert
set completeopt+=noinsert
set completeopt+=noselect
set pumheight=6             " Keep a small completion window

set lazyredraw              " to avoid scrolling problems

set splitright
set splitbelow

set scrolloff=10
set scrolljump=3

set noshowmode              " required by echodoc

if has('persistent_undo')
  set undolevels=2000            " The number of undo items to remember
  set undofile                   " Save undo history to files locally
  set undodir=$HOME/.nvimundo    " Set the directory of the undofile
  if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
  endif
endif
" neovim features
set inccommand=split
" vim:foldmethod=marker:foldlevel=0
