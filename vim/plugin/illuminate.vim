let g:Illuminate_delay = 500

hi illuminatedWord cterm=underline gui=underline

augroup illuminate_custom
  autocmd!
  autocmd WinEnter * call illuminate#on_cursor_moved()
augroup END
