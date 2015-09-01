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
" colorscheme default
colorscheme PaperColor

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

" status line
"set statusline=%(%F%m%r%h%w\ [%Y]\ %{&encoding}\ %)%=%(%l,%v\ %LL\ %p%%%)
set laststatus=2
set linespace=0
"let g:airline_theme = 'badwolf'
let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled = 0
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
set term=screen-256color

"------------ Mappings --------------"

"+ and - to resize splited windows"
map - <C-W>-
map = <C-W>+

" Make tab in v mode work like I think it should (keep highlighting):
vmap <tab> >gv
vmap <s-tab> <gv

nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
