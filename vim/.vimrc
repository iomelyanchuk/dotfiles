" My .vimrc
" <leader> key by default is \
" vim:fileencoding=utf-8:foldmethod=marker

set nocompatible
language en_US.utf8

" Automatic installation for vim-plug IF not currently installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Polyglot configuration before loading
let g:polyglot_disabled = ['csv']

" Vim-plug
call plug#begin('~/.vim/plugged')
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf.vim'
Plug 'LunarWatcher/auto-pairs'
Plug 'psliwka/vim-smoothie'
Plug 'sheerun/vim-polyglot'
Plug 'thaerkh/vim-indentguides'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
"Plug 'lyokha/vim-xkbswitch'
"Plug 'preservim/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

" Main settings
"set updatetime=1000
set number
set relativenumber
set mouse=a
set mousehide
syntax on
filetype on
filetype plugin on
filetype indent on
set hidden
set wildmenu
set showcmd
set noruler
set noshowmode
set laststatus=2
set splitbelow
set confirm
set wrap
set linebreak
"set cmdheight=2
set notimeout ttimeout ttimeoutlen=50
set backspace=indent,eol,start
set sessionoptions=curdir,buffers,tabpages
set browsedir=current
set title
set ignorecase
set history=1000
set smartcase
set nohlsearch
set incsearch

" Shared clipboard for X11
set clipboard=unnamedplus

" Tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set cindent
set expandtab
set smartindent

" Disables spaces instead of tabs and changes the width of the indentation
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8
" For c/cpp
"au FileType c,cpp set expandtab tabstop=2 shiftwidth=2

" For ansible
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */inventories/* set filetype=ansible_hosts

"set list
"set listchars=tab:>-,trail:-

" Appearance
"set term=xterm-256color
"set t_Co=256
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = airline#section#create(['%3p%% ', '%l/%L', ' %3v'])

" NERD Commenter
" Add spaces after comment delimiters by default
"let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Keyboard switching via Ctrl+6
"set keymap=russian-jcukenwin
"set iminsert=0
"set imsearch=0

" Keyboard switching via vim-xkbswitch - X11 only
if $DISPLAY == "" || $WAYLAND_DISPLAY != ""
  let g:XkbSwitchEnabled = 0
  " Keyboard switching with old good langmap
  set langmap=ёйцукенгшщзхъфывапролджэячсмитьбю;`qwertyuiop[]asdfghjkl\;'zxcvbnm\\,.,ЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>
else
  let g:XkbSwitchEnabled = 1
  let g:XkbSwitchLib = '/usr/lib/libxkbswitch.so'
  let g:XkbSwitchIMappings = ['ru', 'uk']
  let g:XkbSwitchSkipIMappings =
  \ {'*': ['[', ']', "'", '"', '{', '}', '{<CR>', '/*', '/*<CR>'],}
  let g:XkbSwitchAssistNKeymap = 1	  " for commands r and f
  "let g:XkbSwitchAssistSKeymap = 1    " for search lines
  let g:XkbSwitchDynamicKeymap = 1
  let g:XkbSwitchKeymapNames =
  \ {'ru' : 'russian-jcukenwin', 'uk' : 'ukrainian-jcuken'}
  let g:XkbSwitchIminsertToggleKey = '<C-^>'
  let g:XkbSwitchIminsertToggleEcho = 0
  "let g:airline_detect_iminsert = 1
endif

" Move among buffers with CTRL
map <C-L> :bnext<CR>
map <C-H> :bprev<CR>

" Use black hole register on delete with <leader> key
nnoremap <leader>d "_d
xnoremap <leader>d "_d

" NERDTree
map <F5> :NERDTreeToggle<CR>

" Change cursor shape
let &t_SI = "\<Esc>[6 q"	" insert mode, vertical bar
let &t_SR = "\<Esc>[4 q"	" replace mode, underscore
let &t_EI = "\<Esc>[2 q"	" normal mode, block

" Spellchecker
set spelllang=en_us,ru
highlight clear SpellBad
highlight SpellBad cterm=underline
highlight SpellBad gui=undercurl

" Auto delete trailing whitespace, save cursor position {{{
augroup noWhitespace
  autocmd!
  autocmd BufWritePre * let currPos = getpos(".")
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritePre * %s/\n\+\%$//e
  autocmd BufWritePre *.[ch] %s/\%$/\r/e
  autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
augroup END
" }}}
