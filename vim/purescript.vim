let g:psc_ide_syntastic_mode = 1
augroup PureScript
  au!
  au FileType qf setlocal wrap
  au FileType purescript nmap <leader>pt :PSCIDEtype<CR>
  au FileType purescript nmap <leader>ps :PSCIDEapplySuggestion<CR>
  au FileType purescript nmap <leader>pa :PSCIDEaddTypeAnnotation<CR>
  au FileType purescript nmap <leader>pi :PSCIDEimportIdentifier<CR>
  au FileType purescript nmap <leader>pc :PSCIDEcaseSplit<CR>
  au FileType purescript nmap <leader>pp :PSCIDEpursuit<CR>
  au FileType purescript nmap <leader>pg :PSCIDEgoToDefinition<CR>
augroup END
