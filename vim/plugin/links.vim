" ------------------------------------------------------------------------------
" File:         links.vim
" Author:       Arthur Xavier <arthur.xavierx@gmail.com>
" Description:
" License:      GPLv3+
" ------------------------------------------------------------------------------

let s:link_start = '\[\['
let s:link_end = '\]\]'
let s:link_regex = s:link_start . '.\+' . s:link_end

let s:link_containedin = ['mkdBlockquote']

function! s:next_link()
  if (search(s:link_regex, 's'))
    silent! normal zoll
  endif
endfunction!

function! s:prev_link()
  if (search(s:link_regex, 'szb'))
    silent! normal zoll
  endif
endfunction!

autocmd Syntax * exec
      \ 'syn region Underlined matchgroup=Comment excludenl keepend'
      \ . ' start=/' . s:link_start .  '/ end=/\%($\|' . s:link_end . '\)/'
      \ . ' concealends contained containedin=' . join(['.*Comment.*'] + s:link_containedin, ',')
nnoremap <silent> <Plug>(NextLink) :call <SID>next_link()<CR>
nnoremap <silent> <Plug>(PrevLink) :call <SID>prev_link()<CR>
