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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

" Plugin: coc
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Show sign columns to allow highlight of errors
set signcolumn=yes

" Use tab to trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" map-section

" windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
