au BufNewFile,BufRead * if expand('%:~') =~# '/irc/' && expand('%:t') == 'out' | set filetype=irc | endif
