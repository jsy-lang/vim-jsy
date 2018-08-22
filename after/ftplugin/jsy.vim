" Vim filetype plugin file
" Language:     JSY JavaScript dialect
" Maintainer:   vim-jsy community
" URL:          https://github.com/jsy-lang/vim-jsy

setlocal iskeyword+=$ suffixesadd+=.jsy

if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= ' | setlocal iskeyword< suffixesadd<'
else
  let b:undo_ftplugin = 'setlocal iskeyword< suffixesadd<'
endif
