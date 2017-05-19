augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
  autocmd FileType markdown,mkd set foldmethod=marker
  autocmd FileType tex          call pencil#init({'wrap': 'soft'})
  autocmd FileType tex          set conceallevel=0
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END

" fold region for headings
au FileType markdown syn region myMkdHeaderFold
  \ start="\v^\s*\z(\#{2,6})"
  \ skip="\v(\n\s*\z1\#)\@="
  \ end="\v\n(\s*\#)\@="ms=s-1,me=s
  \ fold contains=TOP

au FileType markdown syn sync fromstart
au FileType markdown setlocal foldmethod=syntax
