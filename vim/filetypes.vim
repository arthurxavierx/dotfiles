augroup FiletypeGroup
  au!

  au BufNewFile,BufRead *.md set filetype=markdown
  au BufNewFile,BufRead *.ex set filetype=elixir
  au BufNewFile,BufRead *.tex set filetype=tex
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx

  if has("nvim")
    au TermOpen * setlocal nonumber norelativenumber
  endif
augroup END
