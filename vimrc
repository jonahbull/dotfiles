runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
filetype plugin indent on " load file type plugins + indentation

set modelines=0 " prevent some security exploits w/modelines
set nocompatible " no compatibility with legacy vi

" directory changes depending on what file you're working with
set autochdir

" all utf-8 all the time
set encoding=utf-8

" easiest for interacting with system clipboard
set clipboard=unnamed

" basics
set number " line numbers
set ruler " show cursor position all the time

" colors
set background=light
colorscheme solarized
let g:solarized_visibility="low"

set showmode " show what mode we're in
set showcmd " display incomplete commands
set wildmenu " better tab-completion for commands
set wildmode=list:longest " list all matches, complete til longest common string
set backspace=indent,eol,start " backspace through everything in insert mode
set cursorline " highlight the current line

set splitbelow " open horizontal split below current
set splitright " open vertical split to the right

" statusline
set ls=2 " always show the status bar
set statusline=%F\ %m%r%w%y\ %{fugitive#statusline()}\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P

" backups
set nobackup " don't make backup files
set directory=~/.vim/swp/

" tabs and indenting
set tabstop=4 " a tab is 4 spaces
set shiftwidth=4 " an indent is 4 spaces
set smarttab " don't need this?
set softtabstop=4
set expandtab " use spaces, not tabs
set autoindent " copy indent from current line
set nowrap " don't wrap lines

" searching
set hlsearch " highlight matches
set incsearch " incremental searching
set showmatch " jump to match
set ignorecase " searches are case insensitive...
set smartcase " ... unless they contain at least one capital letter

" simply hit enter to clear highlighting after a search
nnoremap <silent> <CR> :noh<CR>

" show them listchars
set list
set listchars=nbsp:·,eol:↵,extends:>,precedes:<,tab:\|\

" enable synatx highlighting
syntax enable
syntax on

" automatically open quickfix window after grep
" doesn't seem to work though?
autocmd QuickFixCmdPost *grep* cwindow

" borrowed from pbrisbin
" * <F1> to re-format the current paragraph correctly
" * <F2> to format a line which is too long, and go to the next line
" * <F3> to merge the previous line with the current one, with
"  correct formatting (sometimes useful associated with <F2>)

" reformat paragraphs
nmap    <F1>    gqap
nmap    <F2>    gqqj
nmap    <F3>    kgqj
map!    <F1>    <ESC>gqapi
map!    <F2>    <ESC>gqqji
map!    <F3>    <ESC>kgqji

" toggle paste for pasting code from browser, etc.
set pastetoggle=<F4>
