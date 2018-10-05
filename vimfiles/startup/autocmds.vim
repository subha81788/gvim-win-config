" Customized autocommands
"==========================================
if exists("did_load_filetypes")
  finish
endif

if has("autocmd")
    " Load vimrc on the fly
    autocmd bufwritepost .vimrc source $MYVIMRC

    " Trim trailing white spaces on save
    autocmd FileType c,cpp,java,cs,python,tcl,php,vim autocmd BufWritePre <buffer> call Format_WhiteSpace_RemoveTrailing()

    " Turn spell check on for text file only
    autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us

    " Turn omni completion on
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete

    if exists("+omnifunc")
         autocmd Filetype *
       \ if &omnifunc == "" |
       \   setlocal omnifunc=syntaxcomplete#Complete |
       \ endif
    endif

    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
    endif

" in normal mode press '-' key to comment a line and '_' key to uncomment it.
" set filetype on
augroup vimrc_filetype
autocmd!
autocmd FileType c,cpp,java,cs call CInsertCommentMarker()
autocmd FileType python,tcl call PythonInsertCommentMarker()
autocmd FileType vim call VimInsertCommentMarker()
augroup end


" Make bash syntax highlighting the default for
" all files with filetype=sh
augroup filetypedetect
  au! BufRead,BufNewFile *bash* let b:is_bash = 1 | setfiletype sh
augroup END
