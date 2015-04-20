" Load Pathogen
execute pathogen#infect()

" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" Set background type"
set background=dark

"color scheme"
" colorscheme elflord
" colorscheme delek
" colorscheme desert
colorscheme default

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Disable mouse "
set mouse=

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" highlight strings inside C comments
let c_comment_strings=1

"color syntax"
syn on
set encoding=UTF-8

"status line"
"set statusline=%(%F%m%r%h%w\ [%Y]\ %{&encoding}\ %)%=%(%l,%v\ %LL\ %p%%%)
set laststatus=2
set linespace=0
"let g:airline_theme = 'badwolf'
let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1

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

"------------ Mappings --------------"

"+ and - to resize splited windows"
map - <C-W>-
map = <C-W>+

" Make tab in v mode work like I think it should (keep highlighting):
vmap <tab> >gv
vmap <s-tab> <gv


"--------------- Setting last updated ---------------"
" Expand "<!-- DATE -->{-}00:00:00" to current timestamp in English
" Used in my resume!

:au BufWritePre *.html exe "norm mz"|exe '%s/\(<!-- DATE -->\).\{-\}\d\d:\d\d:\d\d/\1'.strftime("%b %d, %Y %X")."/e"|norm `z
:au BufWritePre *.html exe "norm mz"|exe '%s/\(data-lastupdate datetime=\"\)\d\d\d\d-\d\d-\d\d/\1'.strftime("%Y-%m-%d")."/e"|norm `z
