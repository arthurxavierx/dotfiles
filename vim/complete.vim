filetype plugin on
set omnifunc=syntaxcomplete#Complete

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

set completeopt=menuone
set pumheight=10

inoremap <expr><BS> pumvisible() ? "\<C-E>" : "\<BS>"
