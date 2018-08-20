let g:hlintRefactor#disableDefaultKeybindings = 1
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1

if (filereadable("./stack.yaml") == 1)
  let b:ale_linters = {
        \   'haskell': ['hdevtools', 'hlint', 'stack-build']
        \}
else
  let b:ale_linters = {
        \ 'haskell': ['hdevtools', 'hlint', 'stack-build', 'stack-ghc']
        \ }
endif

setlocal omnifunc=necoghc#omnifunc

nmap <buffer> <leader>ps :call ApplyOneSuggestion()<CR>
nmap <buffer> <leader>pp :Hoogle<space>
