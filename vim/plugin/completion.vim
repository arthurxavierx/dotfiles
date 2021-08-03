augroup omnicomplete
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

let g:symbols_user_completion = 0

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.debug = v:true
let g:compe.min_length = 2
let g:compe.documentation = v:false
let g:compe.source = {
  \ 'path': v:true,
  \ 'buffer': v:true,
  \ 'calc': v:true,
  \ 'ultisnips': v:true,
  \ 'tmux': v:true,
  \ 'nvim_lsp': v:false,
  \ }
