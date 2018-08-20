" vim: fdm=marker:fdl=0:
set nocompatible
let $LANG = 'en'

" Sensible defaults
filetype plugin indent on
syntax on
filetype on
set showcmd
set eol
set title
set nobackup
set noswapfile
set noerrorbells

set number relativenumber

" Show matching brackets when inserting
set showmatch

set conceallevel=0
set colorcolumn=80
set list listchars=trail:·,tab:»»,extends:»,precedes:«

" Abbreviate messages and truncate when needed
set shortmess+=at
" Remove the intro message when starting Vim
set shortmess+=I

" Do not redraw the screen for commands that have not been typed
set lazyredraw

" Use system clipboard for yanking and pasting
set clipboard=unnamed

" Keep at least 8 lines above or below the cursor
set scrolloff=5

" Save deleted marks when closing buffers
if has('nvim')
  autocmd BufUnload * delm 0-9 | wshada!
endif

" Completion [plugin/completion.vim] {{{
set complete+=d
set pumheight=10
set completeopt=menu,menuone
set omnifunc=syntaxcomplete#Complete
" }}}

" Folding {{{
set foldmethod=syntax
set foldlevel=1
set foldignore=
set foldopen-=block
set fillchars+=fold:\ ,
" }}}

" Wildmenu {{{
set wildmenu
set wildignore+=*/tmp/*,*.so,*.out,*.exe,*.app,*.dll,*.a,*.la,*.lib,*.swp,*.zip,*.meta
set wildignore+=*.swp,*.bak
set wildignore+=*.o,*.d,*.obj
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=*/min/*
set wildignore+=tags,cscope.*
set wildignore+=*.tar.*
set wildignore+=*/bower_components/**
set wildignore+=*/node_modules/**
set wildignore+=*/output/**
set wildignorecase
set wildmode=list:full
set path& | let &path .= "**"
set path-=/usr/include
" }}}

" Wrapping and formatting {{{
set nowrap
set textwidth=80
set wrapmargin=0
set formatoptions=vcrqjl
" }}}

" Indentation {{{
set shiftround
set tabstop=2 shiftwidth=2
set expandtab
set autoindent
set backspace=indent,eol,start
set copyindent
set smarttab
" }}}

" Search {{{
set gdefault
set hlsearch
set incsearch
set ignorecase
set smartcase
" }}}

" Buffers {{{
set hidden
set splitright
set splitbelow
" }}}

" Python {{{
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1
" }}}

source $DOTFILES/vim/plugins.vim
source $DOTFILES/vim/mappings.vim
