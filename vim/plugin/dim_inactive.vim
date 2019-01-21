augroup DimInactive
  autocmd!
  autocmd WinEnter * if &number | set relativenumber | endif
  autocmd WinLeave * if &relativenumber | set norelativenumber | endif
augroup END
