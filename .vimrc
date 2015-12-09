" if you're starting off, http://learnvimscriptthehardway.stevelosh.com/ is a
" great place to start!

set nocompatible

" ----------------------------------------
" Vundle
" ----------------------------------------
source $HOME/.vim-bundles

" ----------------------------------------
" Settings
" ----------------------------------------
set enc=utf-8
set nowrap
set number
set numberwidth=2

" delete all the things
set backspace=indent,eol,start

" Enable mouse in all modes
set mouse=a

" indent shiz
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" enable incremental search
set incsearch

" prevent highlight from remaining after search
set nohlsearch

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

" Hide buffers instead of closing - multiple files, one window
set hidden

" Remember up to 1000 'colon' commmands and search patterns
set history=1000

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Changes up/down to move by line in editor
nnoremap j gj
nnoremap k gk
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

" easy motion - highlight all of the things
let g:EasyMotion_do_mapping = 0 " Disable default mappings

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" get a quick find
nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Nerdtree setup
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Syntastic
let g:syntastic_javascript_checkers = ['']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" font
colorscheme molokai
set background    = "dark"
syntax enable

" Theme stuff
nnoremap <leader>1 :colorscheme obsidian<cr>
nnoremap <leader>2 :colorscheme tomorrow-night-bright<cr>
nnoremap <leader>3 :colorscheme molokai<cr>
nnoremap <leader>4 :colorscheme badwolf<cr>

" badwolf settings
let g:badwolf_darkgutter = 1
let g:badwolf_tabline = 2
let g:badwolf_css_props_highlight = 1
let g:badwolf_html_link_underline = 1

" Airline settings
let g:colors_name = "badwolf"
let g:airline#extensions#tabline#enabled =1
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols - use bn and bp for movement
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
set laststatus=2

" CtrlP settings 
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'

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
