" Enable error files & error jumping.
set cf
" Number of things to remember in history.
set history=512
" Writes on make/shell commands
set autowrite
" Ruler on
set ruler
" Line wrapping off
set nowrap
" Time to wait after ESC (default causes an annoying delay)
set timeoutlen=250
" colorscheme vividchalk  " Uncomment this to set a default theme
" Formatting
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

" Visual
" Show matching brackets.
set showmatch
" Bracket blinking.
set mat=5
set list
" Show $ at end of line and trailing space as
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
" No blinking.
set novisualbell
" No noise.
set noerrorbells
" Always show status line.
set laststatus=2 
