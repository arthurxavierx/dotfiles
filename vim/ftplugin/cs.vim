setlocal omnifunc=OmniSharp#Complete

nmap <buffer> <leader>pt :OmniSharpTypeLookup<CR>
nmap <buffer> <leader>ps :OmniSharpFixIssues<CR>
nmap <buffer> <leader>pr :OmniSharpRename<CR>
nmap <buffer> <leader>pd :OmniSharpDocumentation<CR>

nmap <buffer> <leader>pfi :OmniSharpFindImplementations<CR>
nmap <buffer> <leader>pfm :OmniSharpFindMembers<CR>
nmap <buffer> <leader>pfs :OmniSharpFindSymbol<CR>
nmap <buffer> <leader>pft :OmniSharpFindType<CR>
nmap <buffer> <leader>pfu :OmniSharpFindUsages<CR>

au BufWritePost *.cs call OmniSharp#BuildAsync()
