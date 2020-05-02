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
      \ 'coc-spell-checker',
      \ 'coc-python',
      \ 'coc-explorer',
      \ 'coc-clangd',
      \ 'coc-syntax',
      \ 'coc-git',
      \ 'coc-json',
      \ 'coc-cmake'
    \ ]


endfunction
