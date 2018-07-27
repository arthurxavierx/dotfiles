let g:psc_ide_syntastic_mode = 1

" Redefine default indentation rules to some sane values
let g:purescript_indent_if = 2
let g:purescript_indent_case = 2
let g:purescript_indent_let = 0
let g:purescript_indent_in = 0
let g:purescript_indent_where = 2
let g:purescript_indent_do = 2

nmap <buffer> <silent> <leader>pt :<C-U>call PSCIDEtype(PSCIDEgetKeyword(), v:true)<CR>
nmap <buffer> <silent> <leader>pT :<C-U>call PSCIDEaddTypeAnnotation(matchstr(getline(line(".")), '^\s*\zs\k\+\ze'))<CR>
nmap <buffer> <silent> <leader>ps :Papply<CR>
nmap <buffer> <silent> <leader>pa :<C-U>call PSCIDEaddTypeAnnotation()<CR>
nmap <buffer> <silent> <leader>pi :<C-U>call PSCIDEimportIdentifier(PSCIDEgetKeyword())<CR>
nmap <buffer> <silent> <leader>pr :<C-U>call PSCIDEload()<CR>
nmap <buffer>          <leader>pf :Pursuit<space>
nmap <buffer> <silent> <leader>pF :<C-U>call PSCIDEpursuit(PSCIDEgetKeyword())<CR>
nmap <buffer> <silent> <leader>pC :<C-U>call PSCIDEcaseSplit("!")<CR>
nmap <buffer> <silent> <leader>pc :<C-U>call PSCIDEaddClause("")<CR>
nmap <buffer> <silent> <leader>pq :<C-U>call PSCIDEaddImportQualifications()<CR>
nmap <buffer> <silent> ]d         :<C-U>call PSCIDEgoToDefinition("", PSCIDEgetKeyword())<CR>
