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
nnoremap Q @q

" Allow mappings to use <C-c>
nnoremap <C-c> <nop>
" Disable <C-q>
nnoremap <C-q> <nop>

" . repeat in visual mode
vnoremap <silent> .   :norm.<CR>

" Clear highlighting on escape in normal mode
nnoremap <silent> <esc> :noh<CR><esc>

" Make {{{
nnoremap M<CR>        :wa<bar>make<CR>
nnoremap M<space>     :wa<bar>make<space>--<space>
" }}}

" Buffers {{{
noremap <C-q>          :Q<CR>
noremap <leader>w      :w<CR>
noremap <leader>r      :Buffers<CR>

noremap <leader><leader> :b#<CR>
noremap <BS><BS>         :b#<CR>
" }}}

" Marks {{{
nnoremap <silent> m<BS>  :delm!<CR>:delm A-Z0-9<CR>:SignatureRefresh<CR>
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

noremap <leader>8        #*cgn
noremap <leader>3        *#cgN
" }}}

" Links {{{
nmap <silent> gj      :call search('\[\[[^\]]\+\]\]', 's')<CR>
nmap <silent> gk      :call search('\[\[[^\]]\+\]\]', 'sb')<CR>
nmap gf               gF
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

" ALE [[./plugin/ale.vim]] {{{
nnoremap MF           :ALEFix<CR>
" }}}

" Completion [[./plugin/completion.vim]] {{{
inoremap <expr> <BS> pumvisible() ? "\<C-e>" : "\<BS>"
inoremap <expr> <CR> pumvisible() ? "<C-y><CR>" : "<CR>"
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
