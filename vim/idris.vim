command! IdrisShowType call IdrisShowType()
command! IdrisReload call IdrisReload(0)
command! IdrisCaseSplit call IdrisCaseSplit()
command! IdrisAddClauseType normal 0f:b|call IdrisAddClause(0)|normal w
command! IdrisAddClauseMethod normal 0|call IdrisAddClause(0)
command! IdrisAddClauseProof normal 0f:b|call IdrisAddClause(1)|normal w
command! IdrisAddMissing call IdrisAddMissing()
command! IdrisRefine call IdrisRefine()
command! IdrisProofObvious call IdrisProofSearch(0)
command! IdrisProofSearch call IdrisProofSearch(1)
command! IdrisMakeLemma call IdrisMakeLemma()
command! IdrisEval call IdrisEval()
command! IdrisAddWithClause normal 0|call IdrisMakeWith()
command! IdrisMakeCase call IdrisMakeCase()
command! IdrisResponseWin normal 0|call IdrisResponseWin()
command! IdrisShowDoc call IdrisShowDoc()

augroup idris
  au!
  au FileType qf setlocal wrap
  au FileType idris nmap <leader>pr  :IdrisReload<CR>
  au FileType idris nmap <leader>pt  :IdrisShowType<CR>
  au FileType idris nmap <leader>pat :IdrisAddClauseType<CR>
  au FileType idris nmap <leader>pam :IdrisAddClauseMethod<CR>
  au FileType idris nmap <leader>pap :IdrisAddClauseProof<CR>
  au FileType idris nmap <leader>pap :IdrisMakeCase<CR>
  au FileType idris nmap <leader>pe  :IdrisEval<CR>
  au FileType idris nmap <leader>po  :IdrisProofObvious<CR>
  au FileType idris nmap <leader>pp  :IdrisProofSearch<CR>
  au FileType idris nmap <leader>pl  :IdrisMakeLemma<CR>
  au FileType idris nmap <leader>pd  :IdrisShowDoc<CR>
  au FileType idris nmap <leader>pc  :IdrisCaseSplit<CR>
  au FileType idris nmap <leader>pm  :IdrisAddMissing<CR>
  au FileType idris nmap <leader>pf  :IdrisRefine<CR>
  au FileType idris nmap <leader>pi  :IdrisResponseWin<CR>
  au FileType idris nmap <leader>pw  :IdrisAddWithClause<CR>
augroup END
