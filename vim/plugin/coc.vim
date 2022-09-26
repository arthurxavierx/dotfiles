nmap <silent> [k <Plug>(coc-diagnostic-prev)
nmap <silent> ]k <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gp :<C-U>call CocAction('jumpDefinition', 'pedit')<CR><C-W>P
nmap <silent> <localleader>t :call CocActionAsync('doHover')<CR>
nmap <silent> <localleader>f <Plug>(coc-references)
nmap <silent> <localleader>m <Plug>(coc-implementation)
nmap <localleader>r <Plug>(coc-rename)
nmap <localleader>s <Plug>(coc-fix-current)
