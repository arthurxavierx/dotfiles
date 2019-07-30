" ------------------------------------------------------------------------------
" File:         irc.vim
" Author:       Arthur Xavier <arthur.xavierx@gmail.com>
" Description:
" License:      GPLv3+
" ------------------------------------------------------------------------------

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "irc"

setlocal iskeyword+=#,-
setlocal conceallevel=2 concealcursor=nc

" Colorize names {{{
let b:names = []
let s:names_palette =
  \ [ '#8B8378', '#458B74', '#838B8B', '#8B7D6B', '#00008B', '#8B2323'
  \ , '#8B7355', '#53868B', '#458B00', '#8B4513', '#8B3E2F', '#8B8878'
  \ , '#008B8B', '#8B6508', '#6E8B3D', '#8B4500', '#68228B', '#698B69'
  \ , '#528B8B', '#8B0A50', '#00688B', '#104E8B', '#8B1A1A', '#8B7500'
  \ , '#8B6914', '#008B00', '#838B83', '#8B3A62', '#8B3A3A', '#8B8B83'
  \ , '#8B864E', '#8B8386', '#8B8970', '#68838B', '#7A8B8B', '#8B814C'
  \ , '#8B5F65', '#8B5742', '#607B8B', '#6E7B8B', '#8B8B7A', '#8B008B'
  \ , '#8B1C62', '#7A378B', '#5D478B', '#8B7D7B', '#8B795E', '#698B22'
  \ , '#8B5A00', '#8B2500', '#8B4789', '#548B54', '#668B8B', '#8B475D'
  \ , '#8B7765', '#8B636C', '#8B668B', '#551A8B', '#8B0000', '#8B6969'
  \ , '#27408B', '#8B4C39', '#2E8B57', '#8B8682', '#8B4726', '#4A708B'
  \ , '#473C8B', '#6C7B8B', '#8B8989', '#008B45', '#36648B', '#8B5A2B'
  \ , '#8B7B8B', '#8B3626', '#00868B', '#8B2252', '#8B7E66', '#8B8B00'
  \ ]

function! s:Hash(str)
  let num = 0
  for chr in split(a:str, '\zs')
    let num = (num + 19 + char2nr(chr)) % 216
  endfor
  return num + 16
endfunction

function! s:DoName(name)
  if index(b:names, a:name) >= 0
    return
  endif

  call add(b:names, a:name)
  let key = substitute(a:name, '[^a-zA-Z0-9_@. ]', '',       'g')
  let ptrn = substitute(a:name, '[^a-zA-Z0-9_@. ]', '\\S\\?', 'g')
  let clr = s:Hash(key)

  exe 'syn match c' . clr . ' "\<' . ptrn . '\>"'
  exe 'syn cluster ircNames add=c' . clr

  exe 'hi! c' . clr
    \ . ' gui=bold cterm=bold'
    \ . ' guifg=' . s:names_palette[clr%40]
    \ . ' ctermfg=' . clr
endfunction

function! s:DoNames()
  for line in getline(0, '$')
    let name = matchstr(line, '\v([\(\[]?[0-9-]* *\d\d:\d\d(:\d\d)? *[APM]*[)\]]?|^)\s*(\<[-+*@ ]?)?#?\zs[a-zA-Z0-9#|_@. \\]+\ze[:>]\s', '\1', '')
    if name != ''
      call s:DoName(name)
    endif
  endfor
endfunction
" }}}

