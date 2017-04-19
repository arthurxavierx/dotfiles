augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
  autocmd FileType markdown,mkd set foldmethod=marker
  autocmd FileType tex          call pencil#init({'wrap': 'soft'})
  autocmd FileType tex          set conceallevel=0
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END
