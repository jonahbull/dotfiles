call pathogen#infect()
filetype plugin indent on " load file type plugins + indentation

set modelines=0 " prevent some security exploits w/modelines
set nocompatible " no compatibility with legacy vi

" plugins to check out: matchit, surround

" directory changes depending on what file you're working with
set autochdir

" it's 2012 folks
set encoding=utf-8

" easiest for interacting with system clipboard
set clipboard=unnamed

" basics
set number " line numbers
set ruler " show cursor position all the time

" colors
set background=light
if has('gui_running')
    set background=dark
    set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline:h12"
    set go-=T
    set go-=r
endif
let g:solarized_visbility="low"
let g:solarized_termtrans = 1
colorscheme solarized
set t_Co=256

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
" set statusline=%F\ %m%r%w%y\ %{fugitive#statusline()}\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P
set rtp+=/Users/jonah/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
"let g:Powerline_symbols = 'fancy'

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

" http://ku1ik.com/2011/09/08/formatting-xml-in-vim-with-indent-command.html
" gg=G command. = is used to auto-indent selected line(s) and gg=G re-indents
" whole file.
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" vim-latex stuff

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" vim-latex compilation stuff
" pdf as target for latex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction nonstopmode'
let g:Tex_ViewRule_pdf = 'zathura'
