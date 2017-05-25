let g:psc_ide_syntastic_mode = 1
augroup PureScript
  au!
  au FileType qf setlocal wrap
  au FileType purescript nmap <leader>pt :PSCIDEtype<CR>
  au FileType purescript nmap <leader>ps :PSCIDEapplySuggestion<CR>
  au FileType purescript nmap <leader>pa :PSCIDEaddTypeAnnotation<CR>
  au FileType purescript nmap <leader>pi :PSCIDEimportIdentifier<CR>
  au FileType purescript nmap <leader>pl :PSCIDElistImports<CR>
  au FileType purescript nmap <leader>pc :PSCIDEcaseSplit<CR>
  au FileType purescript nmap <leader>pp :PSCIDEpursuitLookup<space>
  au FileType purescript nmap <leader>pg :PSCIDEgoToDefinition<CR>

  au FileType purescript command! -nargs=1 -bar PSCIDEpursuitLookup
    \ call PSCIDEpursuitLookup('<args>')
augroup END

function! PSCIDEpursuitLookup(text)
  put=a:text
  call PSCIDEpursuit()
  exec 'u'
endfunction
