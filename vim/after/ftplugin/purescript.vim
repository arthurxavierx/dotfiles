let g:psc_ide_syntastic_mode = 1
augroup purescript
  au!
  au FileType qf setlocal wrap
  au FileType purescript nm <buffer> <silent> <leader>pt :<C-U>call PSCIDEtype(PSCIDEgetKeyword(), v:true)<CR>
  au FileType purescript nm <buffer> <silent> <leader>pT :<C-U>call PSCIDEaddTypeAnnotation(matchstr(getline(line(".")), '^\s*\zs\k\+\ze'))<CR>
  au FileType purescript nm <buffer> <silent> <leader>ps :Papply<CR>
  au FileType purescript nm <buffer> <silent> <leader>pa :<C-U>call PSCIDEaddTypeAnnotation()<CR>
  au FileType purescript nm <buffer> <silent> <leader>pi :<C-U>call PSCIDEimportIdentifier(PSCIDEgetKeyword())<CR>
  au FileType purescript nm <buffer> <silent> <leader>pr :<C-U>call PSCIDEload()<CR>
  au FileType purescript nm <buffer> <leader>pf :Pursuit<space>
  au FileType purescript nm <buffer> <silent> <leader>pF :<C-U>call PSCIDEpursuit(PSCIDEgetKeyword())<CR>
  au FileType purescript nm <buffer> <silent> <leader>pC :<C-U>call PSCIDEcaseSplit("!")<CR>
  au FileType purescript nm <buffer> <silent> <leader>pc :<C-U>call PSCIDEaddClause("")<CR>
  au FileType purescript nm <buffer> <silent> <leader>pq :<C-U>call PSCIDEaddImportQualifications()<CR>
  au FileType purescript nm <buffer> <silent> ]d :<C-U>call PSCIDEgoToDefinition("", PSCIDEgetKeyword())<CR>
augroup END

let g:purescript_indent_if = 2
let g:purescript_indent_case = 2
let g:purescript_indent_let = 0
let g:purescript_indent_in = 0
let g:purescript_indent_where = 2
let g:purescript_indent_do = 2
