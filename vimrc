" configure tab to work with 4 spaces
set shiftwidth=4
set tabstop=8
set softtabstop=4
set expandtab

" activate syntax color
syntax on

" set to indent by filetype
filetype indent plugin on

" filetype off
set nocompatible
set smarttab
set shiftwidth=2
set autoindent
set number
set backspace=indent,eol,start

" set the colorscheme used
colorscheme slate

set encoding=utf8

" set colorcolumn=80
" highlight ColorColumn ctermbg=darkgray
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

set nobackup
set nowb
set noswapfile

set wildignore=*.o,*~,*.pyc

" Paste behaviour
set paste

" Tab navigation
map <C-l> :tabnext <cr>
map <C-j> :tabprevious <cr>

" Create a navigation 
map <C-n> :vsp . <bar> vertical resize 30 <cr>
let g:netrw_liststyle=3
let g:netrw_chgwin=2
