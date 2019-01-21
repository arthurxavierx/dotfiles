setlocal autoread
setlocal nomodifiable
setlocal foldmethod=manual

setlocal nonumber norelativenumber

au BufEnter    <buffer> normal G
au BufReadPost <buffer> normal G

let b:lines = line('w$')

" Auto read {{{
if !exists('b:autoread')
    let b:autoread = 1
    call timer_start(1, 'CheckUpdate')
endif

function! CheckUpdate(timer)
    silent! checktime
    call timer_start(500, 'CheckUpdate')
endfunction
" }}}

" Compose messages {{{
let b:in_file = substitute(expand('%:~'), 'out$', 'in', '')

nmap <buffer><silent> a :call <SID>ComposeMessage(b:in_file)<CR>
nmap <buffer><silent> A :call <SID>ComposeMessage(b:in_file)<CR>
nmap <buffer><silent> i :call <SID>ComposeMessage(b:in_file)<CR>
nmap <buffer><silent> I :call <SID>ComposeMessage(b:in_file)<CR>
nmap <buffer><silent> o :call <SID>ComposeMessage(b:in_file)<CR>
nmap <buffer><silent> O :call <SID>ComposeMessage(b:in_file)<CR>

function! s:ComposeMessage(in_file)
  exe 'new +set\ ft=ircin'
  exe 'setlocal bt=nofile bh=wipe nobl noswf'
  exe 'resize 2'
  exe 'let b:in_file = "' . a:in_file . '"'
endfunction
" }}}
