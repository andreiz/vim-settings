"
" General things that should be done at the very end, to override plugin
" settings
"

" Function to do <Tab> or completion, based on context {{{
function MyTabOrCompletion()
	let col = col('.')-1
	if !col || getline('.')[col-1] !~ '\k'
		return "\<tab>"
	else
		return "\<C-N>"
	endif
endfunction
" }}}

"
" Map CTRL-B to snippetsEmu and use <Tab> for our smart completion
if exists('loaded_snippet')
	imap <C-B> <Plug>Jumper
endif
inoremap <Tab> <C-R>=MyTabOrCompletion()<CR>

"
" Customize taglist settings
if exists('loaded_taglist')
	let Tlist_Ctags_Cmd = "ctags"
	let Tlist_Enable_Fold_Column = 0
	let Tlist_Exit_OnlyWindow = 1
	let Tlist_File_Fold_Auto_Close = 1
	let Tlist_Inc_Winwidth = 1
	let Tlist_Max_Submenu_Items = 15
	let tlist_php_settings = 'php;c:class;d:constant;f:function'

	" map <F5> to toggle taglist window
	nmap <silent> <F5> :TlistToggle<CR>
endif

" Set CVS executable for VCSCommand plugin
if exists('loaded_VCSCommand')
	let VCSCommandCVSExec="cvs"
endif

" Set NERDTree options
if exists('loaded_nerd_tree')
	let NERDTreeWinPos = 'right'
	let NERDTreeWinSize=35
	nmap <silent> <F7> :NERDTreeToggle<CR>
endif

" Set Project options
if exists('loaded_project')
	let g:proj_run1='!php -l %f' 
endif

" vim: set fdm=marker:
