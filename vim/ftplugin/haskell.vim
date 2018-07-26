let g:hlintRefactor#disableDefaultKeybindings = 1
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
let b:ale_linters = {
      \ 'haskell': ['hdevtools', 'hlint', 'stack-build', 'stack-ghc']
      \ }

augroup Haskell
  au!
  au FileType qf setlocal wrap
  au FileType haskell setlocal omnifunc=necoghc#omnifunc

  au FileType haskell nmap <leader>ps :call ApplyOneSuggestion()<CR>
  au FileType haskell nmap <leader>pp :Hoogle<space>
augroup END
