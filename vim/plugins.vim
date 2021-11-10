" Automatic installation {{{
if empty(glob('~/.vim/autoload/plug.vim')) && empty(glob('~/vimfiles/autoload/plug.vim'))
    !mkdir -p ~/.vim/autoload
    !curl -fLo ~/.vim/autoload/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall
endif
" }}}

let writing = ['markdown', 'md', 'tex', 'latex']

call plug#begin()

Plug 'Shougo/vimproc.vim', {'do': 'make'}

" Visual {{{
Plug 'arthurxavierx/vim-notebook'
Plug 'mhinz/vim-startify'               " [[plugin/startscreen.vim]]
" }}}

" Windows and buffers {{{
Plug 'christoomey/vim-tmux-navigator'
Plug 'justinmk/vim-dirvish'             " [[plugin/dirvish.vim]]
" }}}

" Text edition {{{
" Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'bkad/CamelCaseMotion'             " [[./mappings.vim]]
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Plug 'Raimondi/delimitMate'
Plug 'arthurxavierx/vim-caser'
Plug 'Chiel92/vim-autoformat'
Plug 'arecarn/vim-crunch'
Plug 'justinmk/vim-sneak'
" }}}

Plug 'kana/vim-arpeggio'

" Completion [[plugin/completion.vim]] {{{
" Plug 'lifepillar/vim-mucomplete'        " [[plugin/mucomplete.vim]]
" Plug 'arthurxavierx/vim-symbols'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-dictionary',
  \ 'coc-syntax',
  \ 'coc-ultisnips',
  \ 'coc-tsserver'
  \ ]

" }}}

" Snippets [[snippets]] {{{
Plug 'SirVer/ultisnips'                 " [[plugin/snippets.vim]]
" }}}

" Syntax and linting [[plugin/linting.vim]] {{{
" Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
" Plug 'vmchale/dhall-vim'
" }}}

" FZF [[plugin/fzf.vim]] {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}

" PureScript [[ftplugin/purescript.vim]] {{{
Plug 'danieljharvey/psc-ide-vim', { 'for': 'purescript', 'commit': 'd71ead6' }
Plug 'scrooloose/syntastic', { 'for': 'purescript' }  " [[plugin/syntastic.vim]]
" }}}

" Idris [[ftplugin/idris.vim]] {{{
" Plug 'idris-hackers/idris-vim', { 'for': 'idris' }
" }}}

" Writing {{{
" Plug 'reedes/vim-pencil', { 'for': writing }
" Plug 'junegunn/limelight.vim'           " [[plugin/limelight.vim]]
" }}}

" Plug 'ssteinbach/vim-pico8-syntax'
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'vim-scripts/ShaderHighLight'

unlet writing

call plug#end()
