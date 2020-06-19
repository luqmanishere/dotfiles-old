function! autoneoformat#before() abort
 
endfunction


function! autoneoformat#after() abort

  " let g:nord_italic = 1
  " let g:nord_italic_comments = 1
   augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
  augroup END

  augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%101v.*/
  augroup END

  set foldmethod=indent
  set noswapfile
  let g:airline_theme='dracula'
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
  set tw=100

  " bye arrow keys
  noremap <Up> <NOP>
  noremap <Down> <NOP>
  noremap <Left> <NOP>
  noremap <Right> <NOP>

  inoremap kj <Esc>

endfunction
