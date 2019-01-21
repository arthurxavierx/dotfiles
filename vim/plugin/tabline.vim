" ------------------------------------------------------------------------------
" File:         tabline.vim
" Author:       Arthur Xavier <arthur.xavierx@gmail.com>
" Description:  Minimalistic tabline that shows visible buffers and tabs.
" License:      GLPv3+
" ------------------------------------------------------------------------------

" Always show tabline
set showtabline=2

" Don't use GUI tabline
set guioptions-=e

set tabline=%!TabLine()

function! TabLine()
  let _ = ''

  " Buffers {{{
  for i in range(bufnr('$'))
    let bufnr = i + 1
    if !bufexists(bufnr) || !buflisted(bufnr)
      continue
    endif

    let bufname = fnamemodify(bufname(bufnr), ':~:.')
    let bufmod = getbufvar(bufnr, '&mod')

    let _ .= bufnr == bufnr('%') ? '%#TabLineSel#' : '%#TabLine#'
    let _ .= '  '
    let _ .= bufnr
    let _ .= '  '
    let _ .= bufname == '' ? '[No Name]' : lib#ShortenPath(bufname, 22, 2)
    let _ .= bufmod ? '*' : ''
    let _ .= '  '
  endfor
  " }}}

  let _ .= '%#StatusLine#'
  let _ .= '%='

  " Tabs {{{
  for tabpagenr in range(tabpagenr('$'), 1, -1)
    let winnr = tabpagewinnr(tabpagenr)
    let buflist = tabpagebuflist(tabpagenr)
    let bufnr = buflist[winnr - 1]
    let bufname = fnamemodify(bufname(bufnr), ':~:.')
    let bufmod = getbufvar(bufnr, '&mod')
    let _ .= '%' . tabpagenr . 'T'
    let _ .= tabpagenr == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
    let _ .= '  '
    let _ .= tabpagenr
    let _ .= '  '
    let _ .= bufname == '' ? '[No Name]' : lib#ShortenPath(bufname, 22, 2)
    let _ .= bufmod ? '*' : ''
    let _ .= '  '
  endfor
  " }}}

  return _
endfunction
