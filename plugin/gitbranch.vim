" =============================================================================
" Filename: plugin/gitbranch.vim
" Author: itchyny
" License: MIT License
" Last Change: 2014/12/14 14:23:30.
" =============================================================================

if exists('g:loaded_gitbranch') || v:version < 700
  finish
endif
let g:loaded_gitbranch = 1

let s:save_cpo = &cpo
set cpo&vim

augroup GitBranch
  autocmd!
  autocmd BufNewFile,BufReadPost,BufEnter * call gitbranch#detect(expand('<amatch>:p:h'))
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
