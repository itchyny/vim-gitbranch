" =============================================================================
" Filename: autoload/gitbranch.vim
" Author: itchyny
" License: MIT License
" Last Change: 2014/05/09 13:05:42.
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! gitbranch#name()
  if has_key(b:, 'gitbranch_path')
    let branch = get(readfile(b:gitbranch_path), 0, '')
    if branch =~# '^ref: '
      return substitute(branch, '^ref: \%(refs/\%(heads/\|remotes/\|tags/\)\=\)\=', '', '')
    elseif branch =~# '^\x\{20\}'
      return branch[:6]
    endif
  endif
  return ''
endfunction

function! gitbranch#dir(path)
  let path = a:path
  let prev = ''
  while path != prev
    let dir = path . '/.git'
    let type = getftype(dir)
    if type == 'dir' && isdirectory(dir.'/objects') && isdirectory(dir.'/refs') && getfsize(dir.'/HEAD') > 10
      return dir
    endif
    let prev = path
    let path = fnamemodify(path, ':h')
  endwhile
  return ''
endfunction

function! gitbranch#detect(path)
  unlet! b:gitbranch_path
  let dir = gitbranch#dir(a:path)
  if dir != ''
    let path = dir . '/HEAD'
    if filereadable(path)
      let b:gitbranch_path = path
    endif
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
