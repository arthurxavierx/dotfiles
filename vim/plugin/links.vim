let s:link_regex = '\[\[[^\]]\+\]\]'

function! s:next_link()
  call search(s:link_regex, 's')
  silent! normal zoll
endfunction!

function! s:prev_link()
  call search(s:link_regex, 'szb')
  silent! normal zoll
endfunction!

autocmd Syntax * exec 'syn match Underlined /' . s:link_regex . '/hs=s+2,he=e-2 containedin=.*Comment.*'
nnoremap <silent> <Plug>(NextLink) :call <SID>next_link()<CR>
nnoremap <silent> <Plug>(PrevLink) :call <SID>prev_link()<CR>
