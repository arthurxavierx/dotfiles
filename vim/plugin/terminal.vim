if has('nvim')
  augroup terminal
    autocmd!
    autocmd VimEnter * call lib#MergeNvimInstances()
    autocmd TermOpen,BufWinEnter * call lib#HideNumbersInTerminal()
  augroup END
endif
