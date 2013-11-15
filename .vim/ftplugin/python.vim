"Highlight real tabs"
highlight Tab guibg=3 ctermbg=3
match Tab /\t/

" Allow only 80 columns for python code
if exists('+colorcolumn')
  set colorcolumn=81
endif
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
