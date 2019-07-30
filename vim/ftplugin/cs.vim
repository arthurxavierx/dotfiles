setlocal omnifunc=OmniSharp#Complete

let g:ale_linters.cs = ['OmniSharp']

nmap <buffer> <localleader>t :OmniSharpTypeLookup<CR>
nmap <buffer> <localleader>s :OmniSharpFixIssues<CR>
nmap <buffer> <localleader>r :OmniSharpRename<CR>
nmap <buffer> <localleader>d :OmniSharpDocumentation<CR>

nmap <buffer> <localleader>fi :OmniSharpFindImplementations<CR>
nmap <buffer> <localleader>fm :OmniSharpFindMembers<CR>
nmap <buffer> <localleader>fs :OmniSharpFindSymbol<CR>
nmap <buffer> <localleader>ft :OmniSharpFindType<CR>
nmap <buffer> <localleader>fu :OmniSharpFindUsages<CR>

" au BufWritePost *.cs call OmniSharp#BuildAsync()
