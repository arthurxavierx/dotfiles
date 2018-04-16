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

set pumheight=10
set shortmess-=c
set completeopt-=preview
set completeopt+=menuone,noinsert,noselect
set belloff+=ctrlg " If Vim beeps during completion

inoremap <expr><BS> pumvisible() ? "\<C-E>" : "\<BS>"
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")

let g:mucomplete#chains = {
  \ 'default': ['path', 'omni', 'c-n', 'incl', 'uspl'],
  \ 'tex': ['path', 'c-n', 'incl', 'uspl'],
  \ 'javascript': ['path', 'c-n', 'incl', 'uspl', 'omni'],
  \ 'javascript.jsx': ['path', 'c-n', 'incl', 'uspl', 'omni'],
  \ }
