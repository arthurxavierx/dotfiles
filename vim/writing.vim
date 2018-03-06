let g:pencil#cursorwrap = 0

augroup pencil
  au!
  au FileType markdown,mkd call s:WritingMode(0)
  au FileType tex          call s:WritingMode(1)

  au User GoyoEnter Limelight
  au User GoyoLeave Limelight!
  au User GoyoEnter call ToggleRelativeNumber()
  au User GoyoLeave call ToggleRelativeNumber()
augroup END

" fold region for headings
au FileType markdown syn region myMkdHeaderFold
  \ start="\v^\s*\z(\#{2,6})"
  \ skip="\v(\n\s*\z1\#)\@="
  \ end="\v\n(\s*\#)\@="ms=s-1,me=s
  \ fold contains=TOP

au FileType markdown syn sync fromstart
au FileType markdown setlocal foldmethod=syntax

let g:LatexBox_no_mappings = 1

fun! s:WritingMode(conceal)
  call pencil#init({'wrap': 'soft'})
  call s:UnmapPencilLines()
  set foldmethod=marker

  if a:conceal
    set conceallevel=1
    exec 'IndentLinesDisable'
    hi Conceal guifg=white
  endif
endf

fun! s:UnmapPencilLines()
  sil! nun <buffer> $
  sil! nun <buffer> 0
  sil! vu  <buffer> $
  sil! vu  <buffer> 0

  sil! nun <buffer> j
  sil! nun <buffer> k
  sil! vu  <buffer> j
  sil! vu  <buffer> k
endf
