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
set number
set laststatus=2
set bs=2  " Fix backspacing
set ruler " Always show the cursor position
set nocompatible
" Change the swap file location so I don't have
" to ignore them on all of my projects
set dir=~/tmp
set t_Co=256
set wildmode=list:longest " Tab completion
set showtabline=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Ultisnip
"-----------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"

" Syntastic
" -----------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'passive_filetypes': ['sass', 'scss'] }
let g:syntastic_eruby_ruby_quiet_messages =  {'regex': 'possibly useless use of a variable in void context'}


" ------------------------
" Text
" -----------------------
set autoindent
set cmdheight=2
set expandtab
" set gfn=Monaco:h13
set gfn=Inconsolata:h18
set ic " Ignore case when searching
set incsearch
" Make the search color something where I can still read the text
hi Search ctermfg=black ctermbg=230
hi Visual ctermfg=black ctermbg=230
set nohlsearch
set list
set listchars=tab:▸\ ,trail:▫
set mouse=a " Basic mouse movement such as resizing buffers
set nospell
set shell=/bin/zsh
set shiftwidth=2
set showmatch " Matching braces
let g:loaded_matchparen=1 " Turn off matching parens
set smartindent
" setlocal spell spelllang=en_us
set tabstop=2
set nowrap


" Ignore some files when Exploring
let g:netrw_list_hide = ".DS_STORE"
let g:netrw_liststyle = 3


"-----------------------------------------
" Scratch
"----------------------------------------
let g:scratch_height = 30


"------------------------------------------
" Key Mappings
" ----------------------------------------
let mapleader=","
" set timeoutlen=500

" Remap Window Jumping
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <leader>a :Ack
nmap <Leader>, :CtrlPBuffer<Enter>
nmap <Leader>cpc :CtrlPClearAllCaches<Enter>
nmap <leader>e :NERDTreeToggle<CR>
map  <leader>f :filetype detect<cr>
map  <leader>def :Ack "def " %
map  <leader>m :!ruby %
map  <leader>md :! open /Applications/Marked.app %<CR><CR>
nmap <leader>p :set paste!<CR>
map  <leader>qc :!git commit -am "Quick Commit"
map  <leader>rs :call ReloadAllSnippets()
map  <leader>sc :Scratch<Enter>
map  <leader>sn :NERDTree ~/.vim/bundle/vim-snippets/snippets/ " Open snippets
" After I source the  vimrc, I need to detect the file type.
" Thanks Square https://github.com/square/maximum-awesome/blob/master/vimrc#L61
map <silent> <leader>sv :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
map  <leader>T :tabn<enter>
nmap <leader>ts :SyntasticToggleMode<CR>
map  <leader>tt :tabnew<enter>
map  <leader>v :vsplit ~/.vimrc<Enter>
nmap <leader>w :set wrap! linebreak!<CR>
map  <leader>wc g<C-G> " Word Count
map  <leader>; :%s/;//g " Remove all semicolons from the current file
map <Leader>rt :!ctags -R --exclude=.git --exclude=log  --languages=ruby . $(bundle list --paths)<CR><CR>
map <leader><space> :nohl<enter> " Clear search highlighting
" insert mappings
imap <leader>e <esc>A

" Splits
nmap vv :vs<Enter>
nmap ss :sp<Enter>


" NERDTree
let g:NERDTreeHighlightCursorline=0 " That line in the NERDTree windows is irritating


" Insert Mode Key Mappings
" ---------------------------------------------------------
imap jj <Esc>
imap <Leader><Tab> <C-p>

" Jump to next space
imap <C-e> <esc>f<space>i

" Jump to end of the line
imap <C-l> <esc>A

" Buffers.

" Disptach
map <leader>d :Dispatch rspec %<cr>




" Normal Mode Key Mappings
" ---------------------------------------------------------
nmap nt :tabnew<enter>
nmap nxt :tabn<enter>

" Hide the menu bar and set the theme if in GUI
if has("gui_running")
  " Hide menu bar
  set guioptions=egmrt
  " theme
  set t_Co=256
  colorscheme tomorrow-night
endif

colorscheme tomorrow-night


autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType php :setlocal sw=4 ts=4 sts=4 " Four spaces for PHP files " "
" Set up markdown files. Need to reset number and remove them because of
" relative number
autocmd BufNewFile,BufRead *.md set filetype=markdown spell nonumber norelativenumber wrap
" au FileType markdown set tw=80
" autocmd BufNewFile,BufRead *.txt set filetype=txt spell wrap
autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
autocmd BufNewFile,BufRead *_spec.rb set filetype=ruby.rspec
autocmd BufNewFile,BufRead *.hbs set filetype=html
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd BufNewFile,BufRead *.erb set filetype=html.eruby
autocmd BufNewFile,BufRead *.es6 set filetype=javascript
au FileType gitcommit set tw=80
" Turn off cursorline in insert mode
autocmd InsertEnter,InsertLeave * set cul!



