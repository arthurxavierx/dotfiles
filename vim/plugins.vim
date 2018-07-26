" vim: fdm=marker:fdl=0:cc=80:
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

Plug 'rakr/vim-one'  " [plugin/colors.vim]

" Lightline [plugin/lightline.vim] {{{
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
Plug 'bkad/CamelCaseMotion'             " [./mappings.vim]
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'Raimondi/delimitMate'
Plug 'arthurxavierx/vim-unicoder'       " [plugin/abbreviations.vim]
Plug 'lifepillar/vim-mucomplete'        " [plugin/completion.vim]
" }}}

" Syntax and linting [plugin/ale.vim] {{{
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
" }}}

" FZF [plugin/fzf.vim] {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}

" PureScript [after/ftplugin/purescript.vim] {{{
Plug 'frigoeu/psc-ide-vim', { 'for': 'purescript' }
Plug 'scrooloose/syntastic', { 'for': 'purescript' }  " [plugin/syntastic.vim]
" }}}

" Idris [after/ftplugin/idris.vim] {{{
Plug 'idris-hackers/idris-vim', { 'for': 'idris' }
" }}}

" Haskell [after/ftplugin/haskell.vim] {{{
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
" }}}

" Writing [plugin/writing.vim] {{{
Plug 'reedes/vim-pencil'
" }}}

call plug#end()
filetype plugin indent on
