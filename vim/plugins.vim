" Automatic installation {{{
if empty(glob('~/.vim/autoload/plug.vim')) && empty(glob('~/vimfiles/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall
endif
" }}}

call plug#begin()

Plug 'ddollar/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/vimproc.vim'

" tagbar
Plug 'majutsushi/tagbar'

" nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorschemes
Plug 'rakr/vim-one'
Plug 'reedes/vim-colors-pencil', { 'for': ['markdown', 'mkd', 'md', 'tex'] }

" syntastic
Plug 'scrooloose/syntastic'

" deoplete
if has("nvim")
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" neocomplete
else
  Plug 'Shougo/neocomplete.vim'
endif

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mtscout6/syntastic-local-eslint.vim', { 'for': 'javascript' }

" PureScript
Plug 'raichoo/purescript-vim', { 'for': 'purescript' }
Plug 'frigoeu/psc-ide-vim', { 'for': 'purescript' }

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

" Writing
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'mkd', 'md', 'tex'] }
Plug 'reedes/vim-pencil', { 'for': ['markdown', 'mkd', 'md', 'tex'] }
Plug 'junegunn/limelight.vim', { 'for': ['markdown', 'mkd', 'md', 'tex'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown', 'mkd', 'md' ] }

call plug#end()
filetype plugin indent on

" vim-airline Setup {{{
set laststatus=2
let g:airline_powerline_fonts = 1
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

" Tagbar Setup {{{
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autofocus = 1
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
" }}}

" indentLine Setup {{{
let g:indentLine_char = '│'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#3B4048'
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_conceallevel = 1
" }}}

" CtrlP Setup {{{
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_working_path_mode = 0
" }}}

" Supertab Setup {{{
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}
