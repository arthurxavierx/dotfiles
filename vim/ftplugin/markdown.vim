let g:pencil#cursorwrap = 0
call pencil#init({ 'wrap': 'soft' })

set conceallevel=2

" Treat softly wrapped lines normally
sil! nun <buffer> $
sil! nun <buffer> 0
sil! vu  <buffer> $
sil! vu  <buffer> 0
sil! nun <buffer> j
sil! nun <buffer> k
sil! vu  <buffer> j
sil! vu  <buffer> k
