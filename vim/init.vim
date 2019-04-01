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

set colorcolumn=80
set list listchars=trail:·,tab:»»,extends:»,precedes:«

" Abbreviate messages and truncate when needed
set shortmess+=atF
set noshowmode

" Do not redraw the screen for commands that have not been typed
set lazyredraw

" Use system clipboard for yanking and pasting
set clipboard=unnamed

" Keep at least 8 lines above or below the cursor
set scrolloff=5

if has('nvim')
  set shada='100,n$HOME/.nviminfo
else
  set viminfo='100,n$HOME/.viminfo
endif

autocmd FileType c,cpp,purescript,haskell,javascript,idris,agda,cs,tex
      \ autocmd BufWritePre <buffer> %s/\s\+$//e

" Completion [[plugin/completion.vim]] {{{
set complete=.,b
set ignorecase
set shortmess+=c
set belloff+=ctrlg
set pumheight=10
set completeopt=menu,menuone,noselect
set omnifunc=syntaxcomplete#Complete
" }}}

" Color {{{
if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set t_8f=u;%lu;%lum
  set t_8b=u;%lu;%lum
else
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if has("termguicolors")
  set termguicolors
endif

set background=light
colorscheme notebook
set nocursorcolumn nocursorline colorcolumn=0

set fillchars+=vert:│
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
set wildignore+=*/node_modules/**
set wildignore+=*/plugged/**
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
nohlsearch

set ignorecase
set smartcase
set fileignorecase

if has('nvim')
  set inccommand=nosplit
endif
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
