let g:psc_ide_syntastic_mode = 1
let g:psc_ide_import_on_completion = 0

" Redefine default indentation rules to some sane values
let g:purescript_indent_if = 2
let g:purescript_indent_case = 2
let g:purescript_indent_let = 0
let g:purescript_indent_in = 0
let g:purescript_indent_where = 2
let g:purescript_indent_do = 2

nmap <buffer> <silent> <localleader>t :<C-U>call PSCIDEtype(PSCIDEgetKeyword(), v:true)<CR>
nmap <buffer> <silent> <localleader>T :<C-U>call PSCIDEaddTypeAnnotation(matchstr(getline(line(".")), '^\s*\zs\k\+\ze'))<CR>
nmap <buffer> <silent> <localleader>s :Papply<CR>
nmap <buffer> <silent> <localleader>a :<C-U>call PSCIDEaddTypeAnnotation()<CR>
nmap <buffer> <silent> <localleader>i :<C-U>call PSCIDEimportIdentifier(PSCIDEgetKeyword())<CR>
nmap <buffer> <silent> <localleader>r :<C-U>call PSCIDEload()<CR>
nmap <buffer>          <localleader>f :Pursuit<space>
nmap <buffer> <silent> <localleader>F :<C-U>call PSCIDEpursuit(PSCIDEgetKeyword())<CR>
nmap <buffer> <silent> <localleader>C :<C-U>call PSCIDEcaseSplit("!")<CR>
nmap <buffer> <silent> <localleader>c :<C-U>call PSCIDEaddClause("")<CR>
nmap <buffer> <silent> <localleader>q :<C-U>call PSCIDEaddImportQualifications()<CR>

nmap <buffer> <silent> ]d :<C-U>call PSCIDEgoToDefinition("", PSCIDEgetKeyword())<CR>
