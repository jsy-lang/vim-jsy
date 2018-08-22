fun! s:SelectJSY()
  if getline(1) =~# '^#!.*/bin/\%(env\s\+\)\?jsy-node\>'
    set ft=jsy
  endif
endfun

augroup jsy_syntax_detection
  autocmd!
  autocmd BufNewFile,BufRead *.{jsy} setfiletype jsy
  autocmd BufNewFile,BufRead * call s:SelectJSY()
augroup END
