set nocompatible    " use Vim settings; must be first!
let mapleader = "," " set mapleader to comma instead of backslash
set backspace=indent,eol,start
set hidden          " set dirty buffer as hidden by default
set history=200     " number of lines of history to remember
set title           " update the title bar for current file please
set ruler           " show cursor position
set number          " line numbers
set hlsearch        " highlight searches
"set cursorline      " highlight line for cursor position
"set spell           " turn on spell check
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
set sessionoptions-=options
set fileencodings=utf-8 " be language friendly
set list            " show tabs and trailing spaces
set list listchars=tab:>-,trail:.,extends:>

"set autoindent      " use idention from above line in new line
set wildmenu        " better tab completion for :commands

set clipboard+=unnamed         " yank/delete use system clipboard
set clipboard+=autoselect      " selecting with the mouse in xterm auto-yanks.
set clipboard+=exclude:screen  " can't reliably connect to X11 from inside.

filetype plugin indent on " turn on plugins and indention
"autocmd BufEnter * :sil! lcd %:p:h " switch to file's dir
set tags=tags;/     " so vim knows about ctags files


set ignorecase      " ignore case when searching
set smartcase       " overrides 'ignorecase' when pattern has upper case characters
set incsearch       " show my search when typing

" Highlight long lines (soft limit: 80, hard limit: 100)
:au BufRead *.php,*.py let w:m1=matchadd('Search', '\%<101v.\%>80v', -1)
:au BufRead *.php,*.py let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
:au BufRead *.php,*.py set formatoptions-=t
:au BufRead *.php,*.py set textwidth=79    " keep it < 80!

" Folding
set nofen
set fdl=0

set backupdir=~/.vim-tmp
set directory=~/.vim-tmp

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
	colorscheme molokai "blackboard

    "set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
    "au GUIEnter * simalt \~x
    set lines=999 columns=999
else
	set background=dark   " adapt colors for dark background
	colorscheme molokai "blackboard
endif

" don't need to use a : for commands, just hit ;
" breaks ability to use ; when searching with f/F :(
"nnoremap ; :

" turn off hilighted search terms
map <leader>n :nohls<CR>

",v brings up my .vimrc
"",V reloads it -- making all changes active (have to save first)
map ,v :sp $MYVIMRC<CR><C-W>_
map <silent> ,V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

map <C-n> :NERDTreeToggle<CR>
map <leader>t :TlistToggle<CR>
let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1

map <leader>T :CommandT<CR>

" snipMate setup
let g:snips_author = 'Matt McKeon'

" setup Gist.vim
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
map <leader>gi :Gist<CR>
map <leader>gip :Gist-p<CR>

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

imap <C-space> <C-x><C-o>
"}}}

set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t

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
	autocmd FileType actionscript set makeprg=as3lint\ %
    autocmd FileType actionscript set errorformat=Error\ \#%n:\ %m\ .\ \ \ \ \ %f\,\ Ln\ %l\,\ Col\ %c
    "autocmd FileType actionscript set errorformat=:\ %m,%C%f\,\ Ln\ %l\,\ Col\ %c

    " source code gets wrapped
    autocmd FileType javascript,php,html,python,actionscript set autoindent
endif

" http://www.jukie.net/~bart/conf/vimrc
function! OnlineDoc()
        let s:browser = "chromium-browser"
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

" easily grep through a project environment created via workit
function! PGrep(pattern, ...)
    let pattern = a:pattern

    if a:0 == 0
        let ext = '*'
    else
        let ext = a:1
    endif

    let proj_path = system("echo $PROJ_PATH | tr -d '\n'")
    :exe 'cd '.proj_path

    let search_path = "/**/*." . ext

    :execute "vimgrep /" . pattern . "/j " search_path | :copen
endfunction

command! -nargs=* PGrep :call PGrep(<f-args>)

