"============== General Configs ===============
" Disable vi compatibility
set nocompatible

" Disable welcome screen at startup
set shortmess+=I

" Turn line number on
set number

" Use Dos as the standard file type
set fileformats=dos,unix,mac

" set default mapleader key
let mapleader='\'
let g:mapleader='\'

" No backup files
set nobackup

" Only in case you don't want a backup file while editing
set nowritebackup

" No swap files
set noswapfile

" Set to auto read when a file is changed from the outside
set autoread

" Buffer can exist in the background
set hidden

set cursorline
set showcmd

if has("win32")
    " Enable windows environment
    source $VIMRUNTIME/mswin.vim
    behave mswin
    " In DOS based system use windows clipboard for cut/copy
    set clipboard+=unnamedplus,unnamed
elseif has('unix')
    behave xterm
endif

" Intelligent comments
set comments=sl:/**,mb:\ *,elx:\ */

" Always show current position
set ruler

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Turn on wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.swp,*.bak,*.pyc,*.class

" Turn syntax highlighting on
syntax on
syntax enable
set synmaxcol=0
"set term=screen-256color
set display=uhex
set shortmess=filnxtToO

" Height of the command bar
set cmdheight=2

set nowrap
if &diff
    set wrap
endif

" Set 7 lines to the cursor - when moving vertically using j/k
"set scrolloff=7

" When searching try to be smart about cases
set smartcase

set completeopt=menu
set mousemodel=popup

" Configure backspace
set backspace=start,eol,indent
set whichwrap+=<,>,h,l

set autoindent
" use intelligent indentation for C
set smartindent
set cindent

" set UTF-8 as standard encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set fillchars=vert:¦

" configure tabwidth and insert spaces instead of tabs
set softtabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to indent
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=120
set foldcolumn=1
" enable right margin
set colorcolumn=+1,+2
highlight ColorColumn guibg=LightGray

set linespace=0
set history=1000
" show whitespace characters
"set list listchars=tab:› ,trail:-,extends:>,precedes:<,eol:¬

" Turn search highlighting on
set hlsearch

" Highlight matching braces
set showmatch

set laststatus=2

set mouse=a
set vb
set ttym=xterm2

" Enable fast scrolling
set ttyfast

" Opens vertical split right of current window
set splitright
" Opens horizontal split below current window
set splitbelow

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Misc.
set nostartofline

" Change the terminal's title
set title
set mousehide

" Load standard tag files
if has("unix")
    set tags=~/.vim/tags/tags
    set tags+=~/.vim/tags/cpp
    set tags+=~/.vim/tags/gl
    set tags+=~/.vim/tags/sdl
    set tags+=~/.vim/tags/qt4
    set tags+=~/.vim/tags/tcl
endif

if version > 720
    set undofile
    " use many levels of undo
    set undolevels=1000      
    set undodir=~/vimundo/
endif

" set timeout after leader key is pressed
set timeout timeoutlen=3000 ttimeoutlen=100

" Remember info about open buffers on close
set viminfo=%,'50,\"100,:100,n~/.viminfo

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
