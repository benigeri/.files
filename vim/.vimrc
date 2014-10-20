"" The basics

" set number
syntax on

set showmatch

" set ruler

" highlight current line
" set cul

" visual bell instead of beeping
set vb

" Use ',' as the leader character for mappings
let mapleader = ','

" Ignore compiled files
set wildignore=*.o,*~,*.pyc


" NeoBundle setup
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" comment visual blocks with 'gc'
NeoBundle 'tpope/vim-commentary'

" automatically insert ending statements (ex. esac or fi in bash)
" NeoBundle 'tpope/vim-endwise'

" File browser addons
NeoBundle 'scrooloose/nerdtree' " simple file browser
let NERDTreeShowHidden = 1
map <F10> :NERDTreeToggle<cr> 
vmap <F10> <esc>:NERDTreeToggle<cr> 
nmap <F10> <esc>:NERDTreeToggle<cr> 
imap <F10> <esc>:NERDTreeToggle<cr>

" Extra syntax plugins
NeoBundle 'tpope/vim-markdown'

" Search settings
set hlsearch
set scrolloff=5
set incsearch
set ignorecase
set smartcase

" Tab completion for commands
set wildmenu
set wildmode=longest:full,full

" Tab settings
set smarttab
set expandtab
set shiftwidth=2
set softtabstop=2
au FileType python setl sw=4 sts=4 et
set textwidth=90
set autoindent

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>

" Verify NeoBundle installation
NeoBundleCheck