" Markdown syntax {{{
syn region ircItalicDel matchgroup=ircItalicDel start="\%(\*\|_\)"    end="\%(\*\|_\)"
syn region ircBoldDel matchgroup=ircBoldDel start="\%(\*\*\|__\)"    end="\%(\*\*\|__\)"
syn region ircBoldItalicDel matchgroup=ircBoldItalicDel start="\%(\*\*\*\|___\)"    end="\%(\*\*\*\|___\)"
syn region ircItalic matchgroup=ircItalicDel start="\k\@!\zs\*\ze[^\\\*\t ]\%(\%([^*]\|\\\*\|\n\)*[^\\\*\t ]\)\?\*\_W" end="[^\\\*\t ]\zs\*\ze\_W" keepend oneline concealends
syn region ircItalic matchgroup=ircItalicDel start="\k\@!\zs_\ze[^\\_\t ]" end="[^\\_\t ]\zs_\ze\_W" keepend oneline concealends
syn region ircBold matchgroup=ircBoldDel start="\k\@!\zs\*\*\ze\S" end="\S\zs\*\*" keepend oneline concealends
syn region ircBold matchgroup=ircBoldDel start="\k\@!\zs__\ze\S" end="\S\zs__" keepend oneline concealends
syn region ircBoldItalic matchgroup=ircBoldItalicDel start="\k\@!\zs\*\*\*\ze\S" end="\S\zs\*\*\*" keepend oneline concealends
syn region ircBoldItalic matchgroup=ircBoldItalicDel start="\k\@!\zs___\ze\S" end="\S\zs___" keepend oneline concealends

syn region ircCode matchgroup=ircCode start=/\(\([^\\]\|^\)\\\)\@<!</ end=/\(\([^\\]\|^\)\\\)\@<!>/ oneline
syn region ircCode matchgroup=ircCodeDel start=/\(\([^\\]\|^\)\\\)\@<!`/ end=/\(\([^\\]\|^\)\\\)\@<!`/ oneline concealends
syn region ircCode matchgroup=ircCodeDel start=/\(\([^\\]\|^\)\\\)\@<!``/ end=/\(\([^\\]\|^\)\\\)\@<!``/ skip=/[^`]`[^`]/ oneline concealends
" syn region ircCode matchgroup=ircCodeDelimiter start=/^\s*\z(`\{3,}\)[^`]*$/ end=/^\s*\z1`*\s*$/ concealends

syn match  ircURL /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z0-9][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/
syn region ircURL matchgroup=ircDelimiter start="(\(https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z0-9][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*)\)\@=" end=")"
syn region ircURL matchgroup=ircDelimiter start="\\\@<!<\ze[a-z][a-z0-9,.-]\{1,22}:\/\/[^> ]*>" end=">"
" }}}

syn cluster ircText contains=ircItalic,ircBold,ircBoldItalic,ircCode,ircURL

" syn match ircError   "\v(error)"
syn match Comment    "^#.*"

syn match ircMsg      "\v(.+)$" contains=@ircText

syn match ircDate     "\v([\(\[]?[0-9-]* *\d\d:\d\d(:\d\d)?[APMapm]*[)\]]?|^)" skipwhite nextgroup=ircSys,ircChannel,ircSpeaker

syn match ircChannel  "\v\k+[^:<]\s*.*" contained contains=@ircNames,@ircText
syn match ircSys      "\v^Conversation.*" contained
syn match ircSys      "\v(\>|-|\*|\=)+[^:<]\s*.*" contained contains=@ircNames

syn match ircSpeaker  "\v(\<[-+*@ ]*)?[a-zA-Z0-9#\[\]\{\}|_@. ]+[:>]\s"he=e-1 contained contains=@ircNames skipwhite

syn cluster ircNames contains=NONE
call s:DoNames()

" Highlighting {{{
hi! link ircSys     Comment
hi! link ircDate    Ignore
hi! link ircSpeaker Todo
hi! link ircMsg     Normal

hi! ircItalic cterm=italic gui=italic
hi! ircBold cterm=bold gui=bold
hi! ircBoldItalic cterm=bold,italic gui=bold,italic

hi! ircItalicDel cterm=italic gui=italic
hi! ircBoldDel cterm=bold gui=bold
hi! ircBoldItalicDel cterm=bold,italic gui=bold,italic

hi! link ircURL     Underlined
hi! link ircCode    String
hi! link ircCodeDel String
" }}}
