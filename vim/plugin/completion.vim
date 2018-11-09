augroup omnicomplete
  autocmd!
  autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

let g:mucomplete#chains = {
  \ 'default': ['path', 'c-n', 'omni', 'uspl'],
  \ 'tex': ['path', 'c-n', 'incl', 'uspl'],
  \ 'javascript': ['path', 'c-n', 'incl', 'uspl', 'omni'],
  \ 'javascript.jsx': ['path', 'c-n', 'incl', 'uspl', 'omni'],
  \ }
