" Temporarily disables wildignore for :gf
function! lib#GotoFile()
  let wig = &wig
  set wig=
  normal gf
  let &wig = wig
endfunction!

function! lib#SetNumberDisplay()
  if &buftype == 'terminal'
    setlocal nonumber
    setlocal norelativenumber
  else
    set number
    set relativenumber
  endif
endfunction!

function lib#SplitWithoutNesting()
  if !empty($NVIM_LISTEN_ADDRESS) && $NVIM_LISTEN_ADDRESS !=# v:servername
    " start a job with the source vim instance
    let g:receiver = jobstart(['nc', '-U', $NVIM_LISTEN_ADDRESS], {'rpc': v:true})

    " get the filename of the newly opened buffer
    let g:filename = fnameescape(expand('%:p'))

    " wipeout the buffer
    noautocmd bwipeout

    " open the buffer in the source vim instance
    call rpcrequest(g:receiver, "nvim_command", "edit ".g:filename)

    " call the autocommand to enter windows
    call rpcrequest(g:receiver, "nvim_command", "doautocmd BufWinEnter")

    " quit the "other" instance of vim
    quitall
  endif
endfunction

function! lib#WritingMode(conceal)
  call pencil#init({'wrap': 'soft'})
  call s:UnmapPencilLines()

  sil! nun <buffer> $
  sil! nun <buffer> 0
  sil! vu  <buffer> $
  sil! vu  <buffer> 0

  sil! nun <buffer> j
  sil! nun <buffer> k
  sil! vu  <buffer> j
  sil! vu  <buffer> k

  if a:conceal
    set conceallevel=1
    exec 'IndentLinesDisable'
    hi Conceal guifg=white
  endif
endfunction
