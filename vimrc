" no compatibility with legacy vi
set nocompatible

" Required for vundle
filetype off
" Enable fzf
set rtp+=/usr/local/opt/fzf
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

Plugin 'altercation/vim-colors-solarized'
Plugin 'w0rp/ale'
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary'
Plugin 'psf/black'

filetype plugin indent on " load file type plugins + indentation
set modelines=0 " prevent some security exploits w/modelines

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 'right': [['lineinfo', 'percent', 'fileformat', 'fileencoding', 'filetype', 'linter_ok', 'linter_checking', 'linter_errors', 'linter_warnings']] }

"let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_options = '--ignore="W391" --max-line-length=88'
let g:ale_yaml_yamllint_options = '{extends: default,rules: {line-length: disable, indentation: {indent-sequences: consistent}}}'

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

" Ctrl+P fuzzy file finding
noremap <C-p> :Files<Cr>

" show them listchars
set list
set listchars=nbsp:·,eol:↵,extends:>,precedes:<,tab:\|\

" enable syntax highlighting
syntax enable
syntax on
