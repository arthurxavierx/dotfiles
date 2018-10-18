set t_8f=u;%lu;%lum
set t_8b=u;%lu;%lum

if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  if has("termguicolors")
    set termguicolors
  endif
endif

let g:one_allow_italics = 1
set background=dark
colorscheme one

" fix vim-one colors in 256 color Vim
hi Normal guifg=#ABB2BF ctermfg=145 guibg=NONE ctermbg=NONE

hi CursorLine guibg=#2C323C ctermbg=236
hi CursorColumn guibg=#2C323C ctermbg=236
hi ColorColumn guibg=#2B2F38 ctermbg=236

hi Conceal guifg=#ABB2BF ctermfg=145

hi NonText guifg=#282C34 ctermfg=236
hi VertSplit guifg=#343A47 ctermfg=236
