" Load Pathogen
" execute pathogen#infect()

" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

"" Default configuration in case there's no other definition in ftplugin
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

" File type off
set nocompatible
set smarttab
set autoindent
set smartindent
set backspace=indent,eol,start

" highlight ColorColumn ctermbg=darkgray
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

set wildignore=*.o,*~,*.pyc

" Paste behaviour
set paste

" Set background type"
set background=dark

"color scheme"
colorscheme elflord
" colorscheme delek
" colorscheme desert
" colorscheme default
"colorscheme PaperColor
  
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set number
set number

" status line
"set statusline=%(%F%m%r%h%w\ [%Y]\ %{&encoding}\ %)%=%(%l,%v\ %LL\ %p%%%)
set laststatus=2
set linespace=0
let g:airline_theme = 'badwolf'
let g:airline_theme = 'wombat'
let g:airline#extensions#hunks#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" Keep git sign column as default (+, -, ~, etc.)
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_max_signs = 10000

"tab config"
set ts=4
setlocal expandtab
setlocal softtabstop=4

" 4 spaces for indenting
set shiftwidth=4

"Disable autoindentation"
set noai

" Enable filetype plugins "
filetype plugin on

" Disable preview code when using omni complete"
set completeopt=menu

" Allow modelines"
set modelines=1

set spelllang=en,pt_br

" vim markdown settings
let g:vim_markdown_folding_disabled=1

" force vim to use 265 colors
" set term=screen+256color
" set term=screen-256color
"set term=screen-bce.konsole
"if match($TERM, "screen")!=-1
"  set term=xterm
"endif
set term=konsole-256color

" Set column and line highlight
set cursorcolumn
set cursorline
hi CursorLine term=bold ctermfg=Yellow gui=bold guifg=Yellow
hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow

""------------ Mappings --------------"
"
"" Create tree navigation
map <C-n> :vsp . <bar> vertical resize 30 <cr>
let g:netrw_liststyle=3
let g:netrw_chgwin=2
