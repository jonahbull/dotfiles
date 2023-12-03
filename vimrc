" General
"
" ------------------------------------

set modelines=0 " prevent some security exploits w/modelines

" no compatibility with legacy vi
set nocompatible

" backups
set nobackup " don't make backup files
set directory=~/.vim/swp/

" all utf-8 all the time
set encoding=utf-8

" The markdown plugin breaks opening links in markdown documents
let g:polyglot_disabled = ['markdown']

" I got the plug
call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
"Plug 'tpope/vim-markdown'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'ledger/vim-ledger'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'airblade/vim-gitgutter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'neovim/nvim-lspconfig'
Plug 'psf/black'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
call plug#end()

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
let g:ale_linters = {}
let g:ale_linters.python =['ruff']
let g:ale_linters.hcl =['terraform', 'tflint']
let g:ale_linters.terraform = ['terraform', 'tflint']
let g:ale_linters.tf = ['terraform', 'tflint']
"let g:ale_linters.yaml = ['yamlls', 'yamllint']
let g:ale_fixers = {}
let g:ale_fixers.terraform = ['terraform']
let g:ale_fixers.tf = ['terraform']
let g:ale_fixers.hcl = ['terraform']
let g:ale_fixers.python = ['black', 'ruff']
" These are installed with pipx
let g:ale_python_flake8_use_global = '1'
let g:ale_python_flake8_options = '--ignore="W391" --max-line-length=88'
let g:ale_python_black_use_global = '1'
let g:ale_python_ruff_use_global = '1'
let g:ale_lint_on_enter = 0
let g:ale_yaml_yamllint_options = '-d "{extends: default,rules: {line-length: disable, indentation: {indent-sequences: consistent}}}"'


"filetype plugin indent on " load file type plugins + indentation

" Colors and fonts
" ------------------------------------

" enable syntax highlighting
"syntax enable
"syntax on

set background=light
colorscheme solarized
let g:solarized_visibility="low"
highlight clear SignColumn
" set signcolumn=number

" User interface
" ------------------------------------

" directory changes depending on what file you're working with
set autochdir

" easiest for interacting with system clipboard
set clipboard=unnamedplus

" basics
set number " line numbers
set ruler " show cursor position all the time
set nojoinspaces " Do not insert 2 spaces after sentences when joining
set ttyfast " Improve smoothness of redraw for newer terminals
set whichwrap+=h,l " Allow cursor keys to line wrap

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

" show them listchars
set list
set listchars=nbsp:·,eol:↵,extends:>,precedes:<,tab:\|\

" searching
set hlsearch " highlight matches
set incsearch " incremental searching
set ignorecase " searches are case insensitive...
set showmatch " jump to match
set smartcase " ... unless they contain at least one capital letter

" Text handling
" ------------------------------------

" tabs and indenting
set autoindent " copy indent from current line
set expandtab " use spaces, not tabs
set tabstop=4 " a tab is 4 spaces
set shiftwidth=4 " an indent is 4 spaces
set smarttab " don't need this?
set softtabstop=4
set nowrap " don't wrap lines

" Indent bulleted lists properly
set comments=://,b:#,:%,:XCOMM,n:>,fb:-,fb:*

" Enable markdown folding
let g:markdown_folding = 1
"let g:markdown_fenced_languages = ['python', 'bash=sh', 'yaml', 'graphql']
"let g:markdown_minlines = 200

" Change default format options:
set formatoptions-=t  " turn off auto-wrapping type
set formatoptions-=c  " turn off auto-wrapping comments
set formatoptions-=r  " turn off auto-inserting insert the current comment leader after hitting <Enter> in Insert mode.
set formatoptions+=q  " format comments manually with gq
set formatoptions+=n  " gq recognizes numbered lists
set formatoptions+=1  " prefer breaking before, not after, a one-letter word

" simply hit enter to clear highlighting after a search
nnoremap <silent> <CR> :noh<CR>

" Ctrl+P fuzzy file finding
noremap <C-p> :Files<Cr>

" For YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType helm setlocal ts=2 sts=2 sw=2 expandtab

" For ledger
au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger
let g:ledger_maxwidth = 120
let g:ledger_fold_blanks = 1
function LedgerSort()
    :%! ledger -f - print --sort 'date, amount'
    :%LedgerAlign
endfunction
command LedgerSort call LedgerSort()
