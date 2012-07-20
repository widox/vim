filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible    " use Vim settings; must be first!
let mapleader=","   " set mapleader to comma instead of backslash
set backspace=indent,eol,start
set hidden          " set dirty buffer as hidden by default
set history=10000   " number of lines of history to remember
set title           " update the title bar for current file please
set ruler           " show cursor position
set number          " line numbers
set hlsearch        " highlight searches
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
set mouse=a
set laststatus=2      " always display a status line at the bottom of the window
set switchbuf=useopen " jump to open win that has a buffer already open
set showcmd           " show how many of whatever is being selected

" better tab completion for :commands
set wildmenu
set wildmode=longest,list

set clipboard+=unnamed         " yank/delete use system clipboard
set clipboard+=autoselect      " selecting with the mouse in xterm auto-yanks.

filetype plugin indent on " turn on plugins and indention
"autocmd BufEnter * :sil! lcd %:p:h " switch to file's dir
" search for a tags file recursively from cwd to /
set tags=.tags,tags;/     " so vim knows about ctags files

set ignorecase      " ignore case when searching
set smartcase       " overrides 'ignorecase' when pattern has upper case characters
set incsearch       " show my search when typing

" wait less time for command sequences
set timeoutlen=500

" Folding
set nofen
set fdl=0

silent !mkdir -p ~/.vim-tmp/
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
    colorscheme badwolf "lucius solarized molokai blackboard

    "set fuoptions=maxvert,maxhorz
    "au GUIEnter * set fullscreen
    "au GUIEnter * simalt \~x
    set lines=999 columns=999
else
    set background=dark   " adapt colors for dark background
    colorscheme badwolf " desert256 lucius solarized molokai blackboard
endif

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" to quickly get the path of current file command mode
cabbr <expr> %% expand('%:p:h')

" turn off hilighted search terms
map <leader>n :nohls<CR>

" switch between buffers quicker
nnoremap <leader><leader> <c-^>

",v brings up my .vimrc
"",V reloads it -- making all changes active (have to save first)
map ,v :sp $MYVIMRC<CR><C-W>_
map <silent> ,V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Source the vimrc file after saving it
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

map <leader>nt :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
map <leader>t :TagbarToggle<CR> "TlistToggle
let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1

" no, don't overwrite my mappings!
let g:phpunit_key_map = 1
map <Leader>tt :PhpUnit<Enter>
map <Leader>tf :PhpUnitFile<Enter>
map <Leader>ts :PhpUnitSwitchFile<Enter>

" auto close when you jump to a tag.
let g:tagbar_autoclose = 1
" move cursor to window when opened
let g:tagbar_autofocus = 1

map <leader>f :CommandTFlush<CR>\|:CommandT<CR>

" snipMate setup
let g:snips_author = 'Matt McKeon'

" lets make quicker
map <leader>m :make<CR>

" quickly reformat newlines from windows editors
map <leader>w :%s/\r//g<CR>
map <leader>W :%s/\r/\r/g<CR>

" save quicker
map W :w<CR>

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

" set complete=""
set complete+=.
set complete+=k
set complete+=b
set complete+=t

set completeopt+=menuone,longest,preview

"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabLongestHighlight = 1

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

" blowout trailing whitespaces,
" they make baby jesus cry
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" toggle paste mode
map <F8> :set paste!<Bar>set paste?<CR>
" toggle spell checking
map <F7> :set spell!<Bar>set spell?<CR>

if !exists("mm_filetype_config")
    let mm_filetype_config = 1

    " Jump to last cursor position unless it's invalid or in an event handler
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif

    " Turn on spelling in subversion/git commits
    autocmd BufNewFile,BufRead svn-commit.* set spell
    autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell

    " chage :make for different languages
    autocmd FileType php set makeprg=php\ -l\ %
    " error format for both php -l and phpcs
    autocmd FileType php set errorformat=\"%f\"\\,%l\\,%c\\,%t%*[a-zA-Z]\\,\"%m\",%m\ in\ %f\ on\ line\ %l
    autocmd FileType py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
    autocmd FileType py set errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

    " source code gets wrapped
    autocmd FileType javascript,php,html,python,actionscript set autoindent
endif

" setup PHP Code Sniffer
function! RunPhpcs()
    let l:filename=@%
    let l:phpcs_output=system('phpcs '.l:filename)
    let l:phpcs_list=split(l:phpcs_output, "\n")
    unlet l:phpcs_list[0]
    cexpr l:phpcs_list
    cwindow
endfunction

command! Phpcs execute RunPhpcs()
autocmd BufRead *.php map <leader>M :execute RunPhpcs()<CR>

