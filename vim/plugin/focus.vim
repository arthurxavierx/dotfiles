" ------------------------------------------------------------------------------
" File:         focus.vim
" Author:       Arthur Xavier <arthur.xavierx@gmail.com>
" Description:  Focus mode for coding in Vim.
"               Inspired by https://github.com/bilalq/lite-dfm.
" License:      GLPv3+
" ------------------------------------------------------------------------------

command! -nargs=? -bar Focus call focus#toggle(<q-args>)

augroup Focus
  autocmd!
  autocmd User FocusEnter nested call <SID>FocusEnter()
  autocmd User FocusLeave nested call <SID>FocusLeave()
  autocmd VimLeave nested silent !tmux set status on
  autocmd BufWinEnter * if exists('g:focused') && !g:focused | set foldcolumn=0 numberwidth=4 | endif
augroup END

function! s:FocusEnter()
  set noshowmode
  silent! exe '!tmux set status off'
  if has('nvim')
    set statusline=%=\ \ \ \ \ %-{g:modestring[mode()]}%=
  else
    set statusline=%042{g:modestring[mode()]}
  endif
endfunction

function! s:FocusLeave()
  set noshowmode
  silent! exe '!tmux set status on'
endfunction
