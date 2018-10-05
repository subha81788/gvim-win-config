" Enhanced keyboard mappings
"==================================

" Unmap the arrow keys
nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <down> <nop>
inoremap <up> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Configure Y key to yank from cursor to end-of-line
" as expected
nmap Y y$

" Fast saving
" In normal mode F2 will save the file
nmap <F2> :w!<CR>
" In insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w!<CR>i

" In normal mode F3 clears highlights of previous search
nnoremap <silent><F3> :nohl<cr>

" Switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Run ctags file with F5
map <F5> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ completion when typing . -> or <C-o>
" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>

" In diff mode we use the spell check keys for merging
if &diff
  " diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " set the spellfile for new words - folders must exist
"  set spellfile=~/.vim/spellfile.add
"  map <M-Down> ]s
"  map <M-Up> [s
endif
"
" Pressing <leader>ss will toggle and untoggle spell checking
nmap <silent><leader>ss :setlocal spell!<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

" Press go to create a new line below cursor in norml mode
nnoremap go o<ESC>k

" press g<shift o> to create a new line above cursor in norml mode
nnoremap g<S-o> o<ESC>j
" in normal mode <ctrl j> will enter insert mode 'i', insert a carriage return '<cr>', leave insert mode '<esc>', go up a line 'k' and enter insert mode at the end of line 'A'
nnoremap <C-j> i<cr><esc>kA
" in normal mode <ctrl space> adds a space at cursor
nnoremap <C-space> i<space><esc>

" press 's to jump back to last position if search is performed using / or ?
nnoremap / ms/
nnoremap ? ms?
nnoremap <F8>:let @/='\<<CR>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" press leader key with following keys for quick pairs
inoremap <leader>' ''<ESC>i
inoremap <leader>" ""<ESC>i
inoremap <leader>( ()<ESC>i
inoremap <leader>{ {}<ESC>i
inoremap <leader>[ []<ESC>i

" Make search results appear in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Keep selection selected
vnoremap > >gv
vnoremap < <gv

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
nnoremap <C-t> :tabnew<cr>
nnoremap <C-w> :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (you want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
