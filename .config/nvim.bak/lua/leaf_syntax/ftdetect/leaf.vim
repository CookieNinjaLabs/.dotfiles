" ftdetect/leaf.vim

augroup leaf_filetype
  autocmd!
  autocmd BufRead,BufNewFile *.leaf set filetype=leaf
augroup END

