let g:psc_ide_syntastic_mode = 1
augroup CSharp
  au!
  au FileType cs nmap <leader>pt :OmniSharpTypeLookup<CR>
  au FileType cs nmap <leader>ps :OmniSharpFixIssues<CR>
  au FileType cs nmap <leader>pr :OmniSharpRename<CR>

  au FileType cs nmap <leader>pfi :OmniSharpFindImplementations<CR>
  au FileType cs nmap <leader>pfm :OmniSharpFindMembers<CR>
  au FileType cs nmap <leader>pfs :OmniSharpFindSymbol<CR>
  au FileType cs nmap <leader>pft :OmniSharpFindType<CR>
  au FileType cs nmap <leader>pfu :OmniSharpFindUsages<CR>

  au BufWritePost *.cs call OmniSharp#BuildAsync()
augroup END
