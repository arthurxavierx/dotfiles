" Temporarily disables wildignore for :gf
function! s:Gf()
  let wig = &wig
  set wig=
  normal gf
  let &wig = wig
endfunction
command! Gf call s:Gf()
