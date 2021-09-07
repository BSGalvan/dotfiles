"Move to split below / above / left / right
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable folding with space
nnoremap <space> za

"Move current line up / down
nnoremap _ ddkP
nnoremap - ddp

"Show non-printing characters
"eg: EOL, trailing spaces, newlines, tabs etc.
nnoremap <F12> <cmd>set list!<CR>

"Alias :%s/<>/<>/gc with S
nnoremap S :%s///gc<Left><Left><Left><Left>

"Change to directory of current file
"Tip: useful if you're gonna T'scope some files
"     related to a project
nnoremap <leader>cd <cmd>cd %:p:h<CR>

"Tab navigation
nnoremap <leader>l <cmd>tabnext<CR>
nnoremap <leader>h <cmd>tabprev<CR>
nnoremap <leader>j <cmd>tablast<CR>
nnoremap <leader>k <cmd>tabfirst<CR>

"Tab management
nnoremap tn  <cmd>tabnew<CR>
nnoremap tc  <cmd>tabclose<CR>
nnoremap tm  :tabm<Space>
nnoremap te  :tabedit<Space>

"Open vertical/horizontal splits
nnoremap <Leader>s :split<Space>
nnoremap <Leader>v :vsplit<Space>
