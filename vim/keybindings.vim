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
