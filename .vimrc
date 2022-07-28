call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'yukunlin/auto-pairs'
Plug 'voldikss/vim-floaterm'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  } } 
Plug 'junegunn/fzf.vim'
call plug#end()

" My Config ---------------------
set number
set relativenumber
set numberwidth=3
set shiftwidth=4
set encoding=utf-8
set background=dark
set noshowmode
set cursorline
set t_Co=256
colorscheme gruvbox
syntax on
inoremap jj <ESC>
inoremap <C-s> <ESC>:w<CR>
noremap so :source %
noremap cmd q:i
noremap qa <ESC>:qa<CR>

" Coc Config ---------------------

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

set rtp+=~/projects/coc.nvim/

" Coc Config end ---------------------

"Float Terminal ------------------
let g:floaterm_keymap_toggle = '<C-t>'

"vim-airline ------------------
let g:airline#extensions#tabline#formatter = 'unique_tail'
"Always showtabline
set showtabline=2

let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers

" Note: You must define the dictionary first before setting values.
" Also, it's a good idea to check whether it exists as to avoid
" accidentally overwriting its contents.

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" If you only see boxes here it may be because your system doesn't have
" the correct fonts. Try it in vim first and if that fails see the help
" pages for vim-airline :help airline-troubleshootingsso

" Speed up airline
let g:airline_experimental=1

" NERDTree -------------------
noremap <C-n> <ESC>:NERDTreeToggle<CR>

" fzf ------------------------
noremap <C-f> <ESC>:Files<CR>