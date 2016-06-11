" if you're starting off, http://learnvimscriptthehardway.stevelosh.com/ is a
" great place to start!

set nocompatible

" ----------------------------------------
" Vundle
" ----------------------------------------
source $HOME/.vim-bundles
syntax enable

" ----------------------------------------
" Settings
" ----------------------------------------
set enc=utf-8
set nowrap
set number
set numberwidth=2

" set this to match tmux
set term=screen-256color
" set t_Co=256
" delete all the things
set backspace=indent,eol,start

" Enable mouse in all modes
set mouse=a

" indent shiz
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
" au FocusLost,WinLeave * :silent! wa
" Trigger autoread when changing buffers or coming back to vim.
au FocusGained,BufEnter * :silent! !

"------------
"Searching
"------------

" enable incremental search
set incsearch

" create a way to remove the highlighted search
nmap <silent> <leader><space> :nohlsearch<cr>

" Ignore case when searching
set ignorecase

" Show line, column number, and relative position within a file in the status line
set ruler

" Indenting
set autoindent

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Ignore certain types of files on completion
set wildignore+=*.o,*.obj,*.pyc,.git,*.bak,.svn

" Change the mapleader from \ to ,
let mapleader=","

" Remember up to 1000 'colon' commmands and search patterns
set history=1000

" Changes up/down to move by line in editor
vnoremap j gj
vnoremap k gk

" Switch windows with Ctrl + a movement key to make it more consistent
" With other window commands
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quickly open the vim config file in a new tab.
" Useful for trying out new stuff
nmap <leader>v :tabedit $MYVIMRC<CR>

" Show hidden characters, particularly devilish tabs
set list listchars=tab:>·,trail:·,nbsp:.

" Use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>

" Page down with <Space>
nmap <Space> <PageDown>

" Highight the active cursor line
set cursorline

" Set thin cursor
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" File Types
if has("autocmd")
    autocmd BufRead,BufNewFile {*.sql}                                  set ft=pgsql
    autocmd BufRead,BufNewFile {*.haml}                                 set ft=haml
    autocmd BufRead,BufNewFile {*.rss,*.atom}                           set ft=xml
    autocmd BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,*.ru}   set ft=ruby
    autocmd BufRead,BufNewFile {*.md,*.mkd,*.markdown}                  set ft=markdown
    autocmd BufRead,BufNewFile {COMMIT_EDITMSG}                         set ft=gitcommit
endif

" Markdown
if has("autocmd")
    autocmd FileType markdown set wrap
    autocmd FileType markdown set linebreak
endif

" Web
if has("autocmd")
    autocmd FileType haml set nowrap
    autocmd FileType sass set textwidth=0
endif

" Editing
if has("autocmd")
    " Strip trailing white space on specific files
    autocmd BufWritePre *.php,*.phtml,*.rb,*.htm,*.html,*.css,*.py,*.js :%s/\s\+$//ge

    " Go back to the position the cursor was on the last time this file was edited
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif
endif

" PHP
if has("autocmd")
    " Highlight interpolated variables in SQL strings & SQL-syntax highlighting
    autocmd FileType php let php_sql_query=1

    " Highlight HTML inside of PHP strings
    autocmd FileType php let php_htmlInStrings=1

    " Discourages use of short tags.
    autocmd FileType php let php_noShortTags=1
endif
