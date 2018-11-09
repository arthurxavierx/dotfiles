setlocal omnifunc=OmniSharp#Complete

nmap <buffer> <leader><leader>t :OmniSharpTypeLookup<CR>
nmap <buffer> <leader><leader>s :OmniSharpFixIssues<CR>
nmap <buffer> <leader><leader>r :OmniSharpRename<CR>
nmap <buffer> <leader><leader>d :OmniSharpDocumentation<CR>

nmap <buffer> <leader><leader>fi :OmniSharpFindImplementations<CR>
nmap <buffer> <leader><leader>fm :OmniSharpFindMembers<CR>
nmap <buffer> <leader><leader>fs :OmniSharpFindSymbol<CR>
nmap <buffer> <leader><leader>ft :OmniSharpFindType<CR>
nmap <buffer> <leader><leader>fu :OmniSharpFindUsages<CR>

au BufWritePost *.cs call OmniSharp#BuildAsync()
