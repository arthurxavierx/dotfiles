function! s:Kwbd(unsafe)
  if (!a:unsafe && &mod)
    echohl ErrorMsg
    echo 'E37: No write since last change'
    echo 'E162: No write since last change for buffer "'.bufname("%").'"'
    echohl None
  else
    Kwbd
  endif
endfunction

command! Q  call <SID>Kwbd(<q-bang>)
command! WQ w | Kwbd
