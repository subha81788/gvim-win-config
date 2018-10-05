"============== Helper Functions ===============

fun! DiffSetup()
   " work around for e810 e97
   let opt = '-a --binary '
   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
   let arg1 = v:fname_in
   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
   let arg2 = v:fname_new
   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
   let arg3 = v:fname_out
   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
   if $VIMRUNTIME =~ ' '
     if &sh =~ '\<cmd'
       if empty(&shellxquote)
         let l:shxq_sav = ''
         set shellxquote&
       endif
       let cmd = '"' . $VIMRUNTIME . '\diff"'
     else
       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
     endif
   else
     let cmd = $VIMRUNTIME . '\diff'
   endif
   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
   if exists('l:shxq_sav')
     let &shellxquote=l:shxq_sav
   endif
endfun

fun! Format_WhiteSpace_RemoveTrailing()
    :%s/\s\+$//e
endfun

fun! Format_Inflection_ToCamelCase()
    :s/\v([a-z])_([a-z])/\1\u\2/g
endfun

fun! Format_Inflection_ToUnderscored()
    :s/\v([a-z])([A-Z])/\L\1_\2/g
endfun

fun! CheckTabs()
	if search("\t") != 0
		echohl ErrorMsg | ec "                                 !WARNING!                              "
					\ |              ec "There are tabs in the file, do you want to convert them to spaces? [Y/n]" | echohl None
		let choice = nr2char(getchar())
		if choice == 'y' || choice == "\<CR>"
			retab 2
		endif
	else
		return
	endif
endfun

function! EnsureDirExists ()
	let required_dir = expand("%:h")
	if !isdirectory(required_dir)
		call mkdir(required_dir, 'p')
	endif
endfunction

" screen stuff
fun! s:Sinit(filen)
	echo expand(a:filen)
	exec "ScreenShell cd " . expand(a:filen) . "; \\clear"
endfun

""" FocusMode
fun! ToggleFocusMode()
	if (&foldcolumn != 12)
		set laststatus=0
		set numberwidth=10
		set foldcolumn=12
		set noruler
		hi FoldColumn ctermbg=none
		hi LineNr ctermfg=0 ctermbg=none
		hi NonText ctermfg=0
	else
		set laststatus=2
		set numberwidth=4
		set foldcolumn=0
		set ruler
		"colorscheme SolarizedDark "re-call your colorscheme
	endif
endfun
nnoremap <F1> :call ToggleFocusMode()<cr>

" Unmap arrow keys in normal and insert mode
fun! ResetArrowKeys()
  nunmap <left>
  nunmap <right>
  nunmap <up>
  nunmap <down>
  iunmap <left>
  iunmap <right>
  iunmap <up>
  iunmap <down>
endfun

" Press <`> key to clear arrow keys mappings
nnoremap ` :call ResetArrowKeys()<CR>

" Insert comments marker //
fun! CInsertCommentMarker()
  nnoremap - :s/^/\/\//<CR>:nohlsearch<CR>
endfun

fun! PythonInsertCommentMarker()
  nnoremap - :s/^/#<CR>:nohlsearch<CR>
endfun

fun! VimInsertCommentMarker()
  nnoremap - :s/^/\"/<CR>:nohlsearch<CR>
endfun

" Clear all comment markers (one rule for all languages)
nnoremap _ :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>
