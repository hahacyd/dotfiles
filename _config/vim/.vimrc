" Enable syntax highlighting
syntax on

" Set encoding to UTF-8
set encoding=utf-8

" Set line numbers to be shown
set number

" Highlight current line
set cursorline

" Use 4 spaces for a tab
set tabstop=4
set shiftwidth=4
set expandtab

" Show command in the bottom bar
set showcmd

" Enable mouse mode
set mouse=a

" Enable break indent
set breakindent

" Save undo history
set undofile

" Enable case insensitive search
set ignorecase

" Enable smart case search
set smartcase

" Highlight search results
set hlsearch

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set wildmenu to enhance command line completion
set wildmenu

" Show matching brackets when text indicator is over them
set showmatch

" Automatically indent new lines to match the indentation of the previous line
set autoindent

" Enable file type detection and load file type plugins and indent settings
filetype plugin indent on

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Enable persistent undo so that undo history is preserved across Vim sessions
set undodir=~/.vim/undodir
set undofile

" Set colorscheme (you need to have the colorscheme installed)
colorscheme desert

" Turn off backup files to avoid issues with other tools
set nobackup
set nowritebackup

" Set command history length
set history=1000

" Reduce update time for more responsive UI
set updatetime=300

" Set the status bar
set laststatus=2

" Enable line wrapping but not word wrapping
set wrap
set linebreak

" Set search to dynamically update as you type
set incsearch

" Set leader key (useful for custom shortcuts)
let mapleader=","

" Custom mappings (example: quickly save a file)
nnoremap <leader>w :w!<CR>

" Improve buffer switching to behave like tabs
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Disable arrow keys in normal mode to encourage the use of hjkl
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Better tab navigation
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>x :tabclose<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>h :tabprevious<CR>

" Add simple clipboard copy/paste support (requires Vim compiled with clipboard support)
vmap <C-c> "+y
vmap <C-v> "+p
nmap <C-c> "+y
nmap <C-v> "+p

" Prevents creating duplicate lines when you press p or P in visual mode.
vnoremap p "0p
vnoremap P "0P
