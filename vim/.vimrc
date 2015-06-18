
set showmatch
set nobackup
set noswapfile
set ruler

set shiftround

" visual bell instead of beeping
set vb

" Make backspace work again in insert mode
set backspace=indent,eol,start

"better window nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use ',' as the leader character for mappings
let mapleader = ','

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" NeoBundle setup
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" comment visual blocks with 'gc'
NeoBundle 'tpope/vim-commentary'

" automatically insert ending statements (ex. esac or fi in bash)
" NeoBundle 'tpope/vim-endwise'

call neobundle#end()
filetype plugin indent on



" File browser addons
NeoBundle 'scrooloose/nerdtree' " simple file browser
let NERDTreeShowHidden = 1
map <F12> :NERDTreeToggle<cr>
vmap <F12> <esc>:NERDTreeToggle<cr>
nmap <F12> <esc>:NERDTreeToggle<cr>
imap <F12> <esc>:NERDTreeToggle<cr>

let NERDTreeIgnore = ['\.pyc$', '\.\~']

" Syntax highlighting stuff

" set number
syntax on

" more colors = better syntax highlighting
set t_Co=256

"sass syntax

NeoBundle 'cakebaker/scss-syntax.vim'
"let g:syntastic_scss_checkers = ['scss_lint']
" syntax highlighting for markdown
NeoBundle 'tpope/vim-markdown'

" better js syntax
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}

" JS call folding
" au FileType javascript call JavaScriptFold()

" Indent guides
NeoBundle 'nathanaelkane/vim-indent-guides'
colorscheme vimbrant
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=236
map <F10> <esc>:IndentGuidesToggle<cr>
vmap <F10> <esc>:IndentGuidesToggle<cr>
nmap <F10> <esc>:IndentGuidesToggle<cr>
imap <F10> <esc>:IndentGuidesToggle<cr>

"Automatically cause brackets and stuff
NeoBundle 'Raimondi/delimitMate'

"Trigger line split, only in insert mode
imap <C-c> <CR><Esc>O

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

"Linting stuff
"NeoBundle 'scrooloose/syntastic'
"let g:syntastic_always_populate_loc_list = 1
"nmap <silent> m <esc>:lprev<cr>
"nmap <silent> , <esc>:lnext<cr>

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


" Maps shift-[h,j,k,l] to resizing a window split
map <silent> <S-h> <C-w><
map <silent> <S-j> <C-W>-
map <silent> <S-k> <C-W>+
map <silent> <S-l> <C-w>>

" Autocompletion
let g:neocomplete#enable_at_startup = 1
NeoBundle 'Valloric/YouCompleteMe'
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" Better autocompletion for js
NeoBundle 'marijnh/tern_for_vim'
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Verify NeoBundle installation
NeoBundleCheck
