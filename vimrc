" This file is the top-level vimrc, and is used by vim and neovim
" Therefore, this should contain configuration that is common to both
set encoding=utf-8

" Colours
syntax on
set termguicolors
set hidden

" Enable mouse support
set mouse=nv

" F1 help is annoying
:nmap <F1> <nop>
map <F1> <Esc>
imap <F1> <Esc>

" Leader
let mapleader = " "

" 2 spaces for indentation.
" More information: http://vimcasts.org/episodes/tabs-and-spaces/
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Numbers
set number
set numberwidth=5

" Disable swap
set noswapfile

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Plugins
if &compatible
  set nocompatible
end

" File specific commands
augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile
    \ aliases.local,
    \zshenv.local,zlogin.local,zlogout.local,zshrc.local,zprofile.local,
    \*/zsh/configs/*
    \ set filetype=sh
  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile vimrc.local set filetype=vim
augroup END

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Remove declared plugins
function! s:UnPlug(plug_name)
  if has_key(g:plugs, a:plug_name)
    call remove(g:plugs, a:plug_name)
  endif
endfunction
command!  -nargs=1 UnPlug call s:UnPlug(<args>)

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Set tags for vim-fugitive
set tags^=.git/tags

" General keybindings
source ~/.vim/keybindings.general.vim

let test#strategy = {
  \ 'nearest': 'asyncrun_background_term',
  \ 'file':    'asyncrun_background',
  \ 'suite':   'asyncrun_background',
\}

if has('nvim')
  " Nvim-only config
  source ~/.config/nvim/bundles.vim
  " TODO: define nvim keybindings natively
  source ~/.config/nvim/keybindings.vim
else
  " Vim-only config
  source ~/.vim/bundles.vim
  source ~/.vim/keybindings.vim
  source ~/.vim/vimrc.vim
endif

" Colours
colorscheme onedark
filetype plugin indent on
