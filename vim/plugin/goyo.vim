let g:goyo = 0

function! s:goyo_enter()
  set noshowmode
  set nocursorcolumn nocursorline
  set scrolloff=999
  Limelight
  let g:goyo = 1
endfunction

function! s:goyo_leave()
  set showmode
  set cursorcolumn cursorline
  set scrolloff=5
  Limelight!
  let g:goyo = 0
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
