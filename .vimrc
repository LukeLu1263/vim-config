" no vi-compatible
set nocompatible

" set syntax highlight on
syntax on

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

" required for vundle
filetype on

filetype plugin on
filetype indent on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles from GitHub repos:

" Vim-Multipile-Cursors
" Bundle 'vim-multiple-cursors'
" Python and PHP Debugger
" Bundle 'fisadev/vim-debug.vim'
" Better file browser
Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Class/module browser
Bundle 'majutsushi/tagbar'
" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
Bundle 'fisadev/vim-ctrlp-cmdpalette'
" Git integration
Bundle 'motemen/git-vim'
" Tab list panel
Bundle 'kien/tabman.vim'
" Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
Bundle 'rosenfeld/conque-term'
" Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'
" Surround
Bundle 'tpope/vim-surround'
" Autoclose
Bundle 'Townk/vim-autoclose'
" Indent text object
Bundle 'michaeljsmith/vim-indent-object'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Bundle 'klen/python-mode'
" Snippets manager (SnipMate), dependencies, and snippets repo
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
" Git diff icons on the side of the file lines
Bundle 'airblade/vim-gitgutter'
" Status/tabline for vim light as air
Bundle 'bling/vim-airline'
" Automated tag generation and syntax highlight
Bundle 'xolox/vim-easytags'
" Requered for easytags
Bundle 'xolox/vim-misc'

" Bundles from vim-scripts repos

" Autocompletion
Bundle 'AutoComplPop'
" Python code checker
Bundle 'pyflakes.vim'
" Search results counter
Bundle 'IndexedSearch'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" Gvim colorscheme
Bundle 'Wombat'
" Yank history navigation
Bundle 'YankRing.vim'
" C/C++ cmode plugins
Bundle 'c.vim'
" easytags query and search result in one buffer for faster jump to desired tag.
Bundle 'yate'


" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" allow plugins by file type
filetype plugin on
filetype indent on

" tabs and spaces handling
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tablength exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" always show status bar
set ls=2

" incremental search
set incsearch

" highlighted search results
set hlsearch

" line numbers
set nu

" toggle Tagbar display
map <F4> :TagbarToggle<CR>

" autofocus on Tagbar open
let g:tagbar_autofocus = 1

" NERDTree (better file browser) toggle
map <F3> :NERDTreeToggle<CR>

" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" show pending tasks list
map <F2> :TaskList<CR>

" save as sudo
ca w!! w !sudo tee "%"

" airline settings
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_powerline_fonts = 1

" colors and settings of autocompletion
highlight Pmenu ctermbg=4 guibg=LightGray
" highlight PmenuSel ctermbg=8 guibg=DarkBlue guifg=Red
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black

" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 2
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 0
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0
" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 0
" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1
" This option can be use if you don't want to parse using namespace declarations in included files and want to add
" namespaces that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]

" debugger keyboard shortcuts for python
"map <F5> :Dbg over<CR>
"map <F6> :Dbg into<CR>
"map <F7> :Dbg out<CR>
"map <F8> :Dbg here<CR>
"map <F9> :Dbg break<CR>
"map <F10> :Dbg watch<CR>
"map <F11> :Dbg down<CR>
"map <F12> :Dbg up<CR>



" CtrlP (new fuzzy finder)
" ,e = open file (like the original :e) but with recursive and fuzzy file name
" matching. Example: if you type "mopy" it will find a file named "models.py" placed on a subdirectory. And allows you to open the selected file on a new tab with Ctrl-t! " "
" ,g = fuzzy symbol finder (classes, methods, variables, functions, ...) on
" the current file. Example: if you type "usr" it will find the User class
" definition on the current file. ,G does the same but on all opened files. "
" ,G does the same but on all opened files.
" ,f = fuzzy text finder on all the opened files. Example: if you type "ctm=6" it will find the line containing "current_time = 16"." "
" ,m = fuzzy finder of most recently used files.
" ,c = fuzzy command finder (internal vim commands, or custom commands).
" Example: if you type "diff" it will find :GitDiff, :diffthis, and many other similar commands. "

let g:ctrlp_map = ',e'
nmap ,g :CtrlPBufTag<CR>
map ,G :CtrlPBufTagAll<CR>
nmap ,f :CtrlPLine<CR>
nmap ,m :CtrlPMRUFiles<CR>
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" CtrlP with default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" Don't change working directory
let g:ctrlp_working_path_mode = 0
" Ignore files on fuzzy finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" simple recursive grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
" ,R uses vimgrep (slower)
nmap ,R :RecurGrep 
" ,r uses the system grep (faster).
nmap ,r :RecurGrepFast 
" ,wr and ,wR do the same, but searching the word under the cursor.
nmap ,wR :RecurGrep <cword><CR>
nmap ,wr :RecurGrepFast <cword><CR>

" python-mode settings
" help command
" :call pymode#troubleshooting#Test()
" :help PythonModeOptions


