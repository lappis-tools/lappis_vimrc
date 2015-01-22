" activate syntax color
syntax on

" set to indent by filetype
filetype indent plugin on

" default tab configuration in case there's no other definition in ftplugin
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

" filetype off
set nocompatible
set smarttab
set autoindent
set smartindent
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
