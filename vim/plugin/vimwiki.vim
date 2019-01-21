let g:vimwiki_map_prefix = '<leader>k'
let g:vimwiki_folding = 'expr:quick'
let g:vimwiki_table_mappings = 0

nmap <leader>kk <Plug>VimwikiIndex

nnoremap <silent> <leader>kp :call <SID>OpenProjectWiki(fnamemodify(getcwd(), ':t'))<CR>

nmap <leader>kf :FZF ~/vimwiki<CR>
nmap <leader>fk :FZF ~/vimwiki<CR>

function! s:OpenProjectWiki(name)
  exe 'e ~/vimwiki/' . a:name . '.wiki'
endfunction
