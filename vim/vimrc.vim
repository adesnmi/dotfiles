" ALE linting events
augroup ale
  autocmd!

  if g:has_async
    autocmd VimEnter *
      \ set updatetime=1000 |
      \ let g:ale_lint_on_text_changed = 0
    autocmd CursorHold * call ale#Queue(0)
    autocmd CursorHoldI * call ale#Queue(0)
    autocmd InsertEnter * call ale#Queue(0)
    autocmd InsertLeave * call ale#Queue(0)
  else
    echoerr "The thoughtbot dotfiles require NeoVim or Vim 8"
  endif
augroup END

let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_linters = {
\   'javascript': ['prettier'],
\   'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'ruby': ['rubocop'],
\}

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  endif
endif

" Vim Airline
let g:airline_theme='onedark'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
