setl wrap

nnoremap <silent><buffer> <CR> :call <SID>SendMessage(1)<CR>
inoremap <silent><buffer> <CR> <C-o>:call <SID>SendMessage(1)<CR>

au BufLeave <buffer> silent! exe 'close'
au InsertLeave <buffer> silent! call <SID>CloseIfEmpty()
au TextChanged <buffer> silent! call <SID>CloseIfEmpty()

function! s:CloseIfEmpty()
  if line('$') == 1 && getline(1) == ''
    exe 'close'
  endif
endfunction

function! s:SendMessage(close)
  if !exists('b:filename')
    exe 'bdelete %'
    return
  endif

  exe 'w >> ' . escape(b:filename, ' #\')

  if a:close
    exe 'close'
  else
    exe '1,$delete'
    startinsert!
  endif
endfunction
