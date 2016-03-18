"Highlight real tabs"
"Colors -> guibg={color-name} ctermgb={color-number}
"NR-16   NR-8    COLOR NAME ~
"0	     0	     Black
"1	     4	     DarkBlue
"2	     2	     DarkGreen
"3	     6	     DarkCyan
"4	     1	     DarkRed
"5	     5	     DarkMagenta
"6	     3	     Brown, DarkYellow
"7	     7	     LightGray, LightGrey, Gray, Grey
"8	     0*	     DarkGray, DarkGrey
"9	     4*	     Blue, LightBlue
"10	     2*	     Green, LightGreen
"11	     6*	     Cyan, LightCyan
"12	     1*	     Red, LightRed
"13	     5*	     Magenta, LightMagenta
"14	     3*	     Yellow, LightYellow
"15	     7*	     White

highlight Tab guibg=DarkCyan ctermbg=3
match Tab /\t/

" Allow only 80 columns for python code
if exists('+colorcolumn')
  highlight ColorColumn guibg=gray ctermbg=235
  set colorcolumn=80
endif
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
