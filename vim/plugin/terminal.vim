if has('nvim')
  augroup terminal
    autocmd!
    autocmd VimEnter * call lib#SplitWithoutNesting()
    autocmd TermOpen,BufWinEnter * call lib#SetNumberDisplay()
  augroup END
endif
