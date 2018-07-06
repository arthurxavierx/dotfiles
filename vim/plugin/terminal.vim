if has('nvim')
  augroup terminal
    autocmd!
    autocmd VimEnter * call lib#SplitWithoutNesting()
    autocmd TermOpen,BufWinEnter * call lib#SetNumberDisplay()
    autocmd TermOpen,BufWinEnter,BufEnter term://* startinsert
  augroup END
endif
