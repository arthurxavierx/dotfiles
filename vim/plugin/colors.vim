set t_8f=u;%lu;%lum
set t_8b=u;%lu;%lum

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if has("termguicolors")
  set termguicolors
endif

let g:one_allow_italics = 1
set background=dark
colorscheme one
let g:airline_theme='one'

" fix vim-one colors in 256 color Vim
hi Normal guifg=#ABB2BF ctermfg=145 guibg=#282C34 ctermbg=NONE

hi CursorLine guibg=#2C323C ctermbg=236
hi CursorColumn guibg=#2C323C ctermbg=236
hi ColorColumn guibg=#2C323C ctermbg=236