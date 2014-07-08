set nocompatible " remove vintage vi compatibity

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
let g:solarized_termtrans=0
call togglebg#map("<F2>")
" Gundo
Bundle 'vim-scripts/Gundo'
" ctrl-p
Bundle 'kien/ctrlp.vim'
set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_custom_ignore = */node_modules/*,*/.sass-cache/*,*/.git/*,*/bower_components/*,*/.tmp/*,*.jpg,*.png
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](node_modules|bower_components|\.(tmp|git|sass-cache))'
\ }
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
let g:airline_theme='solarized'
Bundle 'edkolev/tmuxline.vim'
" syntastic
Bundle 'scrooloose/syntastic'
" vim-coffee-script
Bundle 'kchmck/vim-coffee-script'
" easytags
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
let g:easytags_updatetime_min=4000
" tagbar
Bundle 'majutsushi/tagbar'
nmap <Leader>t :TagbarToggle<CR>
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
 "let g:ycm_add_preview_to_completeopt=0
 "let g:ycm_confirm_extra_conf=0
 "set completeopt-=preview

set noshowmode
Bundle 'marijnh/tern_for_vim'
let g:tern_show_argument_hints = 'on_move'
let g:tern_show_signature_in_pum = 1

Bundle 'docunext/closetag.vim'
autocmd FileType html let b:closetag_html_style=1
autocmd Filetype html source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

Bundle 'scrooloose/nerdcommenter.git'

Bundle 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 25, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 25, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 25, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 25, 4)<CR>

"Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-colorscheme-switcher'
let g:colorscheme_switcher_keep_background=1

Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

Bundle 'kien/rainbow_parentheses.vim'
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

Bundle 'kshenoy/vim-signature'
Bundle 'elzr/vim-json'
Bundle 'tpope/vim-surround'
Bundle 'koron/minimap-vim'

syntax enable
set showcmd 	" display incomplete commands
filetype plugin indent on " file type plugins (?) + indentation

" mouse
set mouse=a

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
"set preserveindent
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

set cursorline

" colors and other visuals
"set t_Co=256 " TODO: add conditional setting
set t_Co=16
set background=dark
colorscheme solarized
"colorscheme zenburn
let &colorcolumn="80,".join(range(120,999),",")
" highlight ColorColumn ctermbg=236 " value specific to zenburn
highlight ColorColumn ctermbg=0

" splitting
set splitbelow " for :split
set splitright " for :vsplit

set scrolloff=2 " min 5 lines visible below the cursor

" mappings
nmap j gj
nmap k gk
nmap <Leader>w :bp<CR>
nmap <Leader>r :bn<CR>
nmap <Leader>d :bp\|bd #<CR> " http://stackoverflow.com/questions/4465095/vim-delete-buffer-without-losing-the-split-window
nmap <Leader>n :Scratch<CR> " create a scratch buffer

set laststatus =2

set ttyfast

" gui options
set guioptions-=T guioptions-=m
set guifont=SourceCode\ Pro\ Medium\ 9
map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

" buffers
set hidden " lets to switch from an unsaved buffer

" find better places for these
" set wildignore+=*/node_modules/*,*/.sass-cache/*,*/.git/*,*/bower_components/*,*/.tmp/*,*.jpg,*.png


set nu
