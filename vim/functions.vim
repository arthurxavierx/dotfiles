" Perform a vimgrep search, open the quickfix list and jump to the first match.
com! -nargs=+ -complete=file_in_path -bar Vim vim <args> | cw | cfirst

" Perform a vimgrep search over files of same extension under the current
" directory (recursively).
com! -nargs=+ -complete=user -bar Vims  exec "Vim /\\<<args>\\>/g **/*" . (expand("%:e") == "" ? "" : ".".expand("%:e")) | silent! g/<args>/
" [case sensitive version]
com! -nargs=+ -complete=user -bar VimsC exec "Vim /\\C\\<<args>\\>/g **/*" . (expand("%:e") == "" ? "" : ".".expand("%:e")) | silent! g/<args>/

" Temporarily disables wildignore for :gf
function! s:Gf()
  let wig = &wig
  set wig=
  normal gf
  let &wig = wig
endfunction
command! Gf call s:Gf()
