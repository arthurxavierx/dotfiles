syn match purescriptForall "∀"
syn match purescriptHole "?\k\+"
syn keyword purescriptAdo ado

syn match purescriptTodo "TODO\|XXX\|FIXME" contained containedin=purescriptLineComment,purescriptBlockComment

hi! link purescriptAdo Keyword
hi! link purescriptTodo Todo
