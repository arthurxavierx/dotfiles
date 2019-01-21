" vim: fdm=marker:fdl=0:
let mapleader = "\<space>"
let maplocalleader = "\<space>p"
nnoremap <space> <nop>

set pastetoggle=<F3>

noremap ; :
noremap ç ;
noremap Ç ,
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

nnoremap <C-m> <C-i>

map <C-g> :call lib#EchoHighlightGroup()<CR>

" Make arrow keys work inside tmux
" map ^[B <Down>

" VIMRC {{{
nmap <leader>ve       :e $MYVIMRC<CR>
nmap <leader>vt       :e $DOTFILES/tmux.conf<CR>
nmap <leader>vs       :UltiSnipsEdit<CR>
nmap <leader>vy       :e $DOTFILES/vim/symbols<CR>
nmap <leader>vR       :so $MYVIMRC<CR>
" }}}

" Make {{{
nnoremap M<CR>        :wa<bar>make<CR>
nnoremap M<space>     :wa<bar>make<space>--<space>
" }}}

" Buffers {{{
noremap <C-q>          :Q<CR>
noremap <leader>w      :w<CR>
noremap <leader>r      :Buffers<CR>
nnoremap <leader><BS>  :b#<CR>
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
noremap <leader>fh        :History<CR>
noremap <leader>f<leader> :Commands<CR>
noremap <leader>fs        :Snippets<CR>

noremap <leader>8        #*cgn
noremap <leader>3        *#cgN
" }}}

" Links [[plugin/links.vim]] {{{
map <Tab>            <Plug>(NextLink)
map <S-Tab>          <Plug>(PrevLink)
map gf               gF
" }}}

" Panes {{{
noremap <C-w><C-c>          <C-w><C-n>
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
inoremap <expr> <BS> pumvisible() ? "\<C-e>" : "\<BS>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"

imap <expr> <left>  mucomplete#extend_bwd("\<left>")
imap <expr> <right> mucomplete#extend_fwd("\<right>")
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
