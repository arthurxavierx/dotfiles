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

" Text edition
Plug 'bkad/CamelCaseMotion'
Plug 'terryma/vim-expand-region'
Plug 'michaeljsmith/vim-indent-object'
Plug 'ddollar/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'Raimondi/delimitMate'
Plug 'haya14busa/incsearch.vim'

" Snippets
Plug 'SirVer/ultisnips'

" Supertab
Plug 'ervandew/supertab'

" vim-airline
Plug 'vim-airline/vim-airline'

" colorschemes
Plug 'rakr/vim-one'

" syntastic
Plug 'scrooloose/syntastic'

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mtscout6/syntastic-local-eslint.vim', { 'for': 'javascript' }

" PureScript
Plug 'raichoo/purescript-vim', { 'for': 'purescript' }
Plug 'frigoeu/psc-ide-vim', { 'for': 'purescript' }

" Elm
Plug 'ElmCast/elm-vim', { 'for': 'elm' }

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }

" Unity
" Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
" Plug 'OrangeT/vim-csharp', { 'for': 'cs' }
" Plug 'vim-scripts/ShaderHighLight'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil', { 'for': ['markdown', 'mkd', 'md', 'tex'] }
Plug 'junegunn/limelight.vim', { 'for': ['markdown', 'mkd', 'md', 'tex'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown', 'mkd', 'md' ] }

call plug#end()
filetype plugin indent on

" netrw Setup {{{
let g:netrw_winsize = -28  " absolute width of netrw window
let g:netrw_banner = 0  " do not display info on the top of window
let g:netrw_liststyle = 3  " tree-view
let g:netrw_sort_sequence = '[\/]$,*'  " sort is affecting only: directories on the top, files below
let g:netrw_browse_split = 4  " use the previous window to open file
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
" let g:syntastic_purescript_checkers = ['pscide']
let g:syntastic_tex_checkers = ['lacheck']
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

" Supertab Setup {{{
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

let g:SuperTabContextTextOmniPrecedence = ['&completefunc', '&omnifunc']

let g:SuperTabLongestHighlight = 1
let g:SuperTabLongestEnhanced = 1

au FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-n>") |
  \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
  \ endif
" }}}

" vim-expand-region Setup {{{
let g:expand_region_text_objects = {
  \ 'i-' : 0,
  \ 'iw' : 0,
  \ 'aw' : 0,
  \ 'iW' : 0,
  \ 'aW' : 0,
  \ 'i"' : 0,
  \ 'i''': 0,
  \ 'i]' : 1,
  \ 'ib' : 1,
  \ 'iB' : 1,
  \ 'ip' : 0,
  \ 'ap' : 0,
  \ }
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
