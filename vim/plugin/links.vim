let s:link_regex = '\[\[[^\]]\+\]\]'

function! s:next_link()
  if (search(s:link_regex, 's'))
    silent! normal zoll
  endif
endfunction!

function! s:prev_link()
  if (search(s:link_regex, 'szb'))
    silent! normal zoll
  endif
endfunction!

autocmd Syntax * exec 'syn match Underlined /' . s:link_regex . '/hs=s+2,he=e-2 containedin=.*Comment.*'
nnoremap <silent> <Plug>(NextLink) :call <SID>next_link()<CR>
nnoremap <silent> <Plug>(PrevLink) :call <SID>prev_link()<CR>
