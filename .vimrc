set nocompatible " Should be first line in this file

" Plug-ins
call plug#begin('~/.vim/plugged')
    " Color-schemes
    Plug 'jackcogdill/palenight.vim' " Palenight color-scheme

    " Status bar
    Plug 'vim-airline/vim-airline' " Airline status bar
    Plug 'vim-airline/vim-airline-themes' " Airline status bar themes

    " Navigation
    Plug 'scrooloose/nerdtree' " File navigation
    Plug 'Xuyuanp/nerdtree-git-plugin' " GitHub integration for the file navigation

    " Language Support
    Plug 'othree/yajs.vim' " JavaScript highlighting

    " Editing
    Plug 'Raimondi/delimitMate' " Auto-complete parentheses
call plug#end()

" Coloring
set t_Co=256 " Enable 256 colors
syntax enable
set background=dark
color palenight
hi LineNr ctermbg=NONE
hi Normal ctermbg=NONE

" Airline configuration
let g:airline_theme='base16_atelierdune'

" Display
set nu " Show line numbers
set showcmd " Show command

" Windows
set splitright " Split to the right
set splitbelow " Split to the bottom

" Text
set encoding=utf-8 " Encoding
set nowrap " Do not wrap lines
set showmatch " Show matching parentheses
set spell spelllang=en_us " Turn on spelling
hi Comment cterm=italic

" Menu & Searching
set wildmenu " Second tab will complete to first full match and open wild-menu
set autochdir " Set directory to current file's directory
set incsearch " Show search matches as you type
set hlsearch " Highlight search terms
set ignorecase smartcase " Ignore case when searching
set wildignore=*.swp,*.bak,*.pyc,*.class " Ignore these file types during search

" History
set history=500 " Remember more commands and search history
set undolevels=500 " Have a lot of undo levels

" White space
set autoindent " Auto-indent everywhere
set copyindent " Copy previous indentation when auto-indenting
set tabstop=4 " Make a tab 4 spaces
set softtabstop=4 " Make 4 columns for tabs in insert mode
set shiftwidth=4 " 4 spaces when auto-indenting
set smarttab " Insert tabs on the start of a line according to shift-width, not tab-stop
set smartindent " Indent correctly (usually)
set shiftround " Use multiple of shift-width when indenting with '<' and '>'
set expandtab " Always use the appropriate number of spaces
set formatoptions=tcqrn1

" Input
set mouse=a " Enable the mouse
set scrolloff=5 " Context lines above and below the cursor
set sidescrolloff=0 " Context lines to the left and right of the cursor
set backspace=indent,eol,start " Make backspace work like most other programs
set clipboard=unnamed " Use clipboard as default register
set noerrorbells novisualbell " Do not beep
set timeoutlen=1000 " Mapping delays
set ttimeoutlen=0 " Key code delays

" Remove all trailing white-space by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Screen drawing
set lazyredraw " Buffer screen updates instead of updating all of the time
set ttyfast " Improve smoothness on redraw

" Files & Buffers
set hidden " Hide buffers instead of closing them
set autoread " Remember last location in a file
set nobackup nowritebackup noswapfile " Turn off automatic creation of backup files

" File type
filetype on " Turn on file-type detection
filetype plugin on " When file is edited, its plug-in file is loaded
filetype indent on " When file is edited, its indent file is loaded

" Auto-command features
if has('autocmd')
    " Language support
    au BufRead,BufNewFile *.g set filetype=antlr3 " ANTLR 3 syntax highlighting
    au BufRead,BufNewFile *.g4 set filetype=antlr4 " ANTLR 4 syntax highlighting
end
