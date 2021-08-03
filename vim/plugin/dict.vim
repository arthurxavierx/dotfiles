" ------------------------------------------------------------------------------
" File:         dict.vim
" Author:       Arthur Xavier <arthur.xavierx@gmail.com>
" License:      GPLv3+
" Description:  
" ------------------------------------------------------------------------------

let g:dicts_folder = expand('$DOTFILES/vim/dict')
let g:dicts_auto_load = 1

command! -complete=buffer -nargs=+ DictLoad call dict#Load(<args>)
command! -complete=buffer -nargs=+ DictAdd call dict#AddEntry(<f-args>)

" Load dict files automatically
augroup Dict
  au!
  autocmd FileType * if g:dicts_auto_load | call dict#Load(&ft) | endif
augroup END

nnoremap <silent> <Plug>DictAdd :set opfunc=dict#opfunc<CR>g@
xnoremap <silent> <Plug>DictAddVisual :<C-u>call dict#opfunc(visualmode())<CR>

if !exists('g:dicts_no_mappings') || !g:dicts_no_mappings
  inoremap <silent> <C-p> <C-o>:call dict#AddEntry(expand('<cword>'))<CR>
  nmap <C-p> <Plug>DictAdd
  xmap <C-p> <Plug>DictAddVisual
endif
