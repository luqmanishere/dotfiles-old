function! autoneoformat#before() abort
  
endfunction


function! autoneoformat#after() abort

  augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
  augroup END

  set foldmethod=indent
  set noswapfile
  let g:airline_theme='nord'
  let g:coc_global_extensions = [
      \ 'coc-markdownlint',
      \ 'coc-python',
      \ 'coc-explorer',
      \ 'coc-clangd',
      \ 'coc-syntax',
      \ 'coc-git',
      \ 'coc-json',
      \ 'coc-cmake',
      \ 'coc-rls'
    \ ]

  let g:cpp_class_scope_highlight = 1
  let g:cpp_member_variable_highlight = 1
  let g:cpp_class_decl_highlight = 1
  let g:cpp_posix_standard = 1
  let g:cpp_concepts_highlight = 1

endfunction
