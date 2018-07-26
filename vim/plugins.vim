" vim: fdm=marker:fdl=0:
" Automatic installation {{{
if empty(glob('~/.vim/autoload/plug.vim')) && empty(glob('~/vimfiles/autoload/plug.vim'))
    !mkdir -p ~/.vim/autoload
    !curl -fLo ~/.vim/autoload/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall
endif
" }}}

call plug#begin()

Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'

Plug 'tpope/vim-unimpaired'

" Visual {{{
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
" }}}

" Windows and buffers {{{
Plug 'rgarver/Kwbd.vim'  " delete buffer without closing the window
Plug 'christoomey/vim-tmux-navigator'
" }}}

" Text edition {{{
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'bkad/CamelCaseMotion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'  " coercion between cases
Plug 'Raimondi/delimitMate'  " auto-surround for delimiters
Plug 'arthurxavierx/vim-unicoder'
Plug 'lifepillar/vim-mucomplete'
" }}}

" Syntax and linting {{{
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
" }}}

" Finding {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}

" PureScript {{{
Plug 'frigoeu/psc-ide-vim', { 'for': 'purescript' }
Plug 'scrooloose/syntastic', { 'for': 'purescript' }
" }}}

" Idris {{{
Plug 'idris-hackers/idris-vim', { 'for': 'idris' }
" }}}

" Haskell {{{
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
" }}}

" Unity {{{
" Plug 'OrangeT/vim-csharp', { 'for': 'cs' }
" Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
" Plug 'vim-scripts/ShaderHighLight'
" }}}

" Writing {{{
Plug 'reedes/vim-pencil'
" }}}

call plug#end()
filetype plugin indent on
