let g:arpeggio_timeoutlen = 50

function! s:Arpeggiois(chord, mapping)
  exe 'Arpeggio inoremap <silent> ' . a:chord . ' <C-r>=lib#Space("\\S")<CR>' . a:mapping
endfunction

function! s:Arpeggioik(chord, mapping)
  exe 'Arpeggio inoremap <silent> ' . a:chord . ' <C-r>=lib#Space()<CR>' . a:mapping
endfunction

function! s:Arpeggioicr(chord, mapping)
  exe 'Arpeggio inoremap <silent> ' . a:chord . ' <Space><BS><Esc>A<C-r>=lib#Newline()<CR>' . a:mapping
endfunction

function! s:Arpeggioibuf(chord, mapping)
  exe 'Arpeggio inoremap <buffer><silent> ' . a:chord . ' ' . a:mapping
endfunction

function! s:Arpeggioibufs(chord, mapping)
  exe 'Arpeggio inoremap <buffer><silent> ' . a:chord . ' <C-r>=lib#Space("\\S")<CR>' . a:mapping
endfunction

function! s:Arpeggioibufk(chord, mapping)
  exe 'Arpeggio inoremap <buffer><silent> ' . a:chord . ' <C-r>=lib#Space()<CR>' . a:mapping
endfunction

function! s:Arpeggioibufcr(chord, mapping)
  exe 'Arpeggio inoremap <buffer><silent> ' . a:chord . ' <Space><BS><Esc>A<C-r>=lib#Newline()<CR>' . a:mapping
endfunction

function! s:Arpeggioibufsnip(chord, snippet)
  exe 'Arpeggio inoremap <buffer><silent> ' . a:chord . ' ' . a:snippet . '<C-r>=UltiSnips#ExpandSnippet()<CR>'
endfunction

function! s:Arpeggioibufsnips(chord, snippet)
  exe 'Arpeggio inoremap <buffer><silent> ' . a:chord . ' <C-r>=lib#Space("\\S")<CR>' . a:snippet . '<C-r>=UltiSnips#ExpandSnippet()<CR>'
endfunction

function! s:Arpeggioibufsnipk(chord, snippet)
  exe 'Arpeggio inoremap <buffer><silent> ' . a:chord . ' <C-r>=lib#Space()<CR>' . a:snippet . '<C-r>=UltiSnips#ExpandSnippet()<CR>'
endfunction

function! s:Arpeggioibufsnipcr(chord, snippet)
  exe 'Arpeggio inoremap <buffer><silent> ' . a:chord . ' <Space><BS><Esc>A<C-r>=lib#Newline()<CR>' . a:snippet . '<C-r>=UltiSnips#ExpandSnippet()<CR>'
endfunction

command! -complete=command -nargs=+ Arpeggiois call <SID>Arpeggiois(<f-args>)
command! -complete=command -nargs=+ Arpeggioik call <SID>Arpeggioik(<f-args>)
command! -complete=command -nargs=+ Arpeggioicr call <SID>Arpeggioicr(<f-args>)
command! -complete=command -nargs=+ Arpeggioibuf call <SID>Arpeggioibuf(<f-args>)
command! -complete=command -nargs=+ Arpeggioibufs call <SID>Arpeggioibufs(<f-args>)
command! -complete=command -nargs=+ Arpeggioibufk call <SID>Arpeggioibufk(<f-args>)
command! -complete=command -nargs=+ Arpeggioibufcr call <SID>Arpeggioibufcr(<f-args>)
command! -complete=command -nargs=+ Arpeggioibufsnip call <SID>Arpeggioibufsnip(<f-args>)
command! -complete=command -nargs=+ Arpeggioibufsnips call <SID>Arpeggioibufsnips(<f-args>)
command! -complete=command -nargs=+ Arpeggioibufsnipk call <SID>Arpeggioibufsnipk(<f-args>)
command! -complete=command -nargs=+ Arpeggioibufsnipcr call <SID>Arpeggioibufsnipcr(<f-args>)
