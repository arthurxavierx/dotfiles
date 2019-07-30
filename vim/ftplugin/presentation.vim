" ------------------------------------------------------------------------------
" File:         presentation.vim
" Author:       Arthur Xavier <arthur.xavierx@gmail.com>
" Description:
" License:      GPLv3+
" ------------------------------------------------------------------------------

nmap <silent> <buffer> <C-n> zMzjzoztj
nmap <silent> <buffer> <C-p> zMzkzo[zztj

autocmd Syntax * exec
      \ 'syn region presentationSlide transparent matchgroup=Ignore'
      \ . ' start=/{{{/ end=/}}}/ keepend containedin=mkdNonListItemBlock'

hi! link CursorLineNr EndOfBuffer
hi! link LineNr EndOfBuffer
hi! link Folded EndOfBuffer
