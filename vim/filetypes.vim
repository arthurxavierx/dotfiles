augroup File-Type
  au!

  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber

  au BufNewFile,BufRead *.md set filetype=markdown
  au BufNewFile,BufRead *.ex set filetype=elixir
  au BufNewFile,BufRead *.tex set filetype=tex

  if has("nvim")
    au TermOpen * setlocal nonumber norelativenumber
  endif
augroup END
