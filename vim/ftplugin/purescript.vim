" let g:psc_ide_syntastic_mode = 1
" let g:psc_ide_import_on_completion = 0
" let g:psc_ide_check_output_dir = 0
" let g:psc_ide_server_port = 2000
let b:coc_additional_keywords = ["."]

set formatprg=npx\ purs-tidy\ format
autocmd BufWritePost <buffer> call lib#Format()

" Redefine default indentation rules to some sane values
let g:purescript_indent_if = 2
let g:purescript_indent_case = 2
let g:purescript_indent_let = 0
let g:purescript_indent_in = 0
let g:purescript_indent_where = 0
let g:purescript_indent_do = 2
setlocal indentkeys=!^F

" nmap <buffer> <silent> <localleader>t :call CocActionAsync('doHover')<cr>
" nmap <buffer> <silent> <localleader>T :PaddType<CR>
" nmap <buffer> <silent> <localleader>s :Papply<CR>
" nmap <buffer> <silent> <localleader>S :Papply!<CR>
" nmap <buffer> <silent> <localleader>i :Pimport<CR>
" nmap <buffer> <silent> <localleader>R :Pload!<CR>
" nmap <buffer> <silent> <localleader>C :Pcase!<CR>
" nmap <buffer> <silent> <localleader>c :PaddClause<CR>
" nmap <buffer> <silent> <localleader>q :PaddImportQualifications<CR>

nmap <buffer> <localleader>R :call CocAction('runCommand', 'purescript.build')<CR>
" nmap <buffer> <localleader>i :call CocAction('runCommand', 'purescript.addCompletionImport', expand('<cword>'), substitute(expand('<cWORD>'), "\.[^.]*$", "", ""), substitute(expand('<cWORD>'), "\.[^.]*$", "", ""), 'file://'.expand('%:p'), '')<CR>
nmap <buffer> <localleader>C :call CocAction('runCommand', 'purescript.caseSplit-explicit')<CR>
nmap <buffer> <localleader>c :call CocAction('runCommand', 'purescript.addClause-explicit')<CR>

function! s:PursImportCursor() abort
  let cword = expand('<cWORD>')
  let name = substitute(substitute(cword, "[^[:keyword:]]*", "", ""), "\.[^.]*$", "", "")
  if empty(name)
    throw "Word under cursor '" . cword . "' does not have a module qualifier"
  endif

  exe '/^import \S\+ as\>/g//pu! =\"import ' . name . ' as ' . name . '\"'
  exe '/^import \S\+ as\>/-1,?^import \S\+ as\>? !sort -u'
  exe "normal \<C-O>"
endfunction

command! -complete=buffer -nargs=0 PursImportCursor call <SID>PursImportCursor()
nmap <buffer> <localleader>i :PursImportCursor<CR>

nnoremap <buffer><silent> K :!open -a "/Applications/Google Chrome.app" 'https://pursuit.purescript.org/search?q=<c-r>=expand("<cword>")<cr>'<cr>

inoremap [<CR> [<CR>]<Esc>kA
inoremap {<CR> {<CR>}<Esc>kA

" Chords {{{

Arpeggiois cv ::<C-r>=lib#AfterSpace()<CR>
Arpeggiois <leader>hle ?x
Arpeggiois <leader>rw -><C-r>=lib#AfterSpace()<CR>
Arpeggiois <leader>RW =><C-r>=lib#AfterSpace()<CR>
Arpeggio inoremap {} {}<Left>

Arpeggioibufsnipk <leader>lam lam
Arpeggioibufsnipcr <leader>fun fun
Arpeggioibufsnipcr <leader>fin def
Arpeggioibufk <leader>frl forall<C-r>=lib#AfterSpace()<CR>

" Scoped declarations
Arpeggioibufk <leader>let let<C-r>=lib#AfterSpace()<CR>
Arpeggioibufsnipcr <leader>ltn letin
Arpeggioibufs <leader>whe where<CR>

" Type classes
Arpeggioibufs <leader>clas class
Arpeggioibufsnips <leader>inst instance

" Operators
Arpeggioibufk <> <><Space>
Arpeggioibufk <leader>cm <<<<Space>

" Modules and imports
Arpeggioibufsnip <leader>mdl module
Arpeggioibufcr <leader>imp import<C-r>=lib#AfterSpace()<CR>
Arpeggioibufsnipcr <leader>imq importq

" Types
" Arpeggioibufcr dat data<C-r>=lib#AfterSpace()<CR>
Arpeggioibufs <leader>nwt newtype<C-r>=lib#AfterSpace()<CR>
Arpeggioibufcr <leader>typ type<C-r>=lib#AfterSpace()<CR>
Arpeggioibufsnipcr <leader>tyr tyrec

Arpeggioibufcr <leader>dri derive<C-r>=lib#AfterSpace()<CR>

" Control flow
Arpeggioibufsnip <leader>kes caseof
" Arpeggioibufsnipcr ite ifthen
" Arpeggioibufk whn when<C-r>=lib#AfterSpace()<CR>

" Utilities
Arpeggioibufs UNI Unit
Arpeggioibufs TUP Tuple
Arpeggioibufs STR String
Arpeggioibufs INT Int
Arpeggioibufs BLN Boolean
Arpeggioibufk MEB Maybe<C-r>=lib#AfterSpace()<CR>
Arpeggioibufk JST Just<C-r>=lib#AfterSpace()<CR>
Arpeggioibufs NTH Nothing
Arpeggioibufk ARY Array<C-r>=lib#AfterSpace()<CR>
Arpeggioibufk EIT Either<C-r>=lib#AfterSpace()<CR>
Arpeggioibufk RIH Right<C-r>=lib#AfterSpace()<CR>
Arpeggioibufk LEF Left<C-r>=lib#AfterSpace()<CR>
Arpeggioibufk PEF Effect<C-r>=lib#AfterSpace()<CR>
Arpeggioibufk PAF Aff<C-r>=lib#AfterSpace()<CR>

Arpeggioibufs <leader>uni unit
Arpeggioibufk <leader>pur pure<C-r>=lib#AfterSpace()<CR>
Arpeggioibufs <leader>tru true
Arpeggioibufs <leader>fal false
Arpeggioibufk <leader>cns const<C-r>=lib#AfterSpace()<CR>
Arpeggioibufs <leader>idt identity
Arpeggioibufk lief liftEffect<C-r>=lib#AfterSpace()<CR>
Arpeggioibufk liaf liftAff<C-r>=lib#AfterSpace()<CR>

Arpeggioibuf <leader>m. <Space><BS><Esc>m0:call<Space>search('::',<Space>'bcW')<CR>byiw`0pa<C-r>=lib#AfterSpace()<CR>
Arpeggio nnoremap <buffer> <Space>op ^yiwO<C-r>=@*<CR><Space>::<C-r>=lib#AfterSpace()<CR>
Arpeggio nnoremap <buffer> <Space>doc O--<Space>\|<Space>TODO:<Space>documentation<Esc>

" }}}
