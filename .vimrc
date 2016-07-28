" Load Pathogen
execute pathogen#infect()

" set runtimepath^=~/.vim/bundle/ctrlp.vim

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
set hidden
let mapleader=","
syntax on

"jump to beginning of the line
nmap E $
nmap B ^
vmap E $
vmap B ^

" Use native vim buffers, instead of CtrlP
nmap <LEADER>l :CtrlPBuffer<CR>
nmap <LEADER>b :b#<CR>
nmap <LEADER>bn :bnext<CR>
nmap <LEADER>bp :bprevious<CR>

"========== LEADER keys ===============
 
"Surround with ''
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>

"Surround with ""
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>

"Surround with ()
nnoremap <leader>) viw<esc>a) <esc>hbi(<esc>f<space>x

"Surround with []
nnoremap <leader>] viw<esc>a] <esc>hbi[<esc>f<space>x

nmap <LEADER>f :NERDTreeToggle<CR>
nmap <LEADER>c :NERDTreeFind<CR>
nmap <LEADER>q :q<CR>
nmap <LEADER>w :w<CR>
nmap <LEADER>a :set list!<CR>

" Save file with sudo permission (nice mapping)
nmap <LEADER>R :w !sudo tee %<CR>
nmap <LEADER>x :x<CR>
nmap <LEADER>p :pwd<CR>

" set current edit file as default directory NICE
nmap <LEADER>d :lcd %:p:h<CR>
nmap <LEADER>m :so $MYVIMRC<CR>
nmap <LEADER>v :vsplit <CR>
nmap <LEADER>s :split <CR>

" Tabs
nmap <LEADER>r :reg<CR>

"remove empty spaces
nmap <LEADER>t :%s/\s\+$//<CR>

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set number
set relativenumber

set noswapfile

set wildignore=*.o,*~,*.pyc,*.swp
let NERDTreeIgnore = ['\.pyc$']

" Paste behaviour
set paste

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

""------------ Mappings --------------"
"" Create tree navigation
autocmd VimEnter * if exists(":Lexplore") | exe "map <C-n> :Lexplore <CR>" | else | exe "map <C-n> :Vexplore <CR>" | endif

let g:netrw_liststyle=3
let g:netrw_chgwin=2
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_banner = 0
let g:netrw_winsize = -28
let g:netrw_list_hide= '.*\.swp$'
set splitright
set nocursorline
set nolist

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set shell=/bin/sh
set ruler

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

""Copy to clipboard
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>

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

"========= Navigation stuffs ==================
let g:NERDTreeWinSize=30
let g:NERDTreeWinPos="left"

" Ignore some extensions
set wildignore=*.class,*.zip,*.gif,*.png,*.md,*.pyc,*.swp,*.tar.*,*.pdf
