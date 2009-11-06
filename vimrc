set nocompatible
let mapleader = "," " set mapleader to comma instead of backslash
set backspace=indent,eol,start
set hidden
set history=200     " number of lines of history to remember
set title
set ruler
set number          " line numbers
set hlsearch        " highlight searches
"set cursorline      " highlight line for cursor position
"set spell          " turn on spell check
set cmdheight=2     " make command lines 2 high
syntax on           " syntax highlighting
set autoread        " reload file when changed elsewhere
set tabstop=4       " number of spaces for a tab
set expandtab       " convert tabs to spaces
set softtabstop=4   " using 4 spaces
set shiftwidth=4    " number of spaces to autoindent
set scrolloff=3     " keep 3 lines when scrolling
set mousehide       " hide pointer when typing
set ttyfast         " smoother changes
set dictionary+=/usr/share/dict/words " set dictionary for autocomplete

set autoindent      " use idention from above line in new line
set wildmenu        " better tab completion for :commands

set clipboard+=unnamed		" yank/delete use system clipboard
set clipboard+=autoselect	" Selecting with the mouse in xterm auto-yanks.
set clipboard+=exclude:screen	" Can't reliably connect to X11 from inside.

filetype plugin indent on " turn on plugins and indention
autocmd BufEnter * :sil! lcd %:p:h " switch to file's dir
set tags=tags;/


set ignorecase "Ignore case when searching
" smartcase, overrides 'ignorecase' when pattern has upper case characters
set scs
set incsearch

" Folding
set nofen
set fdl=0

set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

"nmap <c-s> :w<CR>
"vmap <c-s> <esc><c-s>
"imap <c-s> <esc><c-s>


"---- Options for Windows
if has("gui_running")
	set guioptions-=T " no toolbar
	set guioptions-=m " no menubar
	set guioptions-=r " no right scrollbar
	set guioptions+=R " unless needed
	set guioptions-=l " no left scrollbar
	set guioptions+=L " unless needed
	set guifont=Liberation\ Mono\ 8
	set lines=75          " height = 50 lines
	set columns=180       " width = 100 columns
	set background=dark   " adapt colors for background
	"set selectmode=mouse,key,cmd
	set mousehide
	"colorscheme darkspectrum
	colorscheme hornet
	"colorscheme wombat
	"colorscheme darkburn
else
	set background=dark   " adapt colors for dark background
	colorscheme hornet " use this color scheme
endif

" turn off hilighted search terms
map <leader>n :nohls<CR>

",v brings up my .vimrc
"",V reloads it -- making all changes active (have to save first)
map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

map <C-n> :NERDTreeToggle<CR>
map <leader>t :TlistToggle<CR>
let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1


" snipMate setup
let g:snips_author = 'Matt McKeon'

" shortcuts for sessionman
map <leader>l :SessionList<CR>
map <leader>s :SessionSave<CR>

" lets make quicker
map <leader>m :make<CR>

" quickly reformat newlines from windows editors
map <leader>w :%s/\r//g<CR>
map <leader>W :%s/\r/\r/g<CR>

" blowout trailing whitespaces,
" they make baby jesus cry
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

let g:EnhCommentifyRespectIndent = 'Yes'

" Shortcuts for dealing with splits easier {{{
map <C-j> <C-W>j
map <C-k> <C-W>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" use + and - to resize horizontal splits
map - <c-w>-
map + <c-w>+
" and for vsplits with alt-< or alt->
map <M-,> <C-W><
map <M-.> <C-W>>
" }}}

" mapping to make movements operate on 1 screen line in wrap mode {{{
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")
"}}}

" setup omnicompletion for file types {{{
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
imap <C-f> <C-x><C-o>
"}}}

" making tabs fun again!
noremap <silent> <c-tab> :tabn <cr>
noremap <silent> <c-s-tab> :tabp <cr>
noremap <silent> <c-t> :tabnew<cr>

" Switching tabs with Alt-1,2,3 in gvim
map		<A-1>		1gt
map		<A-2>		2gt
map		<A-3>		3gt
map		<A-4>		4gt
map		<A-5>		5gt
map		<A-6>		6gt
map		<A-7>		7gt
map		<A-8>		8gt
map		<A-9>		9gt


" setup php-doc
source ~/.vim/plugin/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>


" Run php lint test
map <F9> :w<CR>:!php -l %<CR>
" toggle paste mode
map <F8> :set paste!<Bar>set paste?<CR>
" toggle spell checking
map <F7> :set spell!<Bar>set spell?<CR>

if !exists("mm_filetype_config")
	let mm_filetype_config = 1

	" setup actionscript filetypes
	autocmd BufNewFile,BufRead *.mxml set filetype=mxml
	autocmd BufNewFile,BufRead *.as set filetype=actionscript

	" Turn on spelling in subversion/git commits
	autocmd BufNewFile,BufRead svn-commit.* set spell
	autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell

	" chage :make for different languages
	autocmd FileType php set makeprg=php\ -l\ %
	" error format for both php -l and phpcs
	autocmd FileType php set errorformat=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\",%m\ in\ %f\ on\ line\ %l
	autocmd FileType py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
	autocmd FileType py set errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
endif

" http://www.jukie.net/~bart/conf/vimrc
function! OnlineDoc()
        let s:browser = "firefox"
        let s:wordUnderCursor = expand("<cword>")

        if &ft == "cpp" || &ft == "c" || &ft == "ruby" || &ft == "python"
                let s:url = "http://www.google.com/codesearch?q=".s:wordUnderCursor."+lang:".&ft
		elseif &ft == "php"
				let s:url = "http://php.net/manual-lookup.php?pattern=".s:wordUnderCursor
        elseif &ft == "vim"
                let s:url = "http://www.google.com/codesearch?q=".s:wordUnderCursor
		elseif &ft == "actionscript"
				let s:url = "http://community.adobe.com/help/search.html?q=".s:wordUnderCursor."&l=flash_product_adobelr"
        else
                return
        endif

        let s:cmd = "silent !".s:browser. " \"".s:url."\""
		"echo  s:cmd
        execute  s:cmd
        redraw!
endfunction

" online doc search
map <leader>k :call OnlineDoc()<CR>

" setup PHP Code Sniffer
function! RunPhpcs()
    let l:filename=@%
	let l:phpcs_output=system('phpcs --report=csv --standard=Pear '.l:filename)
    let l:phpcs_list=split(l:phpcs_output, "\n")
    unlet l:phpcs_list[0]
    cexpr l:phpcs_list
    cwindow
endfunction

command! Phpcs execute RunPhpcs()
autocmd BufRead *.php map <leader>M :execute RunPhpcs()<CR>

