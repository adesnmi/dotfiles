" I kept the keybindings in a `.vim` file instead of a `.lua` module because
" there were issues with some keybindings in Lua.

" TODO: Revisit in nvim >= 0.6

" Neovim

" Terminal
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>
nnoremap <Leader>t :terminal<CR>

" Telescope
nnoremap <F2> :Telescope buffers<CR>
nnoremap <F3> :Telescope live_grep<CR>
nnoremap <F4> :Telescope git_files<CR>
nnoremap <F12> :Telescope help_tags<CR>

" Function key alternatives (looking at you, Touchbar!)
nnoremap <C-p> :Telescope git_files<CR>
nnoremap \     :Telescope live_grep<CR>
nnoremap <C-b> :Telescope buffers<CR> 

" Format
nnoremap ff :FormatWrite<CR> 
