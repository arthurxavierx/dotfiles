let g:hlintRefactor#disableDefaultKeybindings = 1
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
let b:ale_linters = {
      \ 'haskell': ['ghc', 'hdevtools', 'stack-ghc']
      \ }

augroup Haskell
  au!
  au FileType qf setlocal wrap
  au FileType haskell setlocal omnifunc=necoghc#omnifunc

  au FileType haskell nmap <leader>pt :GhcModType<CR>
  au FileType haskell nnoremap <buffer><silent> <esc> :GhcModTypeClear<CR>:noh<CR><esc>
  au FileType haskell nmap <leader>ps :call ApplyOneSuggestion()<CR>
  au FileType haskell nmap <leader>pa :GhcModSigCodegen<CR>
  au FileType haskell nmap <leader>pc :GhcModSplitFunCase<CR>
  au FileType haskell nmap <leader>pp :Hoogle<space>
  au FileType haskell nmap <leader>pe :GhcModExpand<CR>

  " au BufWritePost *.hs GhcModCheckAndLintAsync
augroup END
