set nocompatible

" GENERAL SETTINGS {{{
let mapleader = "\<SPACE>"

syntax enable
filetype on
filetype plugin indent on
set showcmd

set number
set showmatch
set title
set visualbell
set noerrorbells
set nobackup
set noswapfile
set list lcs=trail:·,tab:»»
set foldmethod=marker

set conceallevel=0

set mouse=
if has("termguicolors") && has("nvim")
  set t_8f=u;%lu;%lum
  set t_8b=u;%lu;%lum
  set termguicolors
endif

" spacing
set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set eol
set autoindent
set copyindent
set smarttab

" casing
set hlsearch
set incsearch
set ignorecase
set smartcase

" hidden buffers
set hidden
" }}}

" VIM-PLUG SETUP {{{

" Automatic installation {{{
if empty(glob('~/.vim/autoload/plug.vim')) && empty(glob('~/vimfiles/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall
endif
" }}}

call plug#begin()

" Plugins {{{
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
" }}}

call plug#end()
filetype plugin indent on

" }}}

" COLOR SCHEME {{{
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if has("termguicolors")
  set termguicolors
endif

if has("gui_macvim")
  set macligatures
  set guifont=Fira\ Code:h13
endif

let g:one_allow_italics = 1
set background=dark
if (has("nvim")) || has("termguicolors") || has("gui_macvim")
  colorscheme one
  let g:airline_theme='one'
endif
" }}}

" filetype Setup {{{
augroup File-Type
  au!
  au BufNewFile,BufRead *.ex set filetype=elixir
augroup END
" }}}

" OMNI COMPLETION {{{
filetype plugin on
set omnifunc=syntaxcomplete#Complete
if (has("nvim"))
  call deoplete#custom#set('omni', 'min_pattern_length', 3)
endif

augroup omnicomplete
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END
" }}}

" KEY BINDINGS {{{

nnoremap ; :
nnoremap ç ;
nnoremap \ /
nnoremap <leader>w :w<CR>
nnoremap <C-w>     :bd<CR>

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

map <down> gj
map <up> gk

" Open file
nmap <leader>ew       :e<SPACE>
nmap <leader>ee       :e<SPACE>

" Buffers
nmap <leader>en       :enew<CR>
nmap <leader>r        :CtrlPBuffer<CR>
nnoremap <C-h>        :bprevious<CR>
nnoremap <C-l>        :bnext<CR>

" Open file in new window
nmap <leader>eH       :topleft  vsp<SPACE>
nmap <leader>eL       :botright vsp<SPACE>
nmap <leader>eK       :topleft  sp<SPACE>
nmap <leader>eJ       :botright sp<SPACE>

nmap <leader>eh       :leftabove  vsp<SPACE>
nmap <leader>el       :rightbelow vsp<SPACE>
nmap <leader>ek       :leftabove  sp<SPACE>
nmap <leader>ej       :rightbelow sp<SPACE>

" New split window
nmap <leader>sH       :topleft  vsp<CR>
nmap <leader>sL       :botright vsp<CR>
nmap <leader>sK       :topleft  sp<CR>
nmap <leader>sJ       :botright sp<CR>

nmap <leader>sh       :leftabove  vsp<CR>
nmap <leader>sl       :rightbelow vsp<CR>
nmap <leader>sk       :leftabove  sp<CR>
nmap <leader>sj       :rightbelow sp<CR>

" Window navigation
nnoremap <leader>h     <C-w>h
nnoremap <leader>l     <C-w>l
nnoremap <leader>k     <C-w>k
nnoremap <leader>j     <C-w>j

" Window resize
nnoremap <silent> <S-up>     :resize +10<CR>
nnoremap <silent> <S-down>   :resize -10<CR>
nnoremap <silent> <S-right>  :vertical resize +10<CR>
nnoremap <silent> <S-left>   :vertical resize -10<CR>

" Terminal mode
if (has("nvim"))
  tnoremap <Esc>         <C-\><C-n>
  tnoremap <C-h>         <C-\><C-n>:bprevious<CR>
  tnoremap <C-l>         <C-\><C-n>:bnext<CR>
endif
" }}}

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

" deoplete Setup {{{
if (has("nvim"))
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_start_length = 3
  let g:deoplete#delimiters = ['/', '.', '::', ':', '#', '->']
  let g:deoplete#sources = {}
  let g:deoplete#sources._ = ['omni', 'buffer', 'member', 'tag', 'file']
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  let g:deoplete#omni#input_patterns.purescript = 'import\s+\w*|[^. *\t]'
  let g:deoplete#omni_patterns = {}
  " set completeopt=longest,menuone
  set completeopt=menuone
  set pumheight=5
  let g:deoplete#max_menu_width = 60
endif
" }}}

" neocomplete Setup {{{
if (!has("nvim"))
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.purescript = 'import\s+\w*|[^. *\t]'
endif
" }}}

" Tagbar Setup {{{
noremap <leader>] :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autofocus = 1
" }}}

" NERDTree Setup {{{
noremap <leader>\ :NERDTreeToggle<CR>
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
nnoremap <leader>t :CtrlP<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_working_path_mode = 0
" }}}

" Supertab Setup {{{
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}

" PureScript Setup {{{
let g:psc_ide_syntastic_mode = 1
augroup PureScript
  au!
  au FileType qf setlocal wrap
  au FileType purescript nmap <leader>pt :PSCIDEtype<CR>
  au FileType purescript nmap <leader>ps :PSCIDEapplySuggestion<CR>
  au FileType purescript nmap <leader>pa :PSCIDEaddClause<CR>
  au FileType purescript nmap <leader>pi :PSCIDEimportIdentifier<CR>
  au FileType purescript nmap <leader>pc :PSCIDEcaseSplit<CR>
  au FileType purescript nmap <leader>pp :PSCIDEpursuit<CR>
augroup END
" }}}

" Writing Setup {{{
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
  autocmd FileType tex          call pencil#init({'wrap': 'soft'})
  autocmd FileType tex          set conceallevel=0
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END
" }}}