""""""PYMODE SWITHING"""""""""
" 0 is turn off
" let g:pymode = 0
" autocmd FileType c,cpp,h let g:pymode = 0

" Check code every save
let g:pymode_lint_write = 0
" Key for show python documentation
let g:pymode_doc_key = 'K'
" Additional python paths
let g:pymode_paths = []

" run pep8+pyflakes+pylint validator with \8
autocmd FileType python map <buffer> <leader>8 :PyLint<CR>

" rope (from python-mode) settings
nmap ,d :RopeGotoDefinition<CR>
nmap ,D :tab split<CR>:RopeGotoDefinition<CR>
nmap ,o :RopeFindOccurrences<CR>
nmap J	:RopeShowDoc<CR>

" don't let pyflakes allways override the quickfix list
" let g:pyflakes_use_quickfix = 0

" tabman shortcuts
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
	let &t_Co = 256
    " color
    colorscheme fisa
else
    " color
    colorscheme delek
endif

" colors for gvim
if has('gui_running')
    colorscheme wombat
endif

" change the default theme
let g:airline_theme= 'ubaryd'

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}


"""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""python command""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
"K           Show python docs (g:pymode_doc enabled)
"<C-Space>   Rope autocomplete (g:pymode_rope enabled)
"<C-c>g      Rope goto definition (g:pymode_rope enabled)
"<C-c>d      Rope show documentation (g:pymode _rope enabled) RopeShowDoc == 'J'
"<C-c>f      Run python (g:pymode_run enabled)
"<Leader>b   Set, unset breakpoint (g:pymode    _breakpoint enabled)
"[[          Jump on previous class or function (normal, vis   ual, operator modes)
"]]          Jump on next class or function (normal, visual,    operator modes)
"[M          Jump on previous class or method (normal, visual, o   perator modes)
"]M          Jump on next class or method (normal, visual, operato r modes)
"aC C        Select a class. Ex: vaC, daC, dC, yaC, yC, caC, cC (norma   l, operator modes)
"iC          Select inner class. Ex: viC, diC, yiC, ciC (norma l, operator modes)
"aM M        Select a function or method. Ex: vaM, daM, dM, yaM, yM, caM, cM (normal, operator modes)
"iM          Select inner function or method. Ex: viM,     diM, yiM, ciM (normal, operator modes)
    
""""""""""""""""""""""""""""""""""""""""""""""""""
" The follwing are customed by Luke Lu
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursors
"let g:multi_cursor_use_default_mapping=0

" Default mapping
"let g:multi_cursor_next_key='<leader>n'
"let g:multi_cursor_prev_key='<leader>p'
"let g:multi_cursor_skip_key='<leader>s'
"let g:multi_cursor_quit_key='<leader>q'

" set line underlying current cursor
set cursorline

" incording to what your typing case to decide chose ignore case or not
set smartcase

" 命令
" In normal mode:
" <C-E> move screen up.
" <C-Y> move screen down.
" <C-D> move down half of screen
" <C-U> move up half of screen
" Comment and Uncomment Code with  \cc \cc \cc and \ci \ci \ci \ci
" <S-K> show the documentation for python builtin doc.
" <C-c-d> show the doc for your customed
" <C-I> <C-O>在上一个鼠标位置与下一个鼠标位置之间跳转，也可以用于文件跳转.
" zi    toggle folding


" In Visual mode:
" replacement:
" 1.choose where you want to replace block and press ':'
" 2.then status bar will show :'<,'>
" 3.continuing input " s/{old pattern}/{new pattern}/g "
" eg: s/abc/ABC/g should cause abc -> ABC

"vi: Search and Replace
"Change to normal mode with <ESC>.
"Search (Wrapped around at end of file):
  "Search STRING forward :   / STRING.
  "Search STRING backward:   ? STRING.
  "Repeat search:   n
  "Repeat search in opposite direction:  N  (SHIFT-n)
"replace: Same as with sed, Replace OLD with NEW:
 "First occurrence on current line:      :s/OLD/NEW
 "Globally (all) on current line:        :s/OLD/NEW/g 
 "Between two lines #,#:                 :#,#s/OLD/NEW/g
" Every occurrence in file:              :%s/OLD/NEW/g 


" 当从其他窗口Cmd+C 粘贴到Vim中时，需要set paste。
" 不需要粘贴时使用 set nopaste,否则会影响粘贴.
map <leader>pp :setlocal paste!<cr>

imap <c-b> <Left>
imap <c-f> <Right>
imap <c-e> <End>
imap <c-a> <Home>
imap <c-d> <Del>
imap <c-k> <ESC>ld$a



"============================================================
"========================c/c++ settings======================
"============================================================
" keboard shortcuts for c/c++
let g:C_Ctrl_j   = 'off'
" map jump to definition
nmap <C-J> <C-]>
" map jump to actual definition
nmap g<C-J> g<C-]>

" let g:easytags_file = '~/.vim/tags'
autocmd FileType h,c,cpp set tags=./.tags;
" create project specific tags based on the tags options path above
autocmd FileType h,c,cpp let g:easytags_dynamic_files = 2
" Update recursively
autocmd FileType h,c,cpp let g:easytags_autorecurse = 1
" generate tags for struct/class members in C++ and Java
" Note: before the easytags.vim plug-in is loaded (???)
let g:easytags_include_members = 1

" disable update time period, and set to 1
"let g:easytags_always_enabled = 1
" maybe it will interrupt your work, change to 0
"let g:easytags_on_cursorhold = 0
" disable auto-UpdateTags set to 0
"let g:easytags_auto_update = 0
" disable auto highlight set to 0 
" Note:HighlightTags will slow down the large project
let g:easytags_auto_highlight = 0

":HighlightTags
":UpdateTags -R *.cpp *.c *.h

" show the specific tags
" :YATE
