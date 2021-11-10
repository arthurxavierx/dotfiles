nnoremap <buffer><silent> K :call CocAction('doHover')<CR>

nmap <buffer><silent> [g <Plug>(coc-diagnostic-prev)
nmap <buffer><silent> ]g <Plug>(coc-diagnostic-next)

nmap <buffer><silent> gd <Plug>(coc-definition)
nmap <buffer><silent> gy <Plug>(coc-type-definition)
nmap <buffer><silent> gr <Plug>(coc-references)

nmap <buffer> <localleader>s <Plug>(coc-codeaction)
nmap <buffer> <localleader>r <Plug>(coc-rename)

vmap <buffer> <localleader>f  <Plug>(coc-format-selected)
nmap <buffer> <localleader>f  <Plug>(coc-format-selected)

" Chords {{{

Arpeggiois cv :<Space>
Arpeggiois <leader>rw =><Space>
Arpeggio inoremap {} {<CR>}<Esc>O
Arpeggio inoremap <> <><Left>
Arpeggioibuf <leader>rs ...

Arpeggioibufsnipk lam lam
Arpeggioibufsnipcr fun fun

" Scoped declarations
Arpeggioibufk let let<Space>
Arpeggioibufk cns const<Space>

" Classes
Arpeggioibufs cls class<Space>
Arpeggioibufs int interface<Space>
Arpeggioibufsnips cto ctor
Arpeggioibufs iml implements<Space>

" Types
Arpeggioibufcr typ type<Space>

" Modules and imports
Arpeggioibufsnipcr imp import
Arpeggioibufsnipcr imq importq
Arpeggioibufs frm from<Space>
Arpeggioibufs exp export<Space>
Arpeggioibufs exd export<Space>default<Space>

" Control flow
Arpeggioibufsnipcr swi switch
Arpeggioibufsnipcr kes case
Arpeggioibufsnipcr ife ifthen
Arpeggioibufsnipcr els else
Arpeggioibufsnipcr eli elseif
Arpeggioibufsnipcr try try
Arpeggioibufsnipcr cth catch
Arpeggioibufsnipcr fin finally
Arpeggioibufs for for<Space>
Arpeggioibufs whi while<Space>

" Utilities
Arpeggioibufs thr throw<Space>
Arpeggioibufs brk break;
Arpeggioibufs dlt default
Arpeggioibufk new new<Space>
Arpeggioibufs tru frue
Arpeggioibufs fal false

" }}}
