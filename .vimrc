"- Plugin Lists

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'yukunlin/auto-pairs'
Plug 'voldikss/vim-floaterm'
Plug 'tomasiser/vim-code-dark'
Plug 'chrisbra/vim-commentary'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
call plug#end()

"- Some config

set number
set numberwidth=4
set signcolumn=yes
set noshowmode
set encoding=utf-8
set background=dark
set cursorline
set t_Co=256
colorscheme gruvbox
syntax on
" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
  set undodir=~/.vim/backup
  set undofile
  set undoreload=10000
endif
" Enable the marker method of folding.
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
filetype on
filetype plugin on
set expandtab
set shiftwidth=2
set tabstop=2
set expandtab
set nobackup
set scrolloff=10
set incsearch
set ignorecase
set smartcase
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch

"- highlighting

hi Search cterm=bold ctermfg=223 ctermbg=239
hi CocHighlightWrite cterm=bold ctermbg=lightgreen ctermfg=239 
hi SignColumn ctermfg=229 ctermbg=0
hi CursorLineNr cterm=bold ctermfg=white
hi Number ctermfg=white
hi Comment cterm=bold ctermfg=0 "ctermbg=229
hi Visual cterm=bold ctermfg=223 ctermbg=239
hi CocHintSign ctermfg=0 "ctermbg=229
hi CocFloating cterm=bold ctermfg=white ctermbg=235
hi CocHintFloat ctermfg=white ctermbg=0

"- Key Mapping 

let mapleader = " "
inoremap jj <ESC>
inoremap <C-s> <ESC>:w<CR>
noremap <C-S> :w<CR>
noremap so :source %
noremap cmd q:i
noremap <TAB> <ESC>:bnext<CR>
noremap <C-t> <ESC>:FloatermNew --width=0.9 --height=0.8 --title=-<CR>
nnoremap py :w <CR>:!clear <CR>:!python3 % <CR>
noremap <leader>h :nohlsearch<CR>
inoremap <C-w> <ESC>:wq<CR>
noremap <C-q> :q<CR>
noremap <space>e <ESC>:NERDTreeToggle<CR>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap zz 1z=
inoremap zz <ESC>1z=<CR>i
nmap <space>t :TagbarToggle<CR>

"- Changing the cursor shape
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

"- Coc-nvim Configuration

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"- For c files add extra line code which is found in .vim/c_header 

autocmd bufnewfile *.c so ~/.vim/c_header.txt

"- NERDTree

let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"- IndentLineChar

let g:indentLine_char = '▏'

"- LightLine

let g:lightline = {
\ 'colorscheme': 'powerline',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
\   'right': [ [ 'lineinfo'], [ 'percent' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead'
\ }
\ }
