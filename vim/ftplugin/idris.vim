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
nmap <buffer> <leader><leader>r  :IdrisReload<CR>
nmap <buffer> <leader><leader>t  :IdrisShowType<CR>
nmap <buffer> <leader><leader>d  :IdrisShowDoc<Space>
nmap <buffer> <leader><leader>i  :IdrisResponseWin<CR>
nmap <buffer> <leader><leader>e  :IdrisEval<CR>
nmap <buffer> <leader><leader>h  :IdrisHoles<CR>
nmap <buffer> <leader><leader>s  :IdrisSearch<Space>
nmap <buffer> <leader><leader>D  :IdrisDoc<Space>
"" }}}

"" Add clauses {{{
nmap <buffer> <leader><leader>at :IdrisAddClauseType<CR>
nmap <buffer> <leader><leader>ac :IdrisAddClause<CR>
nmap <buffer> <leader><leader>ap :IdrisAddClauseProof<CR>
nmap <buffer> <leader><leader>aw :IdrisAddWithClause<CR>
nmap <buffer> <leader><leader>am :IdrisAddMissing<CR>
"" }}}

"" Cases {{{
nmap <buffer> <leader><leader>c  :IdrisCaseSplit<CR>
nmap <buffer> <leader><leader>mc :IdrisMakeCase<CR>
nmap <buffer> <leader><leader>ml :IdrisMakeLemma<CR>
"" }}}

"" Proofs {{{
nmap <buffer> <leader><leader>o  :IdrisProofObvious<CR>
nmap <buffer> <leader><leader>p  :IdrisProofSearch<CR>
nmap <buffer> <leader><leader>f  :IdrisRefine<CR>
"" }}}
" }}}
