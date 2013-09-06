" Set up and init pathogen
call pathogen#infect()
call pathogen#helptags()

"----------------------------------------
" General Settings
" --------------------------------------
filetype plugin indent on
syntax on
syntax enable
set relativenumber
set laststatus=2
set bs=2  " Fix backspacing
set ruler " Always show the cursor position
set nocompatible
" Change the swap file location so I don't have
" to ignore them on all of my projects
set dir=~/tmp
set t_Co=256
set wildmode=list:longest " Tab completion

" ------------------------
" Text
" -----------------------
set gfn=Monaco:h14
set shell=/bin/bash
set cmdheight=2
set wrap
setlocal spell spelllang=en_us
set nospell
set list
set listchars=tab:▸\ ,trail:▫

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

" Ignore some files when Exploring
let g:netrw_list_hide = ".DS_STORE"

" Matching braces
set showmatch

" Basic mouse movement such as resizing buffers
set mouse=a




"------------------------------------------
" Key Mappings
" ----------------------------------------
let mapleader=","
map <leader>f :filetype detect<cr>
map <Leader>rs :call ReloadAllSnippets()
map <leader>s :Scratch
map <leader>v :e ~/.vimrc<Enter>
nmap <leader>a :Ack
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>bg :cd ~/Dropbox/blog<CR>
map <leader>wc g<C-G>

" Remove all semi-colons from the file.
" Useful when pasting styles from the Chrome Web Inspector
map <leader>; :%s/;//g

" Quick commit with Git
map <leader>gc :!git commit -am ""


" Make tabs easier to use
map <leader>tt :tabnew<enter>
map <leader>T :tabn<enter>

" Testing
map <leader>m :!ruby %
map <leader>cu :!cucumber %

" Print a list of all methods in Ruby
map <Leader>def :Ack "def " %

" Splits
nmap vv :vs<Enter>
nmap ss :sp<Enter>


" NERDTree
nmap <leader>e :NERDTreeToggle<CR>
let g:NERDTreeHighlightCursorline=0 " That line in the NERDTree windows is irritating

" After I source the  vimrc, I need to detect the file type.
" Thanks Square https://github.com/square/maximum-awesome/blob/master/vimrc#L61
map <silent> <leader>sv :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

imap jj <Esc>
imap <Leader><Tab> <C-p>

" Buffers.
nmap <Leader>b :CtrlPBuffer<Enter>

" Disptach
map <leader>d :Dispatch rspec %<cr>




" Hide the menu bar and set the theme if in GUI
if has("gui_running")
  " Hide menu bar
  set guioptions=egmrt
  " theme
  set t_Co=256
 colorscheme solarized
 set background=light
endif 

" colorscheme tomorrow-night



autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType ruby set omnifunc=rubycomplete#Complete
" Set up markdown files. Need to reset number and remove them because of
" relative number
autocmd BufNewFile,BufRead *.md set filetype=markdown tw=80 spell number nonumber
autocmd BufNewFile,BufRead *.txt set filetype=txt tw=101
autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
autocmd BufNewFile,BufRead *_spec.rb set filetype=ruby.rspec



" CTRL=P
let g:ctrlp_dotfiles = 0
let g:ctrlp_by_filename = 0
let g:ctrlp_working_path_mode = 0


" Anything from 232 - 255 for the BG is good  via http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
" hi CursorLine cterm=NONE ctermbg=233 
hi CursorLine cterm=NONE ctermbg=lightgrey
set cursorline
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline

set statusline=%f%m%y\ \ %{rvm#statusline()}\ \ %{fugitive#statusline()}\ \%=%l,%c\ \ \%P


"--------------------------------------------------------------------------------
" RENAME CURRENT FILE
"--------------------------------------------------------------------------------
" Taken from Gary Bermhardt's vimrc https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

"--------------------------------------------
" TOGGLE RELATIVE AND ABSOLUTE LINE NUMBERS
" via: http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
"---------------------------------------------
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>


