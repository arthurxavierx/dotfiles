" Automatic installation {{{
if empty(glob('~/.vim/autoload/plug.vim')) && empty(glob('~/vimfiles/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
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
Plug 'ddollar/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
Plug 'editorconfig/editorconfig-vim'

" UltiSnips
Plug 'SirVer/ultisnips'

" nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" vim-airline
Plug 'vim-airline/vim-airline'

" colorschemes
Plug 'rakr/vim-one'

" syntastic
Plug 'scrooloose/syntastic'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mtscout6/syntastic-local-eslint.vim', { 'for': 'javascript' }

" PureScript
Plug 'raichoo/purescript-vim', { 'for': 'purescript' }
Plug 'frigoeu/psc-ide-vim', { 'for': 'purescript' }

" Elm
Plug 'ElmCast/elm-vim', { 'for': 'elm' }

" C#
Plug 'OmniSharp/omnisharp-vim', { 'for': 'cs' }
Plug 'OrangeT/vim-csharp', { 'for': 'cs' }

" Shaders
Plug 'vim-scripts/ShaderHighLight'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil', { 'for': ['markdown', 'mkd', 'md', 'tex'] }
Plug 'junegunn/limelight.vim', { 'for': ['markdown', 'mkd', 'md', 'tex'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown', 'mkd', 'md' ] }

call plug#end()
filetype plugin indent on

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
let g:syntastic_purescript_checkers = ['pscide']
let g:syntastic_tex_checkers = ['lacheck']
" }}}

" NERDTree Setup {{{
let NERDTreeShowHidden = 1
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "~",
  \ "Staged"    : "+",
  \ "Untracked" : "*",
  \ "Renamed"   : "r",
  \ "Unmerged"  : "^",
  \ "Deleted"   : "-",
  \ "Dirty"     : "~",
  \ "Clean"     : "✔︎",
  \ "Unknown"   : "?"
  \ }
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore = ['\.meta$', '\.DS_Store$', '\.git$']
" }}}

" indentLine Setup {{{
let g:indentLine_char = '│'
let g:indentLine_concealcursor = 0
let g:indentLine_faster = 1

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#3B4048'
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
" }}}

" CtrlP Setup {{{
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_working_path_mode = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.meta
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

" UltiSnips Setup {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"
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
