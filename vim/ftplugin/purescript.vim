let g:psc_ide_syntastic_mode = 1
let g:psc_ide_import_on_completion = 0

" Redefine default indentation rules to some sane values
let g:purescript_indent_if = 2
let g:purescript_indent_case = 2
let g:purescript_indent_let = 0
let g:purescript_indent_in = 0
let g:purescript_indent_where = 2
let g:purescript_indent_do = 2

nmap <buffer> <silent> <localleader>t :Ptype<CR>
nmap <buffer> <silent> <localleader>T :PaddType<CR>
nmap <buffer> <silent> <localleader>s :Papply<CR>
nmap <buffer> <silent> <localleader>S :Papply!<CR>
nmap <buffer> <silent> <localleader>i :Pimport<CR>
nmap <buffer> <silent> <localleader>r :Pload!<CR>
nmap <buffer>          <localleader>f :Pursuit<space>
nmap <buffer> <silent> <localleader>F :<C-U>call PSCIDEpursuit(PSCIDEgetKeyword())<CR>
nmap <buffer> <silent> <localleader>C :Pcase!<CR>
nmap <buffer> <silent> <localleader>c :PaddClause<CR>
nmap <buffer> <silent> <localleader>q :PaddImportQualifications<CR>

nmap <buffer> <silent> ]d :Pgoto<CR>
