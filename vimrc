" remove vintage vi compatibility
set nocompatible

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd

set wildmenu
set wildmode=list:longest

set visualbell
set cursorline

set ttyfast
set ruler
set laststatus=2

" numbering
set number
set relativenumber

set undofile
set nobackup
set noswapfile

" code
set showmatch

" splitting
set splitbelow
set splitright

" remapping leader
let mapleader = "\\"

" vim-plug is the plugin manager
" [url]
" https://github.com/junegunn/vim-plug
" [installation]
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" async execution

Plug 'Shougo/vimproc.vim', { 'do': 'make -f make_mac.mak' }

" defaults

Plug 'tpope/vim-sensible'

" display

Plug 'edkolev/tmuxline.vim'

Plug 'bling/vim-airline'
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1


" color schemes

Plug 'flazz/vim-colorschemes'

Plug 'altercation/vim-colors-solarized'
let g:solarized_termtrans=1
let g:solarized_visibility="normal"
let g:solarized_contrast="normal"
let g:solarized_termcolors=16

" navigation

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
nmap <Leader>e :NERDTreeToggle<CR>

Plug 'Shougo/unite.vim'

" motion

Plug 'Lokaltog/vim-easymotion'

Plug 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" tags

Plug 'majutsushi/tagbar'

Plug 'vim-php/tagbar-phpctags.vim', { 'do' : 'make' }
let g:tagbar_phpctags_bin = '~/.vim/plugged/tagbar-phpctags.vim/bin/phpctags'
nmap <Leader>t :TagbarToggle<CR>

Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" editing

Plug 'vim-scripts/Gundo', { 'on': 'GundoToggle' }

" commenting
Plug 'scrooloose/nerdcommenter'

" alignment

Plug 'junegunn/vim-easy-align'

" git

Plug 'esneider/YUNOcommit.vim'
let g:YUNOcommit_after = 10

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'

" code

Plug 'Valloric/YouCompleteMe', { 'do': 'git submodule update --init --recursive && ./install.sh' }

Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args = '--report=csv --standard=PSR2'
"let g:syntastic_mode_map = { 'mode': 'active',
    "\ 'active_filetypes': [],
    "\ 'passive_filetypes': ['php']
    "\ }

Plug 'jiangmiao/auto-pairs'

" languages

" css

Plug 'ap/vim-css-color'

" javascript

Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1

" php

" below plugins are failing on the tv-api codebase - on vendor code
"Plug 'm2mdas/phpcomplete-extended', { 'do': 'make -f make_mac.mak' }
"autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP

"Plug 'm2mdas/phpcomplete-extended-laravel'

" editorconfig

Plug 'editorconfig/editorconfig-vim'

" misc
Plug 'duff/vim-scratch'

call plug#end()

" modifications
nmap j gj
nmap k gk

" mouse
set mouse=a

" search
set incsearch
set ignorecase
set smartcase
set hlsearch
set showmatch
nmap <Leader>q :nohlsearch<CR>

" tabs
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" buffer switching
nmap <Leader>r :bnext<CR>
nmap <Leader>w :bprev<CR>
nmap <Leader>d :bp\|bd #<CR> " http://stackoverflow.com/questions/4465095/vim-delete-buffer-without-losing-the-split-window
nmap <Leader>n :Scratch<CR> " create a scratch buffer
set hidden

" insert new line and position cursor for insert
imap <C-c> <CR><Esc>O

" long lines
set wrap

" colors
set background=dark
try
    colorscheme solarized
catch
endtry

" set list
" set listchars=tab:▸\ ,eol:¬

" highlight 80th column, and everything beyond the 120th column
if (exists('+colorcolumn'))
    let &colorcolumn="80,".join(range(120,999),",")
    highlight ColorColumn ctermbg=0
endif

" filesystem
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', 'node_modules\|bower_components')
nnoremap <C-p> :Unite -no-split -start-insert -auto-preview file_rec/async<CR>

" TODO
" ack/ag
" airline
" unite
" php
" html/javascript/css
