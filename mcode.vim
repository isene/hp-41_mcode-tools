function! FixJDAmcode()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
	set expandtab
	retab
  call cursor(1,1)
	exec search("_FATEND")
	let sl = line(".")+1
  call cursor(sl,1)
	4,.delete
	%s/\(^\S\+\) /\1:/
	%s/ A... /.con 0x/
	%s/\(.con 0x...  \)      /\1;/
	%s/.con 0x...  ;  .F/./
	%s/.NAME      \(\S\+\).*/.NAME \1/
  call cursor(1,1)
	while search(" JC ", 'W') > 0
		normal yyp-0i;+
		s/^\(.\{11}\).con.\{23}\(\S\+\) .*/\1jc \2/
	endwhile
  call cursor(1,1)
	while search(" JNC ", 'W') > 0
		normal yyp-0i;+
		s/^\(.\{11}\).con.\{23}\(\S\+\) .*/\1jnc \2/
	endwhile
  call cursor(1,1)
	while search(" GOSUB ", 'W') > 0
		normal yyp-0i;+
		s/^\(.\{11}\).con.\{23}\(\S\+\) .*/\1RXQ \2/
		normal +0i;
		normal +0i;
	endwhile
  call cursor(1,1)
	while search(" GOTO ", 'W') > 0
		normal yyp-0i;+
		s/^\(.\{11}\).con.\{23}\(\S\+\) .*/\1RGO \2/
		normal +0i;
		normal +0i;
	endwhile
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

function! FixHPmcode()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
	set expandtab
	retab
  call cursor(1,1)
	exec search("_FATEND")
	let sl = line(".")+1
  call cursor(sl,1)
	4,.delete
	%s/\(^\S\+\) /\1:/
	%s/ A... /.con 0x/
	%s/\(.con 0x...  \)      /\1;/
	%s/.con 0x...  ;  .F/./
	%s/.NAME      \(\S\+\).*/.NAME \1/
  call cursor(1,1)
	while search(" GOC ", 'W') > 0
		normal yyp-0i;+
		s/^\(.\{11}\).con.\{23}\(\S\+\) .*/\1goc \2/
	endwhile
  call cursor(1,1)
	while search(" GONC ", 'W') > 0
		normal yyp-0i;+
		s/^\(.\{11}\).con.\{23}\(\S\+\) .*/\1gonc \2/
	endwhile
  call cursor(1,1)
	while search(" GSB41C ", 'W') > 0
		normal yyp-0i;+
		s/^\(.\{11}\).con.\{23}\(\S\+\) .*/\1RXQ \2/
		normal +0i;
		normal +0i;
	endwhile
  call cursor(1,1)
	while search(" GOL41C ", 'W') > 0
		normal yyp-0i;+
		s/^\(.\{11}\).con.\{23}\(\S\+\) .*/\1RGO \2/
		normal +0i;
		normal +0i;
	endwhile
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

nnoremap <Leader>fmh :call FixHPmcode()<CR>
nnoremap <Leader>fmj :call FixJDAmcode()<CR>

