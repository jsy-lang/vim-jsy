fun! s:SelectJSY()
  if getline(1) =~# '^#!.*/bin/\%(env\s\+\)\?jsy-node\>'
    set filetype=jsy
  endif
endfun

fun! s:DetectJSY()
  let l:found = search('\(::{}\|::()\|::\[\]\|::\|@{}\|@:\|@\[\]\|@#\|@=>>?\|@()\)\(\W\|$\)', 'n', 250)
  if l:found > 0
    set filetype=jsy
  endif
endfun

augroup jsy_syntax_detection
  autocmd!
  autocmd BufNewFile,BufRead *.{jsy} setfiletype jsy
  autocmd BufNewFile,BufRead *.{js} call s:DetectJSY()
  autocmd BufNewFile,BufRead * call s:SelectJSY()
augroup END
