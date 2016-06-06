" Load Pathogen
execute pathogen#infect()

" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" Default configuration in case there's no other definition in ftplugin
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set smartindent
syntax on

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set number

set noswapfile

set wildignore=*.o,*~,*.pyc,*.swp

" Paste behaviour
set paste

"color scheme"
" colorscheme elflord
" colorscheme delek
" colorscheme desert
" colorscheme PaperColor
colorscheme default

" Set background type
set background=dark

" status line
" set statusline=%(%F%m%r%h%w\ [%Y]\ %{&encoding}\ %)%=%(%l,%v\ %LL\ %p%%%)
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set laststatus=2
set linespace=0
" let g:airline_theme = 'badwolf'"let g:airline_theme = 'wombat'
let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" Keep git sign column as default (+, -, ~, etc.)
" let g:gitgutter_override_sign_column_highlight = 0
" let g:gitgutter_max_signs = 10000

" Enable filetype plugins "
filetype plugin on

" Disable preview code when using omni complete"
set completeopt=menu

" Allow modelines
set modelines=1

" set spelllang=en,pt_br

" vim markdown settings
let g:vim_markdown_folding_disabled=1

" force vim to use 265 colors
if match($XDG_CURRENT_DESKTOP, "KDE") != -1
  set term=konsole-256color
elseif match($XDG_CURRENT_DESKTOP, "GNOME") != -1
  set term=gnome-256color
elseif match($XDG_CURRENT_DESKTOP, "XFCE") != -1
  set term=xfce
else
  set term=xterm-256color
endif

" Set column and line highlight
" set cursorcolumn
" set cursorline
" hi CursorLine term=bold ctermfg=Yellow gui=bold guifg=Yellow
" hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow

""------------ Mappings --------------"
"" Create tree navigation
autocmd VimEnter * if exists(":Lexplore") | exe "map <C-n> :Lexplore <CR>" | else | exe "map <C-n> :Vexplore <CR>" | endif

let g:netrw_liststyle=3
let g:netrw_chgwin=2
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_banner = 0
let g:netrw_winsize = -28
let g:netrw_list_hide= '.*\.swp$'

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set shell=/bin/sh
set ruler

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
"" noremap XX "+x<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
augroup END
