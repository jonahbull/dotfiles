" no compatibility with legacy vi
set nocompatible

" Required for vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fireplace'

filetype plugin indent on " load file type plugins + indentation
set modelines=0 " prevent some security exploits w/modelines

let g:lightline = {
      \ 'colorscheme': 'solarized_light',
      \ }

" Use flake8
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore="E126,E127,E128,E501,W391"'

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

" enable syntax highlighting
syntax enable
syntax on