" CTRL=P
let g:ctrlp_dotfiles = 0
let g:ctrlp_by_filename = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|tmp\|DS_Store\|git'


" Anything from 232 - 255 for the BG is good  via http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
set background=dark
hi CursorLine cterm=NONE ctermbg=236
set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline



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

" Open my notes file
function! Notes()
  :e ~/tmp/notes.txt 
endfunc

function! Reformat()
  :normal! gggqG
endfunc
map <leader>rmd :call Reformat()<cr>


" Run the current rspec file
function! RunSpecFile()
  !bundle exec rspec %
endfunc
nmap <leader>r :call RunSpecFile()<cr>

" List the current file
function! CatCurrentFile()
  !cat %
endfunc
nmap <leader>cf :call CatCurrentFile()<cr>


" Set the search path for laravel projects
function! SetupEnvironment()
  let l:path = expand('%:p')
  if l:path =~ '/Users/scott/Projects/rootinc/compass3'
    set path=$PWD,app/**,resources/**
  endif
endfunc
autocmd! BufReadPost,BufNewFile * call SetupEnvironment()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test Runner via Gary Bernhardt
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
"
" Test running here is contextual in two different ways:
"
" 1. It will guess at how to run the tests. E.g., if there's a Gemfile
"    present, it will `bundle exec rspec` so the gems are respected.
"
" 2. It remembers which tests have been run. E.g., if I'm editing user_spec.rb
"    and hit enter, it will run rspec on user_spec.rb. If I then navigate to a
"    non-test file, like routes.rb, and hit return again, it will re-run
"    user_spec.rb. It will continue using user_spec.rb as my 'default' test
"    until I hit enter in some other test file, at which point that test file
"    is run immediately and becomes the default. This is complex to describe
"    fully, but simple to use in practice: always hit enter to run tests. It
"    will run either the test file you're in or the last test file you hit
"    enter in.
"
" 3. Sometimes you want to run just one test. For that, there's <leader>T,
"    which passes the current line number to the test runner. RSpec knows what
"    to do with this (it will run the first test it finds at or below the
"    given line number). It probably won't work with other test runners.
"    'Focusing' on a single test in this way will be remembered if you hit
"    enter from non-test files, as described above.
"
" 4. Sometimes you don't want contextual test running. In that case, there's
"    <leader>a, which runs everything.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MapCR()
  nnoremap <cr> :call RunTestFile()<cr>
endfunction
call MapCR()
nnoremap <leader>T :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('')<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Are we in a test file?
    let in_test_file = match(expand("%"), '\(_spec.rb\|_test.rb\|test_.*\.py\|_test.py\|.test.ts\|.test.ts\)$') != -1

    " Run the tests for the previously-marked file (or the current file if
    " it's a test).
    if in_test_file
        call SetTestFile(command_suffix)
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile(command_suffix)
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@% . a:command_suffix
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end
    " The file is executable; assume we should run
    if executable(a:filename)
      exec ":!./" . a:filename
    " Project-specific test script
    elseif filereadable("bin/test")
      exec ":!bin/test " . a:filename
    " Rspec binstub
    elseif filereadable("bin/rspec")
      exec ":!bin/rspec " . a:filename
    " Fall back to the .test-commands pipe if available, assuming someone
    " is reading the other side and running the commands
    elseif filewritable(".test-commands")
      let cmd = 'rspec --color --format progress --require "~/lib/vim_rspec_formatter" --format VimFormatter --out tmp/quickfix'
      exec ":!echo " . cmd . " " . a:filename . " > .test-commands"

      " Write an empty string to block until the command completes
      sleep 100m " milliseconds
      :!echo > .test-commands
      redraw!
    " Fall back to a blocking test run with Bundler
    elseif filereadable("bin/rspec")
      exec ":!bin/rspec --color " . a:filename
    elseif filereadable("Gemfile") && strlen(glob("spec/**/*.rb"))
      exec ":!bundle exec rspec --color " . a:filename
    elseif filereadable("Gemfile") && strlen(glob("test/**/*.rb"))
      exec ":!bin/rails test " . a:filename
    " If we see python-looking tests, assume they should be run with Nose
    elseif strlen(glob("test/**/*.py") . glob("tests/**/*.py"))
      exec "!nosetests " . a:filename
    end
endfunction
