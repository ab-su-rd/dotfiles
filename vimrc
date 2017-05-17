" remove vintage vi compatibility
set nocompatible

" load vim 8 defaults
unlet! skip_defaults_vim
runtime defaults.vim

" remapping leader
let mapleader = ","

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

" long lines
set wrap

" vim-plug is the plugin manager
" [url]
" https://github.com/junegunn/vim-plug
" [installation]
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" async execution
Plug 'Shougo/vimproc.vim', { 'do': 'make -f make_mac.mak' }

" defaults - discarded in favor of vim8 defaults.vim
"Plug 'tpope/vim-sensible'

" display
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
Plug 'edkolev/tmuxline.vim'

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

" ctrl p
Plug 'Shougo/denite.nvim'

" motion
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" undo
Plug 'vim-scripts/Gundo', { 'on': 'GundoToggle' }

" scratch buffer
Plug 'duff/vim-scratch'

" searching
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep --ignore-dir=node_modules --ignore-dir=vendor --ignore-dir=bower_components'
endif
set wildignore+=*/node_modules/*,*/.sass-cache/*,*/.git/*,*/bower_components/*,*/.tmp/*,*.jpg,*.png,*/vendor/*

" git
Plug 'esneider/YUNOcommit.vim'
let g:YUNOcommit_after = 10
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" commenting
Plug 'scrooloose/nerdcommenter'

" alignment
Plug 'junegunn/vim-easy-align'

" code auto complete
Plug 'Shougo/neocomplete.vim'
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" snippets
Plug 'Shougo/neosnippet.vim'
"let g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet-snippets'

" tags
Plug 'majutsushi/tagbar'
"Plug 'vim-php/tagbar-phpctags.vim'
nmap <Leader>t :TagbarToggle<CR>

" linting
Plug 'w0rp/ale'
let g:ale_linters = {
            \ 'javascript': ['eslint'],
            \}
let g:ale_linter_aliases = {'stub': 'php'}
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" add closing brackets
Plug 'jiangmiao/auto-pairs'

" css
Plug 'ap/vim-css-color'

" javascript
" via: http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'

" vue
Plug 'posva/vim-vue'
autocmd FileType vue syntax sync fromstart

Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1

" php
Plug 'StanAngeloff/php.vim'
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

" autocomplete
Plug 'shawncplus/phpcomplete.vim'
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_cache_taglists = 1
let g:phpcomplete_enhance_jump_to_definition = 1

" php documentation generator
" dependencies
"Plug 'tobyS/vmustache'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
" plugin
"Plug 'tobyS/pdv'

" php autocomplete
"Plug 'm2mdas/phpcomplete-extended', { 'do': 'make -f make_mac.mak' }
"let g:phpcomplete_index_composer_command = "php /usr/local/bin/composer"
"autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
"Plug 'm2mdas/phpcomplete-extended-laravel'
"Plug 'padawan-php/padawan.vim'
"let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')
"let g:padawan#composer_command = "php /path/to/composer.phar"

" golang
Plug 'fatih/vim-go'
let g:go_list_type = "quickfix"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" docker
Plug 'ekalinin/Dockerfile.vim'

" Dash integration
Plug 'rizzatti/dash.vim'

call plug#end()

" Denite - needs to be after plug#end()
call denite#custom#var('file_rec', 'command',
            \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
nnoremap <C-p> :Denite file_rec<CR>
nnoremap <Leader><Leader> :Denite buffer<CR>

" --- mappings ---

" modifications
nmap j gj
nmap k gk

" buffer switching
nmap <Leader>r :bnext<CR>
nmap <Leader>w :bprev<CR>
nmap <Leader>d :bp\|bd #<CR> " http://stackoverflow.com/questions/4465095/vim-delete-buffer-without-losing-the-split-window
nmap <Leader>n :Scratch<CR> " create a scratch buffer
set hidden

" insert new line and position cursor for insert
imap <C-c> <CR><Esc>O

" colors
set background=dark
try
    colorscheme solarized
catch
endtry

" highlight 80th column, and everything beyond the 120th column
if (exists('+colorcolumn'))
    let &colorcolumn="80,".join(range(120,999),",")
    highlight ColorColumn ctermbg=0
endif

" save file that requires sudo
cmap w!! w !sudo tee % > /dev/null

" TODO
" ack/ag
" https://github.com/joyent/node/wiki/Vim-Plugins
" surround
