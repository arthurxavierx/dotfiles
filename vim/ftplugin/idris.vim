" vim: fdm=marker:fdl=0:
" Redefine default indentation rules to some sane values
let g:idris_indent_if = 2
let g:idris_indent_case = 2
let g:idris_indent_let = 4
let g:idris_indent_where = 2
let g:idris_indent_do = 2
let g:idris_indent_rewrite = 2

call ale#Set('idris_idris_options', '--warnpartial --warnreach --warnipkg')

function! s:IdrisCommand(...)
  let idriscmd = shellescape(join(a:000))
  let result = system('idris --client ' . idriscmd)
  call IWrite(result)
endfunction

" Commands {{{
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
" }}}

" Mappings {{{
"" REPL {{{
nmap <buffer> <leader>pr  :IdrisReload<CR>
nmap <buffer> <leader>pt  :IdrisShowType<CR>
nmap <buffer> <leader>pd  :IdrisShowDoc<Space>
nmap <buffer> <leader>pi  :IdrisResponseWin<CR>
nmap <buffer> <leader>pe  :IdrisEval<CR>
nmap <buffer> <leader>ph  :IdrisHoles<CR>
nmap <buffer> <leader>ps  :IdrisSearch<Space>
nmap <buffer> <leader>pD  :IdrisDoc<Space>
"" }}}

"" Add clauses {{{
nmap <buffer> <leader>pat :IdrisAddClauseType<CR>
nmap <buffer> <leader>pac :IdrisAddClause<CR>
nmap <buffer> <leader>pap :IdrisAddClauseProof<CR>
nmap <buffer> <leader>paw :IdrisAddWithClause<CR>
nmap <buffer> <leader>pam :IdrisAddMissing<CR>
"" }}}

"" Cases {{{
nmap <buffer> <leader>pc  :IdrisCaseSplit<CR>
nmap <buffer> <leader>pmc :IdrisMakeCase<CR>
nmap <buffer> <leader>pml :IdrisMakeLemma<CR>
"" }}}

"" Proofs {{{
nmap <buffer> <leader>po  :IdrisProofObvious<CR>
nmap <buffer> <leader>pp  :IdrisProofSearch<CR>
nmap <buffer> <leader>pf  :IdrisRefine<CR>
"" }}}
" }}}
