setl wrap

startinsert
nnoremap <silent><buffer> <CR> :call <SID>SendMessage(1)<CR>
inoremap <silent><buffer> <CR> <C-o>:call <SID>SendMessage(1)<CR>

au BufLeave <buffer> exe 'bdelete %'

function! s:SendMessage(delete)
  if !exists('b:in_file')
    exe 'bdelete %'
    return
  endif

  let message = join(getline(1, '$'), "\n")
  exe 'w >> ' . escape(b:in_file, ' \#')

  if a:delete
    exe 'bdelete %'
  else
    exe '1,$delete'
    startinsert
  endif
endfunction
