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

"Disable autoindentation"
set noai

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
set cursorline
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

" Solution for symlinks on netrw
" Given by: http://inlehmansterms.net/2014/09/04/sane-vim-working-directories/

autocmd BufEnter * silent! lcd %:p:h

" follow symlinked file
function! FollowSymlink()
  let current_file = expand('%:p')
  " check if file type is a symlink
  if getftype(current_file) == 'link'
    " if it is a symlink resolve to the actual file path
    "   and open the actual file
    let actual_file = resolve(current_file)
    silent! execute 'file ' . actual_file
  end
endfunction

" set working directory to git project root
" or directory of current file if not git project
function! SetProjectRoot()
  " default to the current file's directory
  lcd %:p:h
  let git_dir = system("git rev-parse --show-toplevel")
  " See if the command output starts with 'fatal' (if it does, not in a git repo)
  let is_not_git_dir = matchstr(git_dir, '^fatal:.*')
  " if git project, change local directory to git project root
  if empty(is_not_git_dir)
    lcd `=git_dir`
  endif
endfunction


" follow symlink and set working directory
autocmd BufRead *
  \ call FollowSymlink() |
  \ call SetProjectRoot()


" netrw: follow symlink and set working directory
autocmd CursorMoved *
  " short circuit for non-netrw files
  \ if &filetype == 'netrw' |
  \   call FollowSymlink() |
  \   call SetProjectRoot() |
  \ endif
