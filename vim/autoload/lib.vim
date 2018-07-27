" Temporarily disables wildignore for :gf
function! lib#GotoFile()
  let wig = &wig
  set wig=
  normal gf
  let &wig = wig
endfunction!

" Hide line numbers in terminal buffers
function! lib#SetNumberDisplay()
  if &buftype == 'terminal'
    setlocal nonumber norelativenumber
  else
    set number relativenumber
  endif
endfunction!

" When opening nvim inside another nvim instance (through a command or terminal
" buffer), automatically merge both instances, eliminating occasional nesting.
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
