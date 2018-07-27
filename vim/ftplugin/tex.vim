let g:pencil#cursorwrap = 0
call pencil#init({ 'wrap': 'soft' })

set conceallevel=1

" Treat softly wrapped lines normally
sil! nun <buffer> $
sil! nun <buffer> 0
sil! vu  <buffer> $
sil! vu  <buffer> 0
sil! nun <buffer> j
sil! nun <buffer> k
sil! vu  <buffer> j
sil! vu  <buffer> k

setlocal foldmethod=syntax
" fold region for headings
syn region myMkdHeaderFold
  \ start="\v^\s*\z(\#{2,6})"
  \ skip="\v(\n\s*\z1\#)\@="
  \ end="\v\n(\s*\#)\@="ms=s-1,me=s
  \ fold contains=TOP
syn sync fromstart
