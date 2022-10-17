let g:has_async = v:version >= 800 || has('nvim')

call plug#begin()

" General
source ~/.vim/bundles.shared.vim

" Define bundles via Github repos
Plug 'christoomey/vim-run-interactive'

" If fzf has already been installed via Homebrew, use the existing fzf
" Otherwise, install fzf. The `--all` flag makes fzf accessible outside of vim
if isdirectory("/usr/local/opt/fzf")
  Plug '/usr/local/opt/fzf'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
endif

Plug 'junegunn/fzf.vim'

if g:has_async
  Plug 'dense-analysis/ale'
endif

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if filereadable(expand("~/.vim/bundles.vim.local"))
  source ~/.vim/bundles.vim.local
endif

call plug#end()
