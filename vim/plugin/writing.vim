" Goyo {{{
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
" }}}

" Limelight {{{
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = '#494b53'

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 2

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
" }}}
