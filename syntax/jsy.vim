" Vim filetype plugin file
" Language:     JSY jsy dialect
" Maintainer:   vim-jsy community
" URL:          https://github.com/jsy-lang/vim-jsy

if !exists("main_syntax")
  " quit when a syntax file was already loaded
  if exists("b:current_syntax")
    finish
  endif

  " build on javascript syntax
  runtime! syntax/jsy-javascript.vim

  let main_syntax = 'jsy'
elseif exists("b:current_syntax") && b:current_syntax == "jsy"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match jsyAtArrowOperator "@=>\|@=>>"
syn match jsyAtOperator "@{}\|@:\|@\[\]\|@#\|@()\|@"
syn match jsyDblColOperator "::()\|::{}\|::\[\]\|::"

syn region jsyPreProc start="^\s*#\s*\w\+" skip="\\$" end="$" keepend

" options: Special Function Operator
hi def link jsyAtOperator          Special
hi def link jsyAtArrowOperator     Special
hi def link jsyDblColOperator      Special
hi def link jsyPreProc             PreProc


let b:current_syntax = "jsy"
if main_syntax == 'jsy'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=4 sw=4 expandtab
