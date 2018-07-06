let g:pencil#cursorwrap = 0

augroup writing
  au!
  au FileType markdown,mkd call lib#WritingMode(0)
  au FileType tex          call lib#WritingMode(1)

  au User GoyoEnter Limelight
  au User GoyoLeave Limelight!
  au User GoyoEnter call ToggleRelativeNumber()
  au User GoyoLeave call ToggleRelativeNumber()
augroup END
