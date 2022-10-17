" Function keys
nnoremap <F7> :Git <CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Maximise a specific split
nnoremap <C-m> :only<CR>

" Standard vimmy stuff made easier
nnoremap <C-q> :q<CR>
nnoremap <C-s> :w<CR>

nnoremap <Leader>vsp :vsp<CR>
nnoremap <Leader>sp :sp<CR>

" Fugitive
nnoremap <Leader>g :Git 

" Vim Test
nnoremap <C-t>n :TestNearest<CR>
nnoremap <C-t>f :TestFile<CR>
nnoremap <C-t>l :TestLast<CR>
nnoremap <C-t>s :TestSuite<CR>
nnoremap <C-t>v :TestVisit<CR>

" Highlighting
nnoremap <Leader>nh :nohl<CR>

" Directory view
nnoremap <Leader>nt :NERDTreeToggle<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>
