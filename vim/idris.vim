" Redefine default indentation rules to some sane values
let g:idris_indent_if = 2
let g:idris_indent_case = 2
let g:idris_indent_let = 4
let g:idris_indent_where = 2
let g:idris_indent_do = 2
let g:idris_indent_rewrite = 2

call ale#Set('idris_idris_options', '--warnpartial --warnreach --warnipkg')

"
function! s:IdrisCommand(...)
  let idriscmd = shellescape(join(a:000))
  let result = system('idris --client ' . idriscmd)
  call IWrite(result)
endfunction

function! IdrisHoles()
  call s:IdrisCommand(':m')
endfunction

function! IdrisSearch(type)
  call s:IdrisCommand(':s', a:type)
endfunction

function! IdrisSearch(type)
  call s:IdrisCommand(':s', a:type)
endfunction

" Turn default mappings into commands
command! IdrisShowType call IdrisShowType()
command! IdrisReload call IdrisReload(0)
command! IdrisCaseSplit call IdrisCaseSplit()
command! IdrisAddClauseType normal 0f:b|call IdrisAddClause(0)|normal w
command! IdrisAddClause normal 0|call IdrisAddClause(0)
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
command! IdrisHoles call s:IdrisCommand(':m')
command! -nargs=1 IdrisSearch call s:IdrisCommand(':s', <f-args>)
command! -nargs=1 IdrisDoc call s:IdrisCommand(':doc', <f-args>)

augroup idris
  au!
  au FileType qf setlocal wrap

  " REPL
  au FileType idris nmap <leader>pr  :IdrisReload<CR>
  au FileType idris nmap <leader>pt  :IdrisShowType<CR>
  au FileType idris nmap <leader>pd  :IdrisShowDoc<Space>

  au FileType idris nmap <leader>pi  :IdrisResponseWin<CR>
  au FileType idris nmap <leader>pe  :IdrisEval<CR>
  au FileType idris nmap <leader>ph  :IdrisHoles<CR>
  au FileType idris nmap <leader>ps  :IdrisSearch<Space>
  au FileType idris nmap <leader>pD  :IdrisDoc<Space>

  " Add clauses
  au FileType idris nmap <leader>pat :IdrisAddClauseType<CR>
  au FileType idris nmap <leader>pac :IdrisAddClause<CR>
  au FileType idris nmap <leader>pap :IdrisAddClauseProof<CR>
  au FileType idris nmap <leader>paw :IdrisAddWithClause<CR>
  au FileType idris nmap <leader>pam :IdrisAddMissing<CR>

  " Cases
  au FileType idris nmap <leader>pc  :IdrisCaseSplit<CR>
  au FileType idris nmap <leader>pmc :IdrisMakeCase<CR>
  au FileType idris nmap <leader>pml :IdrisMakeLemma<CR>

  " Proofs
  au FileType idris nmap <leader>po  :IdrisProofObvious<CR>
  au FileType idris nmap <leader>pp  :IdrisProofSearch<CR>
  au FileType idris nmap <leader>pf  :IdrisRefine<CR>
augroup END
