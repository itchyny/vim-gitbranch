" =============================================================================
" Filename: plugin/gitbranch.vim
" Author: itchyny
" License: MIT License
" Last Change: 2014/04/27 13:18:26.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

augroup GitBranch
  autocmd!
  autocmd BufNewFile,BufReadPost,BufEnter * call gitbranch#detect(expand('<amatch>:p:h'))
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
