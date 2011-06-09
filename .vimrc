" pathogen bundles
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

syntax on
set number
set cursorline

" Hide the menu bar and set the theme if in GUI
if has("gui_running")
  " Hide menu bar
  set guioptions=egmrt
  " theme
  set t_Co=256
  colorscheme solarized
  set background=dark
endif


" Text
set gfn=Monaco:h12
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

" Matching braces
set showmatch

" Spell Checking
set spell

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete

" Set filetype for erb files
augroup filetypedetect
au BufNewFile,BufRead *.html.erb			setf html
augroup END


" Change the working directory to the current directory
" set autochdir


autocmd User Rails.view.erb*    set ft=rails.html
autocmd User Rails.view.rhtml*    set ft=rails.html


" Tab completion
set wildmode=list:longest

" Key bindings
imap ,< <%=  %><Esc>2hi
imap ,<! <Esc>I<!--<Esc>A--><Esc>
imap <Leader># #{}<Esc>hi
imap <Leader><Tab> <c-n>
imap ,l logger.info "###### "<Esc>1hi
map ,n :NERDTree
map ,nn :NERDTreeClose<Enter>
map <Leader>ff :FufFile<Enter>
map <Leader>fb :FufBuffer<Enter>
map <Leader>t :tab new<Enter>

" Lusty Explorer fix, as described in the warning message
"set hidden
"let g:LustyExplorerSuppressRubyWarning = 1

