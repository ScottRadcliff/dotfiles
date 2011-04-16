syntax on
set number
set cursorline

" theme
" colorscheme dusk 
colorscheme twilight
" Text
" set gfn=Consolas:h14
set shell=/bin/bash
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


" Lusty Explorer fix, as described in the warning message
set hidden
let g:LustyExplorerSuppressRubyWarning = 1
