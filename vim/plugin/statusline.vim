" ------------------------------------------------------------------------------
" File:         statusline.vim
" Author:       Arthur Xavier <arthur.xavierx@gmail.com>
" Description:  Minimalistic statusline that shows an icon for the current mode,
"               the file path, and the current column.
" License:      GLPv3+
" ------------------------------------------------------------------------------

set noshowmode
set laststatus=2

set fillchars+=stl:\ ,stlnc:-
set statusline=%!StatusLine()

function! StatusLine()
  let _ = ''
  let bufnr = bufnr('%')
  if has('nvim')
    let _ .= '%=%-{g:modestring[mode()]}%=%<%{StatusLineFilePath()}%='
    let _ .= buflisted(bufnr) ? '%c' : ''
    let _ .= '%='
  else
    let _ .= '%022{g:modestring[mode()]}                %<%{StatusLineFilePath()}%='
    let _ .= buflisted(bufnr) ? '%c' : ''
    let _ .= ' %='
  endif
  return _
endfunction

function! StatusLineFilePath()
  let path = expand('%:~:.')
  if buflisted(bufnr('%'))
    return (path == '' ? '[No Name]' : lib#ShortenPath(path)) . (getbufvar(bufnr('%'), '&mod') ? '*' : ' ')
  else
    return ''
  endif
endfunction

let g:modestring =
  \ { "n"      : "     "
  \ , "r?"     : "?    "
  \ , "no"     : "◯   "
  \ , "v"      : "✄   "
  \ , "V"      : "✄  —"
  \ , "\<C-V>" : "✄  ☐"
  \ , "s"      : "♢   "
  \ , "S"      : "♢  —"
  \ , "\<C-S>" : "♢  ☐"
  \ , "i"      : "✎   "
  \ , "R"      : "⟲   "
  \ , "Rv"     : "✄  ⟲"
  \ , "c"      : "♒︎  "
  \ , "r"      : "◼︎   "
  \ , "rm"     : "✚   "
  \ , "!"      : "∑   "
  \ , "t"      : "♒︎  "
  \ }
