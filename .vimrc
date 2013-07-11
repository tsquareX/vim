set nocompatible
colorscheme torte
set nowrap
set ignorecase
set smartcase
set incsearch
set smartcase  " ignore case, unless I dont want to
execute pathogen#infect()
syntax on
filetype on
filetype plugin indent on

" Setup tabbing/spacing 
set smartindent  
filetype indent on
set expandtab
set sts=3
set shiftwidth=3
set textwidth=120
"shortcut to indent entire file
nmap <F11> 1G=G
nmap F11 <ESC>1G=Ga
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+qf .<CR>
"map <F1> :ta %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>


"tags setup
function! BuildTagfileList()
python << EOF
import os
import sys
import vim
import glob
tagfiles = glob.glob("/home/tom/src-tags/tags-*")
tags_opt = vim.eval("&tags")
tags_opt = "set tags=tags"
for tagfile in tagfiles:
    tags_opt += ",%s" % tagfile
vim.command(tags_opt)
EOF
endfunction

call BuildTagfileList()

" vim taglist plugin
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)

"Status line settings
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L-%c\ (%p%%)]

"Hide buffer when not in window (to prevent relogin with FTP edit)
set bufhidden=hide

"Map doxygen programming templates to keys
function! PutFileTemplate()
    "put doxygen file template
    r~/.vim/templates/doxygen-file
endfunction

function! PutHeaderFileTemplate()
    "put doxygen file template
    r~/.vim/templates/doxygen-header-file
endfunction

function! PutImplFileTemplate()
    "put doxygen file template
    r~/.vim/templates/doxygen-impl-file
endfunction

function! PutCopyrightTemplate()
    "put doxygen file template
    r~/.vim/templates/doxygen-copyright
endfunction

function! PutPythonCopyrightTemplate()
    "put doxygen file template
    r~/.vim/templates/doxygen-python-copyright
endfunction

function! PutCFuncTemplate()
    "put doxygen file template
    r~/.vim/templates/doxygen-func
endfunction

nmap <C-H> :call PutFileTemplate()<CR>
nmap <C-J> :call PutImplFileTemplate()<CR>
nmap <C-F> :call PutCFuncTemplate()<CR>
nmap <C-C> :call PutCopyrightTemplate()<CR>

"Disable expandtabs for Makefiles
autocmd BufEnter ?akefile* set noet ts=8 sw=8 nocindent list lcs=tab:>-,trail:x
"C-k  or :man
runtime ftplugin/man.vim
"Set format options to continue new comment line automatically
set formatoptions+=r
map <C-Tab> :tn<CR>


"Set the font and size
set guifont=inconsolata\ Medium\ 10
"Hide toolbar
set guioptions-=T
set guioptions+=m

"Update vim path with additional system includes
"set path+=/usr/lib/pymodules/python2.6/**,/usr/lib/python2.6/dist-packages/**
"Setup python paths to enable gf command
python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
            vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
set suffixesadd+=h,py,c,cpp,cc,icc

"code completion goodness - omnifunc
set completeopt=menuone,menu,longest,preview
set ofu=syntaxcomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType cpp set omnifunc=ccomplete#Complete
"autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType cpp set omnifunc=ccomplete#CompleteCpp

"OmmniCppComplete
let OmniCpp_DisplayMode = 1
let OmniCpp_NamespaceSearch = 2
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "pri"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif


" The mapping will change the behavior of the <Enter> key when the popup menu is visible. 
" In that case the Enter key will simply select the highlighted menu item, just as <C-Y> does.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"the first will make <C-N> work the way it normally does; however, when the menu appears, 
"the <Down> key will be simulated. What this accomplishes is it keeps a menu item always highlighted. 
"This way you can keep typing characters to narrow the matches, and the nearest match will be 
"selected so that you can hit Enter at any time to insert it. In the above mappings, the second one 
"is a little more exotic: it simulates <C-X><C-O> to bring up the omni completion menu, then it 
"simulates <C-N><C-P> to remove the longest common text, and finally it simulates <Down> again 
"to keep a match highlighted.
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


hi Pmenu guibg=brown gui=bold

" Make it easy to update vimrc
:nmap ,s :source ~/.vimrc<CR>
:nmap ,v :e ~/.vimrc<CR>

" Code helper abbreviations
abbreviate aberr syslog(LOG_ERR, "");<CR>perror("");
abbreviate abp dbnprintf(128, "%9.6f: ", get_rel_time()/dbillion);

" Setup vim temp and swap directory to a common location to keep swaps from
" littering the source tree.
if has("win32") || has("win64")
    set directory=$TMP
else
    set directory=~/.vim/tmp
end

" 120 column 
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" ctrl-p operation
:let g:ctrlp_match_window_bottom = 0 " put match window at top
:let g:ctrlp_match_window_reversed = 0
:let g:cstrp_custom_ignore = '\v\-$|\.(o|swp|pyc|.dblite)$|(^|[/\\])\.(hg|git|bzr)'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0

" Nerd tree
:nmap \t :NERDTreeToggle<CR>

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
endif

"
" FSwitch setup
"
au! BufEnter *.cpp let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = 'rel:.,../local,../public'
au! BufEnter *.h* let b:fswitchdst = 'cpp,c' | let b:fswitchlocs = 'rel:.,../local,../public'
map <F1> :FSHere<CR>
:let g:fsnonewfiles=1

source $VIMRUNTIME/mswin.vim
