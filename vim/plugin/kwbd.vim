" ------------------------------------------------------------------------------
" File:         kwbd.vim
" Author:       Arthur Xavier <arthur.xavierx@gmail.com>
" Description:  Delete buffer and keep window. Open a Dirvish buffer if no
"               buffer is left.
"               Inspired by https://github.com/rgarver/Kwbd.vim.
" License:      GLPv3+
" ------------------------------------------------------------------------------

function! s:Kwbd(unsafe, kwbdStage)
  if a:kwbdStage == 1
    if !a:unsafe && &mod
      echohl ErrorMsg
      echo 'E37: No write since last change'
      echo 'E162: No write since last change for buffer "' . bufname("%") . '"'
      echohl None
      return
    endif

    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif

    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(a:unsafe, 2)
    execute s:kwbdWinNum . 'wincmd w'

    let s:buflistedLeft = 0
    let s:bufFinalJump = 0

    for i in range(bufnr('$'))
      let bufnr = i + 1

      if bufnr == s:kwbdBufNum
        continue
      endif

      if buflisted(bufnr)
        let s:buflistedLeft = s:buflistedLeft + 1
      elseif bufexists(bufnr) && !strlen(bufname(bufnr)) && !s:bufFinalJump
        let s:bufFinalJump = bufnr
      endif
    endfor

    if !s:buflistedLeft
      if s:bufFinalJump
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        exe 'Dirvish'
        let newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif

    if buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%")
      execute "bd! " . s:kwbdBufNum
    endif
  else
    if bufnr("%") == s:kwbdBufNum
      let prevbufvar = bufnr("#")
      if prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! -bang Q call <SID>Kwbd(<bang>0, 1)
command! WQ w | Q
