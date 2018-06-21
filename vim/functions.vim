" Temporarily disables wildignore for :gf
function! s:Gf()
  let wig = &wig
  set wig=
  normal gf
  let &wig = wig
endfunction
command! Gf call s:Gf()

function! s:Unicoder()
  call cursor(line('.'), col('.') - 1)
  let w = expand('<cWORD>')
  let c = unicoder#transform_string(w)
  execute "normal! ciW".c."\<Esc>"
  call cursor(line('.'), col('.') + 1)
endfunction
command! Unicoder call s:Unicoder()
