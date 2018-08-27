" Vim indent file
" Language:     JSY jsy dialect
" Maintainer:   vim-jsy community
" URL:          https://github.com/jsy-lang/vim-jsy

" Only load this indent file when no other was loaded.
if exists('b:did_indent')
  finish
endif
let b:did_indent = 1

setlocal autoindent nolisp nosmartindent
setlocal indentexpr=GetJSYIndent()
"setlocal indentkeys=

let b:undo_indent = 'setlocal indentexpr< smartindent< autoindent< indentkeys<'

" Only define the function once.
if exists('*GetJSYIndent')
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" Get shiftwidth value
if exists('*shiftwidth')
  function s:sw()
    return shiftwidth()
  endfunction
else
  function s:sw()
    return &l:shiftwidth ? &l:shiftwidth : &l:tabstop
  endfunction
endif

function GetJSYIndent()
  let l:prev_lnum = prevnonblank(v:lnum - 1)
  let l:prev_line = getline(l:prev_lnum)
  let l:found = (l:prev_line =~ '\(::{}\|::()\|::\[\]\|::\|@{}\|@:\|@\[\]\|@#\|@()\)\(\W\|$\)')

  if l:found > 0
    return indent(l:prev_lnum) + &tabstop
  else
    return -1
  endif
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save

