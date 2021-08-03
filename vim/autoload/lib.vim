" Hide line numbers in terminal buffers
function! lib#HideNumbersInTerminal()
  if &buftype == 'terminal'
    setlocal nonumber norelativenumber
  endif
endfunction!

" When opening nvim inside another nvim instance (through a command or terminal
" buffer), automatically merge both instances, eliminating occasional nesting.
function! lib#MergeNvimInstances()
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

" lib#ShortenPath(path, maxlength = 30, showdirs = 2)
" Shorten paths by contracting folders into a single letter, leaving the last
" a:showdirs folders untransformed. If the resulting path is longer than
" maxlength, this function ellipses it from the left.
function! lib#ShortenPath(path, ...)
  let maxlength = get(a:, 1, 30)
  let showdirs = get(a:, 2, 2)

  let path = split(a:path, '/')

  if len(path) >= showdirs
    let short = join(path[0:-(showdirs + 1)], '/')
    let short = len(short) > 0 ? short . '/' : short

    let long = join(path[-showdirs:], '/')

    let r = pathshorten(short) . long
  else
    let r = a:path
  endif

  return len(r) > maxlength ? "…" . r[-min([len(r), maxlength]) + 1:] : r
endfunction

function! lib#ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! lib#EchoHighlightGroup()
  let _ = ""
  let _ .= "hi<" . synIDattr(synID(line("."),col("."),1),"name") . "> trans<"
  let _ .= synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  let _ .= synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
  echo _
endfunction

" TODO: documentation
function! lib#FtPluginEdit(root)
  exe 'e ' . a:root . '/ftplugin/' . &ft . '.vim'
endfunction

" TODO: documentation
function! lib#Space(...)
  let regex = get(a:, 1, '\k')
  if col(".") == 1 || getline(".")[col(".") - 2] !~ regex
    return ""
  else
    return " "
  endif
endfunction

" TODO: documentation
function! lib#Newline()
  " if col(".") == 1 || getline(".")[0:col(".") - 2] =~ '^\s*$'
  if col(".") == 1 || getline(".") =~ '^\s*$'
    return ""
  else
    return "\<CR>"
  endif
endfunction
