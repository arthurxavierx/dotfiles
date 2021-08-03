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
nmap <buffer> <silent> <localleader>R :Pload!<CR>
nmap <buffer>          <localleader>f :Pursuit<space>
nmap <buffer> <silent> <localleader>F :<C-U>call PSCIDEpursuit(PSCIDEgetKeyword())<CR>
nmap <buffer> <silent> <localleader>C :Pcase!<CR>
nmap <buffer> <silent> <localleader>c :PaddClause<CR>
nmap <buffer> <silent> <localleader>q :PaddImportQualifications<CR>

nmap <buffer> <silent> ]d :Pgoto<CR>

nnoremap <buffer> K :!open -a "/Applications/Google Chrome.app" 'https://pursuit.purescript.org/search?q=<c-r>=expand("<cword>")<cr>'<cr>

setlocal commentstring=--\ %s
au FileType purescript let &l:commentstring='-- %s'

" Chords {{{

Arpeggioibufsnipk lam lam
Arpeggioibufsnipcr fun fun
Arpeggioibufk frl forall<Space>

" Scoped declarations
Arpeggioibufcr let let<Space>
Arpeggioibufsnipcr lti letin
Arpeggioibufs whr where<CR>

" Type classes
Arpeggioibufcr cls class<Space>
Arpeggioibufsnips int instance

" Operators
Arpeggioibufk <> <><Space>
Arpeggioibufk <Space>cm <<<<Space>

" Modules and imports
Arpeggioibufsnip mdl module
Arpeggioibufcr imp import<Space>
Arpeggioibufsnipcr imq importq

" Types
Arpeggioibufcr dat data<Space>
Arpeggioibufcr nwt newtype<Space>
Arpeggioibufcr typ type<Space>

Arpeggioibufcr dri derive<Space>

" Control flow
Arpeggioibufsnipcr kes caseof
Arpeggioibufsnipcr ite ifthen
Arpeggioibufk whn when<Space>

" Utilities
Arpeggioibufk meb Maybe<Space>
Arpeggioibufk jst Just<Space>
Arpeggioibufs nth Nothing
Arpeggioibufk ary Array<Space>
Arpeggioibufk lef liftEffect<Space>
Arpeggioibufk pur pure<Space>
Arpeggioibufs tru true
Arpeggioibufs fal false
Arpeggioibufk cns const<Space>
Arpeggioibufs idt identity
Arpeggioibufs <Space>jx JSX
Arpeggioibufs url URL
Arpeggioibufs uni unit<Space>
Arpeggioibufs UNI Unit<Space>

" }}}
