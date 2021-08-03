" ------------------------------------------------------------------------------
" File:         dict.vim
" Author:       Arthur Xavier <arthur.xavierx@gmail.com>
" Description:  
" License:      GPLv3+
" ------------------------------------------------------------------------------

function! dict#Dict(name)
  return g:dicts_folder . '/' . a:name
endfunction

function! dict#Load(name)
  exe 'setlocal dictionary+=' . dict#Dict(a:name)
endfunction

function! dict#AddEntry(entry, ...)
  let dict = get(a:, 2, &ft)
  let entries = split(a:entry, '\n')
  call writefile(entries, dict#Dict(dict), 'a')
  " call system('sort -u ' . shellescape(dict#Dict(dict)) . ' > ' . shellescape(dict#Dict(dict)))

  if len(entries) == 1
    echo "New entry added to " . dict
  else
    echo len(entries) . " new entries added to " . dict
  endif
endfunction

function! dict#opfunc(type)
  " backup settings that we will change
  let sel_save = &selection
  let cb_save = &clipboard
  " backup the unnamed register, which we will be yanking into
  let reg_save = @@
  " make selection and clipboard work the way we need
  set selection=inclusive clipboard-=unnamed clipboard-=unnamedplus

  if a:type =~ '^.$'
    " if type is 'v', 'V', or '<C-V>' (i.e. 0x16) then reselect the visual region
    silent exe "normal! `<" . a:type . "`>y"
  elseif a:type == 'line'
    " line-based text motion
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    " block-based text motion
    silent exe "normal! `[\<C-V>`]y"
  else
    " char-based text motion
    silent exe "normal! `[v`]y"
  endif

  call dict#AddEntry(@@)

  " restore saved settings and register value
  let @@ = reg_save
  let &selection = sel_save
  let &clipboard = cb_save
endfunction
