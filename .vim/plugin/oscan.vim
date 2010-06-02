command! -nargs=* -complete=custom,railmoon#oscan#complete OScan :call railmoon#oscan#open(<f-args>)

" Remap to use - as the leader instead of 0, which interferes with going to
" the beginning of the line
nnoremap <silent> -t :OScan file<CR>
nnoremap <silent> -c :OScan file constructor<CR>
nnoremap <silent> -d :OScan file destructor<CR>
nnoremap <silent> -o :OScan file object<CR>
nnoremap <silent> -g :OScan file <C-R><C-W><CR>
nnoremap <silent> -s :OScan search<CR>
nnoremap <silent> -S :OScan multiline_search<CR>
nnoremap <silent> -as :OScan search_in_scope<CR>
nnoremap <silent> -b :OScan buffers<CR>
nnoremap <silent> -f :OScan files<CR>
nnoremap <silent> -F :OScan files <C-R>=fnamemodify(@%, ":t:r")<CR><CR><BS>
nnoremap <silent> -w :OScan windows<CR>
nnoremap <silent> -v :OScan vims<CR>
nnoremap <silent> -p :OScan paste<CR>
nnoremap <silent> -h :OScan changes<CR>
nnoremap <silent> -m :OScan marks<CR>
nnoremap <silent> -M :OScan marks global user<CR>
nnoremap <silent> -u :OScan taglist_under_cursor<CR>
nnoremap <silent> -n :OScan definition_declaration<CR>
nnoremap <silent> -e :OScan search_on_screen<CR>

function! s:FindPatternInFile(pattern)
    let search_pattern = @/
    let @/ = a:pattern
    OScan search
    let @/ = search_pattern
endfunction

nnoremap <silent> -i :call <SID>FindPatternInFile('^\s*#include')<CR>

" repeat last Oscan session
nnoremap <silent> -l :OScan last<CR>
nnoremap <silent> -k :OScan lastup<CR>
nnoremap <silent> -j :OScan lastdown<CR>

