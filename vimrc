set nocompatible " remove vintage vi compatibity

" need to remap leader on top
let mapleader = ","

filetype off
set encoding=utf-8

" vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
" extra packages/plugins
" 256 colorschemes for the terminal
Bundle 'flazz/vim-colorschemes'
" solarized colorscheme
Bundle 'altercation/vim-colors-solarized'
" ctrl-p
Bundle 'kien/ctrlp.vim'
set runtimepath^=~/.vim/bundle/ctrlp.vim
nmap <C-p> :CtrlPMixed<CR>
nmap <Leader><Leader> :CtrlPBuffer<CR>
" nmap ; :CtrlPBuffer<CR> " explore using ; before remapping
" NERDTree
Bundle 'scrooloose/nerdtree'
nmap <Leader>e :NERDTreeToggle<CR>
" vim-airline
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" syntastic
Bundle 'scrooloose/syntastic'
" vim-coffee-script
Bundle 'kchmck/vim-coffee-script'
" tagbar
Bundle 'majutsushi/tagbar'
" javascript - http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
imap <C-c> <CR><Esc>O
Bundle 'Valloric/YouCompleteMe'
" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" " YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
" let g:ycm_add_preview_to_completeopt=0
" let g:ycm_confirm_extra_conf=0
" set completeopt-=preview
Bundle 'marijnh/tern_for_vim'

Bundle 'docunext/closetag.vim'
autocmd FileType html let b:closetag_html_style=1
autocmd Filetype html source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

Bundle 'scrooloose/nerdcommenter.git'

syntax enable
set showcmd 	" display incomplete commands
filetype plugin indent on " file type plugins (?) + indentation

" file management
set nobackup
set noswapfile
set undofile

" indentation
set tabstop=4
set shiftwidth=4
set noexpandtab
set backspace=indent,eol,start
set autoindent
set copyindent
set smarttab

" code related
set showmatch

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase
nmap <Leader>q :nohlsearch<CR> " remove search highlight

" autocomplete for commands
set wildmenu
set wildmode=longest:full,full

" colors and other visuals
set t_Co=256 " TODO: add conditional setting
" let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set cursorline
let &colorcolumn="80,".join(range(120,999),",")
" highlight ColorColumn ctermbg=236 " value specific to zenburn
highlight ColorColumn ctermbg=0

" splitting
set splitbelow " for :split
set splitright " for :vsplit

set scrolloff=5 " min 5 lines visible below the cursor

" mappings
nmap j gj
nmap k gk
nmap <Leader>w :bp<CR>
nmap <Leader>r :bn<CR>
nmap <Leader>d :bd<CR>

set laststatus =2

set ttyfast

" gui options
set guioptions-=T
set guifont=SourceCode\ Pro\ Medium

" buffers
set hidden " lets to switch from an unsaved buffer

" find better places for these
set wildignore+=*/node_modules/*,*/.sass-cache/*,*/.git/*,*/bower_components/*,*/.tmp/*,*.jpg,*.png
