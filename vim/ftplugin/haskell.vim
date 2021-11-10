let g:hlintRefactor#disableDefaultKeybindings = 1
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1

" Don't automatically indent on save, since vim's autoindent for haskell is buggy
let b:autoformat_autoindent=0

if (filereadable("./stack.yaml") == 1)
  let b:ale_linters = {
        \   'haskell': ['hlint', 'stack-build']
        \}
else
  let b:ale_linters = {
        \ 'haskell': ['hlint', 'stack-build', 'stack-ghc']
        \ }
endif

setlocal omnifunc=necoghc#omnifunc
setlocal formatprg=stylish-haskell

nmap <buffer> <localleader>s :call ApplyOneSuggestion()<CR>
nmap <buffer> <localleader>p :Hoogle<space>

nnoremap <buffer> K :!open -a "/Applications/Google Chrome.app" 'https://hoogle.haskell.org/?hoogle=<c-r>=expand("<cword>")<cr>'<cr>

inoremap [<CR> [<CR>]<Esc>kA
inoremap {<CR> {<CR>}<Esc>kA

" Chords {{{

Arpeggiois cv ::<Space>
Arpeggiois <leader>rw -><Space>
Arpeggiois <leader>RW =><Space>
Arpeggio inoremap {} {}<Left>
Arpeggio inoremap .br {..}

Arpeggioibufsnipk lam lam
Arpeggioibufsnipcr fun fun
Arpeggioibufk frl forall<Space>

" Scoped declarations
Arpeggioibufcr let let<Space>
Arpeggioibufsnipcr lti letin
Arpeggioibufs whr where<CR>

" Type classes
Arpeggioibufcr cls class<Space>
Arpeggioibufcr int instance<Space>

" Operators
Arpeggioibufk <> <><Space>
Arpeggioibufk <Space>cm .<Space>

" Modules and imports
Arpeggioibufsnip mdl module
Arpeggioibufcr imp import<Space>
Arpeggioibufsnipcr imq importq

" Types
Arpeggioibufcr dat data<Space>
Arpeggioibufcr nwt newtype<Space>
Arpeggioibufcr typ type<Space>

" Deriving
Arpeggioibufcr dri deriving<Space>
Arpeggioibufs via via<Space>

" Control flow
Arpeggioibufsnipcr kes caseof
Arpeggioibufsnipcr ite ifthen
Arpeggioibufk whn when<Space>

" Utilities
Arpeggioibufk meb Maybe<Space>
Arpeggioibufk jst Just<Space>
Arpeggioibufs nth Nothing
Arpeggioibufk tex Text
Arpeggioibufk utc UTCTime
Arpeggioibufk lio liftIO<Space>
Arpeggioibufk thr throw<Space>
Arpeggioibufk pur pure<Space>
Arpeggioibufs tru True
Arpeggioibufs fal False
Arpeggioibufk cns const<Space>
Arpeggioibufsnip crb describe
Arpeggioibufk gfi getField<Space>@""<Left>
Arpeggioibufk gid getId<Space>

Arpeggioibufsnipcr lng language

" }}}
