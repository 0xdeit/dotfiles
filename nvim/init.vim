" Gallo's VIM/NeoVIM config v.0.0.2

" general-config
" Do not try to use vi compatible things
set nocompatible

" Display where we are in the current file
" set ruler

" avoid sound warnings
set noerrorbells

" tab-stuff
" tab should be 4 characters
set tabstop=4 
set softtabstop=4
set shiftwidth=4

" change tabs to spaces 
set expandtab

" auto indent
set smartindent

" Always show n lines while scrolling vertically
set scrolloff=5

" Show at least 5 characters while scrolling off screen horizontally
set sidescrolloff=5

" Basic syntax highlighting
syntax enable
filetype plugin on

" Leader key <SPACE>
let mapleader=" "

" Colorscheme from the defaults
" colorscheme murphy

" Show the current line number
set number

" Show relative line number
" set relativenumber

" Allow y/p from system clipboard
set clipboard+=unnamedplus

" Highlight current line
" set cursorline

" Incremental search
set incsearch

" Highlight results of search
set hlsearch

" remove the highlighting once i finish
nnoremap <Leader>s :nohlsearch<CR>

" Do not close buffers, hide them
set hidden

" Do not make tmp files in directory, 
set noswapfile

" only create undofiles in the specified undodir
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

" from <How to Do 90% of What Plugins Do (With Just Vim)> [https://www.youtube.com/watch?v=XA2WjJbmmoM]

" Finding files
" Search into subfolders
" Provides tab-completion for file-related commands
set path+=**

" Ignore certain files or folders
set wildignore+=**/node_modules/**

" display all matching giles when tabl complete
set wildmenu

" vim-plug-section
call plug#begin('~/.config/nvim/plugged')
" Comment/Uncomment
Plug 'tpope/vim-commentary'
" Using vim for databases
Plug 'tpope/vim-dadbod'
" Conquer Completion
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" kewl Status line
Plug 'itchyny/lightline.vim'
" undos
Plug 'mbbill/undotree'
" Git integration
Plug 'tpope/vim-fugitive'
" nvim theme
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'morhetz/gruvbox'
call plug#end()

" plugin-config-section

" theme-config
if has('nvim') || has('termguicolors')
    set termguicolors
endif

"colorscheme challenger_deep
colorscheme gruvbox

" Plugin: lightline
set noshowmode
let g:lightline = {'colorscheme': 'gruvbox'}

" map-section

" windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
