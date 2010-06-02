"
" Settings for PHP filetype
"

" Load PHP Documentor for VIM
source ~/.vim/php-doc.vim

" Set up automatic formatting
set formatoptions+=tcqlro

" Jump to matching bracket for 3/10th of a second (works with showmatch)
set matchtime=3
set showmatch

" Set maximum text width (for wrapping)
set textwidth=80

"
" Syntax options
"
" Enable folding of class/function blocks
let php_folding = 1

" Do not use short tags to find PHP blocks
let php_noShortTags = 1

" Highlighti SQL inside PHP strings
let php_sql_query=1


"
" Linting
"
" Use PHP syntax check when doing :make
set makeprg=php\ -l\ %

" Parse PHP error output
set errorformat=%m\ in\ %f\ on\ line\ %l

" Function to locate endpoints of a PHP block {{{
function! PhpBlockSelect(mode)
	let motion = "v"
	let line = getline(".")
	let pos = col(".")-1
	let end = col("$")-1

	if a:mode == 1
		if line[pos] == '?' && pos+1 < end && line[pos+1] == '>'
			let motion .= "l"
		elseif line[pos] == '>' && pos > 1 && line[pos-1] == '?'
			" do nothing
		else
			let motion .= "/?>/e\<CR>"
		endif
		let motion .= "o"
		if end > 0
			let motion .= "l"
		endif
		let motion .= "?<\\?php\\>\<CR>"
	else
		if line[pos] == '?' && pos+1 < end && line[pos+1] == '>'
			" do nothing
		elseif line[pos] == '>' && pos > 1 && line[pos-1] == '?'
			let motion .= "h?\\S\<CR>""
		else
			let motion .= "/?>/;?\\S\<CR>"
		endif
		let motion .= "o?<\\?php\\>\<CR>4l/\\S\<CR>"
	endif

	return motion
endfunction
" }}}

" Mappings to select full/inner PHP block
nmap <silent> <expr> vaP PhpBlockSelect(1)
nmap <silent> <expr> viP PhpBlockSelect(0)
" Mappings for operator mode to work on full/inner PHP block
omap <silent> aP :silent normal vaP<CR>
omap <silent> iP :silent normal viP<CR>

" Mappings for PHP Documentor for VIM
inoremap <buffer> <C-P> <Esc>:call PhpDocSingle()<CR>i
nnoremap <buffer> <C-P> :call PhpDocSingle()<CR>
vnoremap <buffer> <C-P> :call PhpDocRange()<CR>
" Generate @uses tag based on inheritance info
let g:pdv_cfg_Uses = 1
" Set default Copyright
let g:pdv_cfg_Copyright = "Copyright (C) 2010 Andrei Zmievski"

" Exuberant Ctags
"
" Map <F4> to re-build tags file
nmap <silent> <F4>
		\ :!ctags -f ./tags 
		\ --langmap="php:+.inc"
		\ -h ".php.inc" -R --totals=yes
		\ --tag-relative=yes --PHP-kinds=+cf-v .<CR>

" Set tag filename(s)
set tags=./tags,tags

" Enable listchars, list to see non-printable symbols
" set listchars=tab:►·,trail:·,eol:↲
" set list

" vim: set fdm=marker:
