" basics
set number
set ruler
colorscheme cottonmouse
set background=dark
set nocompatible
set nobackup
set showmode
set showcmd
set wildmenu
set t_Co=256
set backspace=indent,eol,start

" tabs and indenting
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set expandtab
set autoindent
set nocindent

" searching
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" synatx highlighting
syntax enable
syntax on

" vim-latex stuff
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" vim-latex compilation stuff
" pdf as target for latex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction nonstopmode'
" let g:Tex_CompileRule_pdf = 'pdflatex -interaction nonstopmode $*; if pgrep -fx "xpdf -remote vimlatex $*.pdf"; then xpdf -remote vimlatex -reload; fi;'
let g:Tex_ViewRule_pdf = 'zathura'

" * <F1> to re-format the current paragraph correctly
" * <F2> to format a line which is too long, and go to the next line
" * <F3> to merge the previous line with the current one, with a
"  correct formatting (sometimes useful associated with <F2>)

" reformat paragraphs
nmap    <F1>    gqap
nmap    <F2>    gqqj
nmap    <F3>    kgqj
map!    <F1>    <ESC>gqapi
map!    <F2>    <ESC>gqqji
map!    <F3>    <ESC>kgqji
