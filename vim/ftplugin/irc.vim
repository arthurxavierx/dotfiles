setlocal autoread
setlocal nomodifiable
setlocal foldmethod=manual
setlocal wrap linebreak

setlocal nonumber norelativenumber

au BufEnter <buffer> normal G
au BufReadPost <buffer> normal G

let b:lines = line('w$')

" Auto read {{{
" au FocusGained <buffer> :checktime

if !exists('b:autoread')
    let b:autoread = 1
    call timer_start(1, 'CheckUpdate')
endif

function! CheckUpdate(timer)
    silent! checktime
    call timer_start(500, 'CheckUpdate')
endfunction
" }}}

let b:in_file = substitute(expand('%:~'), 'out$', 'in', '')
let b:in_buffer = escape(substitute(expand('%:2t'), 'out$', 'in', ''), ' #\')

nmap <buffer><silent> a :call <SID>ComposeMessage(b:in_file, b:in_buffer)<CR>
nmap <buffer><silent> A :call <SID>ComposeMessage(b:in_file, b:in_buffer)<CR>
nmap <buffer><silent> i :call <SID>ComposeMessage(b:in_file, b:in_buffer)<CR>
nmap <buffer><silent> I :call <SID>ComposeMessage(b:in_file, b:in_buffer)<CR>
nmap <buffer><silent> o :call <SID>ComposeMessage(b:in_file, b:in_buffer)<CR>
nmap <buffer><silent> O :call <SID>ComposeMessage(b:in_file, b:in_buffer)<CR>

function! s:ComposeMessage(filename, bufname) " {{{
  " exe 'new +set\ ft=ircin\ bt=nofile\ bh=hide\ nobl\ noswf ' . a:bufname
  exe 'new +set\ ft=ircin\ bt=nofile\ bh=wipe\ nobl\ noswf'
  exe 'resize 2'
  exe 'let b:filename = "' . a:filename . '"'
  exe 'startinsert!'
endfunction " }}}
