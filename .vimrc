call pathogen#infect()
syntax on
set number
set cursorline

hi CursorLine ctermbg=black

" Set the cursorline for the current window
" Having highlighted lines in mutliple windows sux
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline


" Hide the menu bar and set the theme if in GUI
if has("gui_running")
  " Hide menu bar
  set guioptions=egmrt
  " theme
  set t_Co=256
  colorscheme twilight
endif


" Text
set gfn=Monaco:h13
set shell=/bin/bash
set cmdheight=5
set nowrap
setlocal spell spelllang=en_us

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc
set ruler

" Code indenting
set autoindent
set smartindent

" Tabs and spaces
set expandtab
set tabstop=2
set shiftwidth=2

" Searching
set incsearch
set ic " Ignore case when searching

" Matching braces
set showmatch

" Filetype plugin for NerdCommenter
filetype plugin on


" Spell Checking
set spell
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType ruby set omnifunc=rubycomplete#Complete


" Tab completion
set wildmode=list:longest

" Key bindings
imap <Leader><Tab> <c-n>
map <Leader>tn<Enter> " Tab Next

" Nerd Tree
map ,n :NERDTree
map ,nn :NERDTreeClose<Enter>

" Fuzzy Finder
map <Leader>ff :FufFile<Enter>
map <Leader>fb :FufBuffer<Enter>
map <Leader>fl :FufLine<Enter>
map <Leader>t :tab new<Enter>


" Git
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P



