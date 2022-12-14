let g:has_async = v:version >= 800 || has('nvim')

call plug#begin()

" General
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
Plug 'vim-test/vim-test'
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-mkdir'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/tComment'
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'github/copilot.vim'
Plug 'skywind3000/asyncrun.vim'

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
