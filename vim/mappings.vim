" vim: fdm=marker:fdl=0:
let mapleader = "\<space>"
let maplocalleader = "\<space>p"
nnoremap <space> <nop>

set pastetoggle=<F3>

noremap \ /

" Yank to end of line
nnoremap Y y$
" Disable ex mode
noremap Q @q

" Visual @
xnoremap <silent> @ :<C-u>call lib#ExecuteMacroOverVisualRange()<CR>

" Allow mappings to use <C-c>
nnoremap <C-c> <nop>
" Disable <C-q>
nnoremap <C-q> <nop>

" . repeat in visual mode
vnoremap <silent> .   :norm.<CR>

" Clear highlighting on escape in normal mode
nnoremap <silent> <esc> :noh<CR><esc>

" map <C-g> :call lib#EchoHighlightGroup()<CR>

" Make arrow keys work inside tmux
" map ^[B <Down>

" TODO: documentation
nnoremap cg*              #*cgn
nnoremap cg#              *#cgN

" Alt-backspace deletes words
inoremap <M-BS> <C-w>
cnoremap <M-BS> <C-w>
inoremap <M-b> <S-Left>
cnoremap <M-b> <S-Left>
inoremap <M-f> <S-Right>
cnoremap <M-f> <S-Right>

" TODO: documentation
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" Configs {{{
nmap <leader>ve       :e $MYVIMRC<CR>
nmap <leader>vt       :e $DOTFILES/tmux.conf<CR>
nmap <leader>vs       :UltiSnipsEdit<CR>
nmap <leader>vy       :e $DOTFILES/vim/symbols<CR>
nmap <leader>vf       :call lib#FtPluginEdit('$DOTFILES/vim')<CR>
nmap <leader>vd       :exe 'e '.dict#Dict(&ft)<CR>
nmap <leader>vR       :so $MYVIMRC<CR>
" }}}

" Make {{{
nnoremap M<CR>        :wa<bar>make!<CR>
nnoremap M<space>     :wa<bar>make!<space>--<space>
" }}}

" Buffers {{{
noremap <C-q>          :Q<CR>
noremap <leader>w      :w<CR>
noremap <leader>r      :Buffers<CR>
nnoremap <BS><BS>      :b#<CR>
" }}}

" Files {{{
noremap <leader>t     :Files<CR>
"" [[ftplugin/dirvish.vim]]
nmap <nowait><silent> \| <Plug>(dirvish_up)
" }}}

" Find {{{
noremap <leader>ff        :Files<CR>
noremap <leader>fb        :Buffers<CR>
noremap <leader>fa        :Ag<CR>
noremap <leader>fl        :Lines<CR>
noremap <leader>f'        :Marks<CR>
noremap <leader>f"        :Marks<CR>
noremap <leader>fm        :Maps<CR>
noremap <leader>fh        :Helptags<CR>
noremap <leader>f<leader> :Commands<CR>
noremap <leader>fs        :Snippets<CR>
" }}}

" Links [[plugin/links.vim]] {{{
map gl               <Plug>(NextLink)
map gL               <Plug>(PrevLink)
map gf               gF
" }}}

" Windows {{{
noremap <C-w><C-p>          <C-w>z
"" resize
noremap <silent> <S-up>     :resize +5<CR>
noremap <silent> <S-down>   :resize -5<CR>
noremap <silent> <S-right>  :vertical resize +5<CR>
noremap <silent> <S-left>   :vertical resize -5<CR>
noremap <C-w>m              <C-w>\|<C-w>_
noremap <C-w><C-m>          <C-w>\|<C-w>_
"" focus mode
noremap <silent> <leader><leader> :Focus 22<CR>
" }}}

" Tabs {{{
noremap <C-t><C-t>          gt
noremap <C-t><C-x>          :tabclose<CR>
noremap <C-t><C-c>          <C-w><C-n><C-w>T
noremap <C-w><C-t>          <C-w>T
noremap ]<Tab>              gt
noremap [<Tab>              gT
noremap ]<S-Tab>            :tablast<CR>
noremap [<S-Tab>            :tabfirst<CR>
" }}}

" ALE {{{
nnoremap MF           :ALEFix<CR>
" }}}

" Completion [[plugin/completion.vim]] {{{

" " Cancel completion with <BS>
" inoremap <expr> <BS> pumvisible() ? "\<C-e>" : "\<BS>"
" " Close completion popup with <CR>
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

inoremap <expr> <Tab> compe#complete()
inoremap <expr> <CR> compe#confirm('<CR>')
inoremap <expr> <BS> compe#close('<BS>')

" imap <expr> <Left> mucomplete#extend_bwd("\<Left>")
" imap <expr> <Right> mucomplete#extend_fwd("\<Right>")

" function! TryUltiSnips() abort
"   if !pumvisible() " With the pop-up menu open, let Tab move down
"     call UltiSnips#ExpandSnippet()
"   endif
"   return ''
" endfunction

" fun! TryMUcomplete()
"   return exists('g:ulti_expand_res') && g:ulti_expand_res ? "" : "\<Plug>(MUcompleteFwd)"
" endf

" inoremap <Plug>(TryUltiSnips) <C-r>=TryUltiSnips()<CR>
" imap <expr> <silent> <Plug>(TryMUcomplete) TryMUcomplete()

" au BufEnter * exe 'imap <expr> <silent> ' . g:UltiSnipsExpandTrigger . ' "\<Plug>(TryUltiSnips)\<Plug>(TryMUcomplete)"'
" au BufEnter * exe 'inoremap <expr> <silent> ' . g:UltiSnipsJumpForwardTrigger . ' pumvisible() ? "\<C-n>" : "\<C-r>=UltiSnips#JumpForwards()<CR>"'
" au BufEnter * exe 'inoremap <expr> <silent> ' . g:UltiSnipsJumpBackwardTrigger . ' pumvisible() ? "\<C-p>" : "\<C-r>=UltiSnips#JumpBackwards()<CR>"'

" function! IsBehindDir()
"   return strpart(getline('.'), 0, col('.') - 1)  =~# '\f\+/$'
" endfunction

" imap <expr> / pumvisible() && IsBehindDir()
"       \ ? "\<c-y>\<plug>(MUcompleteFwd)"
"       \ : '/'

" }}}

" CamelCaseMotion {{{
map <silent> -              <Plug>CamelCaseMotion_e
map <silent> _              <Plug>CamelCaseMotion_b
sunmap -
sunmap _
omap <silent> i-            <Plug>CamelCaseMotion_ie
xmap <silent> i-            <Plug>CamelCaseMotion_ie
omap <silent> i_            <Plug>CamelCaseMotion_ib
xmap <silent> i_            <Plug>CamelCaseMotion_ib
" }}}

" Terminal mode {{{
if (has("nvim"))
  tnoremap <silent> <Esc>   <C-\><C-n>
endif
" }}}

" Difftool {{{
if &diff
  map <leader>1 :diffget LOCAL<CR>
  map <leader>2 :diffget BASE<CR>
  map <leader>3 :diffget REMOTE<CR>
endif
" }}}

command! ClearRegisters for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
