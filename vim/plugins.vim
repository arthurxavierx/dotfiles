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
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" Visual {{{
Plug 'rakr/vim-one'               " [plugin/colors.vim]

Plug 'itchyny/lightline.vim'      " [plugin/lightline.vim]
Plug 'mgee/lightline-bufferline'

Plug 'arthurxavierx/vim-unicoder' " [plugin/abbreviations.vim]
Plug 'kshenoy/vim-signature'
" }}}

" Windows and buffers {{{
Plug 'rgarver/Kwbd.vim'  " delete buffer without closing the window
Plug 'christoomey/vim-tmux-navigator'
Plug 'justinmk/vim-dirvish'
" }}}

" Text edition {{{
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'bkad/CamelCaseMotion'             " [./mappings.vim]
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'arthurxavierx/vim-caser'
Plug 'Raimondi/delimitMate'
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

" PureScript [ftplugin/purescript.vim] {{{
Plug 'frigoeu/psc-ide-vim', { 'for': 'purescript' }
Plug 'scrooloose/syntastic', { 'for': 'purescript' }  " [plugin/syntastic.vim]
" }}}

" Idris [ftplugin/idris.vim] {{{
Plug 'idris-hackers/idris-vim', { 'for': 'idris' }
" }}}

" Haskell [ftplugin/haskell.vim] {{{
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
" }}}

" Writing [plugin/writing.vim] {{{
Plug 'reedes/vim-pencil'
" }}}

call plug#end()
