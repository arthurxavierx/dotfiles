" vim: foldmethod=marker
let $LANG = 'en'
set nocompatible

filetype plugin indent on
syntax on

filetype on
set showcmd

set number
set relativenumber
set showmatch
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set list lcs=trail:·,tab:»»,extends:»,precedes:«
set foldmethod=syntax
set foldlevelstart=2
set complete+=d
set shortmess+=atI

set clipboard=unnamed

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

set conceallevel=0

set ttyfast
set lazyredraw

set nowrap " spacing
set tw=89
set colorcolumn=80
set wm=0
set fo-=t

set shiftround
set tabstop=2 shiftwidth=2

set eol
set expandtab
set autoindent
set backspace=indent,eol,start
set copyindent
set smarttab

" search
set gdefault
set hlsearch
set incsearch
set ignorecase
set smartcase

set hidden " hidden buffers
set splitright " split to right by default
set splitbelow " split below by default

set cursorcolumn
set cursorline

let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

"
source $DOTFILES/vim/plugins.vim
