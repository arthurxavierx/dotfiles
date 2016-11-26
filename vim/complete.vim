filetype plugin on
set omnifunc=syntaxcomplete#Complete

if (has("nvim"))
  call deoplete#custom#set('omni', 'min_pattern_length', 3)
endif

augroup omnicomplete
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

" deoplete Setup {{{
if (has("nvim"))
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_start_length = 3
  let g:deoplete#delimiters = ['/', '.', '::', ':', '#', '->']
  let g:deoplete#sources = {}
  let g:deoplete#sources._ = ['omni', 'buffer', 'member', 'tag', 'file']
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  let g:deoplete#omni#input_patterns.purescript = 'import\s+\w*|[^. *\t]'
  let g:deoplete#omni_patterns = {}
  " set completeopt=longest,menuone
  set completeopt=menuone
  set pumheight=5
  let g:deoplete#max_menu_width = 60
endif
" }}}

" neocomplete Setup {{{
if (!has("nvim"))
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.purescript = 'import\s+\w*|[^. *\t]'
endif
" }}}
