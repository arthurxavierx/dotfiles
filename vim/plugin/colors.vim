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
