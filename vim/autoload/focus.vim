" ------------------------------------------------------------------------------
" File:         focus.vim
" Author:       Arthur Xavier <arthur.xavierx@gmail.com>
" Description:  Focus mode for coding in Vim.
"               Inspired by https://github.com/bilalq/lite-dfm.
" License:      GPLv3+
" ------------------------------------------------------------------------------

let s:cpo_save = &cpo
set cpo&vim

let g:focused = 0
let g:focus_ignoredWindows = ['gundo', 'nerdtree', 'tagbar']
let s:context = (has('gui_running') || &termguicolors) ? 'gui' : 'cterm'

" Preamble {{{

" Calculate needed values for 'foldcolumn' and 'numberwidth' in order to achieve
" the given margin.
function! s:CalculateOffsets(margin)
  let offset = a:margin < 1 || a:margin > 22 ? 22 : a:margin
  if offset <= 12
    return { 'foldcolumn': offset - &numberwidth, 'numberwidth': &numberwidth }
  else
    return { 'foldcolumn': 12, 'numberwidth': offset - 12 }
  endif
endfunction

" Hide a highlight group by applying 'Normal's background color to it.
function! s:Hide(group)
  call s:Highlight(a:group, s:colors['Normal'].bg, s:colors['Normal'].bg)
endfunction

function! s:Highlight(group, fg, bg)
  exe 'hi ' . a:group . ' ' . s:context . 'fg=' . a:fg . ' ' . s:context . 'bg=' . a:bg
endfunction

" Returns foreground and background colors associated with the name of a
" highlight group.
function! s:GetColors(group)
  let id = hlID(a:group)
  return { 'fg': synIDattr(id, 'fg'), 'bg': synIDattr(id, 'bg') }
endfunction

" Store the foreground and background colors of the given highlight groups and
" of the 'Normal' group into the s:colors dictionary.
function! s:StoreColors(groups)
  let s:colors = { 'Normal': s:GetColors('Normal') }
  for group in a:groups
    let s:colors[group] = s:GetColors(group)
    call s:Hide(group)
  endfor
endfunction

" Restore the original foreground and background colors of the given
" highlight groups, provided that s:StoreColors(groups) has been run before.
function! s:RestoreColors(groups)
  for group in a:groups
    call s:Highlight(group, s:colors[group].fg, s:colors[group].bg)
  endfor
endfunction

function! s:ApplyMargins()
  " Apply right margin.
  " Right margin is not applied in NeoVim because resizing the screen does not
  " clear outside the screen area, leaving glitches/corrupted text behind.
  if !has('nvim')
    let &columns = s:settings.columns - (s:offsets.foldcolumn + s:offsets.numberwidth)
  endif

  " Apply left margin.
  let &numberwidth = s:offsets.numberwidth
  let &foldcolumn = s:offsets.foldcolumn
endfunction!

" }}}

" Exit focus mode by restoring global settings, original margins and colors, and
" by closing the new tab.
function! focus#exit()
  let g:focused = 0

  " Restore global settings.
  let &columns = s:settings.columns
  let &showtabline = s:settings.showtabline
  let &tabline = s:settings.tabline
  let &statusline = s:settings.statusline
  let &guioptions = s:settings.guioptions
  let &ruler = get(s:, 'settings.ruler', 0)

  " Save current window: 'viewoptions', scroll and cursor positions, and folds.
  let bufnr = bufnr('%')
  exe 'mkview'
  " Close the current, new tab.
  exe 'tabclose ' . s:settings.tabnew
  " Return to the tab that was open before entering focus mode.
  exe 'normal ' . s:settings.tabpagenr . 'gt'
  exe 'normal ' . bufnr . 'b'
  " Restore window data in the old tab.
  silent! exe 'loadview'

  " Restore margins.
  let &numberwidth = s:settings.numberwidth
  let &foldcolumn = s:settings.foldcolumn

  " Restore hidden color groups
  let hide_groups = exists('g:focus_hide_groups') ? g:focus_hide_groups : ['FoldColumn']
  call s:RestoreColors(hide_groups)

  if exists('#User#FocusLeave')
    doautocmd User FocusLeave
  endif
endfunction

" Toggle focus mode by creating a new tab with a single
" window, and using 'foldcolumn' and 'numberwidth' as left margin, and
" 'columns' as right margin.
"
" In focus mode, the ruler and scrollbar are hidden, and the tabline is empty
" in order to create a top margin.
function! focus#toggle(margin)
  if g:focused
    return focus#exit()
  endif

  let g:focused = 1

  " Store global settings.
  let s:settings =
    \ { 'columns':       &columns
    \ , 'foldcolumn':    &foldcolumn
    \ , 'numberwidth':   &numberwidth
    \ , 'showtabline':   &showtabline
    \ , 'tabline':       &tabline
    \ , 'statusline':    &statusline
    \ , 'guioptions':    &guioptions
    \ , 'ruler':         &ruler
    \ , 'tabpagenr':     tabpagenr()
    \ }

  let s:offsets = s:CalculateOffsets(a:margin)

  " Show empty tabline for a top margin.
  set showtabline=2 tabline=%#FoldColumn#%=\ %=
  " Hide ruler and scrollbar.
  set noruler guioptions-=r

  " Save current window: 'viewoptions', scroll and cursor positions, and folds.
  exe 'mkview'
  " Create a new tab out of the current window.
  exe 'tabedit %'
  let s:settings.tabnew = tabpagenr()
  " Restore window data in the new tab.
  silent! exe 'loadview'

  " Store color groups that will be hidden.
  let hide_groups = exists('g:focus_hide_groups') ? g:focus_hide_groups : ['FoldColumn']
  call s:StoreColors(hide_groups)

  if exists('#User#FocusEnter')
    doautocmd User FocusEnter
  endif

  call s:ApplyMargins()
endfunction

" Apply left margin on every buffer change when inside focus mode.
augroup Focus_LeftMargin
  autocmd!
  autocmd TabEnter * if g:focused | call s:ApplyMargins() | endif
  autocmd BufWinEnter * if g:focused | call s:ApplyMargins() | endif
augroup END

let &cpo = s:cpo_save
unlet s:cpo_save
