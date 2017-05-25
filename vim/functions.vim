" Quickfix {{{
augroup Quickfix
 autocmd!
 autocmd BufWinEnter quickfix let g:quickfixwin = bufnr("$")
 autocmd BufWinLeave * if exists("g:quickfixwin") && expand("<abuf>") == g:quickfixwin | unlet! g:quickfixwin | endif
augroup END

" Execute a quickfix list command (preceded by 'c') if it exists (even if not
" visible), else execute a location list command (preceded by 'l').
function! QuickfixOrLocationExists(cmd)
  silent! exec(len(getqflist()) > 0 ? 'c'.a:cmd : 'l'.a:cmd)
endfunction
" Execute a quickfix list command if it exists and is visible, else execute a
" location list command (preceded by 'l').
function! QuickfixOrLocationIsOpen(cmd)
  silent! exec(exists("g:quickfixwin") > 0 ? 'c'.a:cmd : 'l'.a:cmd)
endfunction
" Execute a quickfix list command if it exists and is visible, or focus the
" quickfix list if it has only one item. If the Quickfix List does not exist
" or is not visible, execute a location list command or focus it.
function! QuickfixOrLocationMove(cmd)
  let qflist = getqflist()
  let loclist = getloclist(0)

  if (exists("g:quickfixwin") && len(qflist) > 0)
    silent! exec(len(qflist) > 1 ? 'c'.a:cmd : 'cc')
  elseif (len(loclist) > 0)
    silent! exec(len(loclist) > 1 ? 'l'.a:cmd : 'll')
  endif
endfunction

command! Lopen  call QuickfixOrLocationExists('open')
command! Lclose call QuickfixOrLocationIsOpen('close')
command! Lwin   call QuickfixOrLocationIsOpen('win')
command! Lnext  call QuickfixOrLocationMove('next')
command! Lprev  call QuickfixOrLocationMove('prev')

" Perform a vimgrep search, open the quickfix list and jump to the first match.
command! -nargs=+ -complete=file_in_path -bar Vim vim <args> | cw | cfirst
" Perform a vimgrep search over files of same extension under the current
" directory (recursively).
command! -nargs=+ -complete=user -bar Vims execute "Vim /\\<<args>\\>/g **/*" . (expand("%:e") == "" ? "" : ".".expand("%:e")) | silent! g/<args>/
" }}}

" Buffers {{{
" here is a more exotic version of my original Kwbd script
" delete the buffer; keep windows; create a scratch buffer if no buffers left
function! s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Kwbd call s:Kwbd(1)
" }}}
