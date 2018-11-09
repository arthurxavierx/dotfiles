augroup DimInactive
  autocmd!
  autocmd WinEnter * call s:DimInactive(1)
  autocmd WinLeave * call s:DimInactive(0)
augroup END

function! s:DimInactive(t) abort
  if !a:t || (exists("g:goyo") && g:goyo)
    set nocursorline nocursorcolumn colorcolumn=0
  else
    set cursorline cursorcolumn colorcolumn=80
  endif
endfunction
