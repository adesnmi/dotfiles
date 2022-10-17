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

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>


" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<Space>

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>
nnoremap ff :ALEFix<CR>

" FZF.vim
nnoremap <F2> :Buffers<CR>
nnoremap <F3> :Rg<CR>
nnoremap <F4> :GFiles<CR>
nnoremap <F12> :Helptags<CR>

" Function key alternatives (looking at you, Touchbar!)
nnoremap <C-p> :GFiles<cr>
nnoremap \     :Rg<CR>
nnoremap <C-b> :Buffers<cr>
