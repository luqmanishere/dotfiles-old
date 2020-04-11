function! autoneoformat#before() abort
  
endfunction


function! autoneoformat#after() abort

  augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
  augroup END

  set foldmethod=indent
  set noswapfile
endfunction
