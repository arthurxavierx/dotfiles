" vim: fdm=marker:fdl=0:
let mapleader = "\<space>"
nnoremap <space> <nop>

set pastetoggle=<F3>

noremap ; :
noremap ç ;
noremap \ /
noremap <C-c> <C-a>

" Yank to end of line
nnoremap Y y$
" Disable ex mode and man page
nnoremap Q <nop>

" . repeat in visual mode
vnoremap <silent> .   :norm.<CR>

" Clear highlighting on escape in normal mode
nnoremap <silent> <esc> :noh<CR><esc>

" Make {{{
nnoremap m<CR>        :wa<bar>make<CR>
nnoremap m<space>     :wa<bar>make<space>--<space>
" }}}

" Buffers {{{
noremap <leader>w      :w<CR>
noremap <leader>r      :Buffers<CR>
noremap <silent> <C-q> :Kwbd<CR>
" }}}

" Files {{{
noremap <leader>t     :Files<CR>
"" go-to-file without wildignore
noremap <silent> <leader>gf :call lib#GotoFile()<CR>
" }}}

" Find {{{
noremap <leader>ff       :Files<CR>
noremap <leader>fb       :Buffers<CR>
noremap <leader>fa       :Ag<CR>
noremap <leader>fl       :Lines<CR>
noremap <leader>f'       :Marks<CR>
noremap <leader>f"       :Marks<CR>
noremap <leader>fm       :Maps<CR>
noremap <leader>fh       :History<CR>
noremap <leader><leader> :Commands<CR>
" }}}

" Panes {{{
"" resize
noremap <silent> <S-up>     :resize +5<CR>
noremap <silent> <S-down>   :resize -5<CR>
noremap <silent> <S-right>  :vertical resize +5<CR>
noremap <silent> <S-left>   :vertical resize -5<CR>
noremap <C-w>m              <C-w>\|<C-w>_
noremap <C-w><C-m>          <C-w>\|<C-w>_
" }}}

" Tabs {{{
noremap <C-t><C-t>          gt
noremap <C-t><C-x>          :tabclose<CR>
noremap <C-t><C-n>          <C-w><C-n><C-w>T
noremap <C-w><C-t>          <C-w>T
" Override vim-unimpaired's t to switch between tabs
autocmd VimEnter * noremap ]t gt
autocmd VimEnter * noremap [t gT
autocmd VimEnter * noremap ]T :tablast<CR>
autocmd VimEnter * noremap [T :tabfirst<CR>
" }}}

" Complete  {{{
inoremap <expr> <BS>  pumvisible() ? "\<C-E>" : "\<BS>"
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr> <cr>  mucomplete#popup_exit("\<cr>")
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
