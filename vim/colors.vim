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
