" Automatic installation {{{
if empty(glob('~/.vim/autoload/plug.vim')) && empty(glob('~/vimfiles/autoload/plug.vim'))
    !mkdir -p ~/.vim/autoload
    !curl -fLo ~/.vim/autoload/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall
endif
" }}}

call plug#begin()

Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'

" Visual
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'

" Windows
Plug 'rgarver/Kwbd.vim'  " delete buffer window closing the window

" Text edition
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'bkad/CamelCaseMotion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'  " auto-surround for delimiters

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'

" Plug 'SirVer/ultisnips'
Plug 'lifepillar/vim-mucomplete'

" Plug 'flazz/vim-colorschemes'
Plug 'rakr/vim-one'

" JavaScript
Plug 'mtscout6/syntastic-local-eslint.vim', { 'for': 'javascript' }

" PureScript
Plug 'frigoeu/psc-ide-vim', { 'for': 'purescript' }

" Idris
Plug 'idris-hackers/idris-vim', { 'for': 'idris' }

" Haskell
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }

" Writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'junegunn/limelight.vim', { 'for': ['markdown', 'mkd', 'md', 'tex'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown', 'mkd', 'md' ] }

call plug#end()
filetype plugin indent on

" netrw Setup {{{
let g:netrw_winsize = -28  " absolute width of netrw window
let g:netrw_banner = 0  " do not display info on the top of window
let g:netrw_liststyle = 1  " tree-view
let g:netrw_sort_sequence = '[\/]$,*'  " sort is affecting only: directories on the top, files below
" }}}

" vim-airline Setup {{{
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" }}}

" vim-gitgutter Setup {{{
let g:gitgutter_map_keys = 0
"}}}

" Syntastic Setup {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_java_checkers = ['javac']
let g:syntastic_javascript_checkers = ['eslint', './node_modules/.bin/eslint']
let g:syntastic_tex_checkers = ['lacheck']
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++ -Wno-pragma-once-outside-header'
" }}}

" indentLine Setup {{{
let g:indentLine_char = '│'
let g:indentLine_concealcursor = 0
let g:indentLine_conceallevel = 1
let g:indentLine_faster = 1
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#3B4048'
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
" }}}

" CamelCaseMotion Setup {{{
map <silent> - <Plug>CamelCaseMotion_e
map <silent> _ <Plug>CamelCaseMotion_b
sunmap -
sunmap _
omap <silent> i- <Plug>CamelCaseMotion_ie
xmap <silent> i- <Plug>CamelCaseMotion_ie
omap <silent> i_ <Plug>CamelCaseMotion_ib
xmap <silent> i_ <Plug>CamelCaseMotion_ib
" }}}
