"Highlight real tabs"
highlight Tab guibg=3 ctermbg=3
match Tab /\t/

" Allow only 80 columns for python code
if exists('+colorcolumn')
  set colorcolumn=81
endif
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)


"----------- Pylint config ------------"

" Use pylint as python compiler "
autocmd FileType python compiler pylint

" Prevent pylint to be executed no save "
let g:pylint_onwrite = 0
let g:pylint_cwindow = 0

" If quickfix is open just close it if not run pylint and display results "
function! RunPylintOrHideQuickFix()
    if &bt == 'quickfix'
        cclose
    else
        cclose
        call Pylint(0)
    endif
"    redraw! " Force redraw everything to don't get a black (or blank) screen
endfunction

map <silent> <F4> :cp<CR>
map <silent> <F5> :cn<CR>
map <silent> <F6> :call RunPylintOrHideQuickFix()<CR>

