if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "persistent"

syn case match

" Entity {{{

syn match persistentConstraint "^\s\+[A-Z]\w\+\s\+.\+$" contained contains=persistentConstraintName,persistentFieldName
syn match persistentConstraintName "\<[A-Z]\w\+\>" contained containedin=persistentConstraint nextgroup=persistentFieldName skipwhite

syn match persistentField "^\s\+\%(Id\|[a-z]\w\+\)\s\+.*$" contained contains=persistentId,persistentFieldName,persistentType,persistentParen,persistentBracket,persistentDefaultValue,persistentSqlTable,persistentSqlType,persistentLineComment
syn match persistentFieldName "\<[a-z]\w\+\>" contained containedin=persistentField nextgroup=persistentType,persistentFieldName skipwhite
syn match persistentType "\<[A-Z]\w\+\>" contained containedin=persistentField

syn match persistentDerivingClause "^\s\+deriving\s\+.\+$" contained contains=persistentDeriving,persistentTypeClass
syn match persistentTypeClass "\<[A-Z]\w\+\>" contained containedin=persistentDerivingClause nextgroup=persistentTypeClass skipwhite

syn match persistentEntityDecl "^+\?[A-Z].*$" contains=persistentSum,persistentEntityName,persistentJson,persistentSqlTable
syn match persistentEntityName "[A-Z]\w\+" contained containedin=persistentEntityDecl

syn region persistentEntityDef
      \ start="^+\?[A-Z].*\n^\z\(\s\+\)"
      \ skip="^$"
      \ end="^\(\z1\|$\)\@!"me=e-1
      \ matchgroup=persistentEntityDecl
      \ contains=persistentEntityDecl,persistentLineComment,persistentField,persistentConstraint,persistentDerivingClause,persistentTypeClass
      \ keepend

" }}}

syn match persistentLineComment "--.*$"
syn match persistentTodo "TODO\|XXX\|FIXME" contained containedin=persistentLineComment

syn region persistentString start=+"+ skip=+\\"+ end=+"+
syn region persistentString start=+'+ skip=+\\'+ end=+'+

syn match persistentBracket "[\[\]]"
syn match persistentParen "[()]"

syn match persistentSqlTable "sql=\w\+"hs=s+4 contained contains=persistentSql
syn match persistentDefaultValue "default=\S\+"hs=s+8 contained contains=persistentDefault,persistentString

" Keywords {{{

syn keyword persistentDefault default contained
syn keyword persistentDeriving deriving nextgroup=persistentTypeClass skipwhite
syn keyword persistentId Id contained
syn keyword persistentJson json contained
syn keyword persistentSql sql contained

" }}}

" Highlight links {{{

hi! link persistentDefaultValue Constant
hi! link persistentLineComment Comment
hi! link persistentEntityName Type
hi! link persistentFieldName Normal
hi! link persistentConstraintName Keyword
hi! link persistentType Type
hi! link persistentTypeClass Type
hi! link persistentSqlTable String
hi! link persistentString String

hi! link persistentBracket Delimiter
hi! link persistentParen Delimiter

hi! link persistentDefault Keyword
hi! link persistentDeriving Keyword
hi! link persistentId Keyword
hi! link persistentJson Keyword
hi! link persistentSql Keyword

hi! link persistentTodo Todo

" }}}
