"
" Filetype detection
"
augroup filetypedetect
	" Detect .txt as 'text'
    autocmd! BufNewFile,BufRead *.txt setfiletype text
augroup END

augroup filetypedetect
	" Detect .m as 'objc'
    autocmd! BufNewFile,BufRead *.m setfiletype objc
augroup END
