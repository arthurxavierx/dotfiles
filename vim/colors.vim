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
