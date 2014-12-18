" Базовые настройки
"-------------------------
"

filetype off
autocmd FileType <desired_filetypes> autocmd BufWritePre <buffer> StripWhitespace
set showcmd
" Включаем перенос строк по буквам, а не по словам
set wrap
" Показывать все возможные кандидаты для выбора при авто-завершении команд в командной строке
set wildmenu
set wildmode=list:longest
set wildignore=.git,*.swp,*/tmp/*
set wcm=<TAB>

" Оформление
set t_Co=256
colorscheme solarized
set background=dark
let g:solarized_termcolors=16
let g:solarized_visibility =  "low"
let g:signify_sign_weight = 'NONE'
let g:signify_sign_color_inherit_from_linenr = 1

" Показывает положение курсора
set ruler

" Подсветка текущей строки
set cursorline

" Нумерация строк
set nu

" Подсвечивать поиск
set hls

" Включить автоотступы
set smartindent
set autoindent

" Влючить подстветку синтаксиса
syntax on

" Размер табуляции
set shiftwidth=4
set softtabstop=4
set tabstop=4
" ··
set listchars=trail:·,extends:⋯,precedes:⋯,nbsp:~
"set list
" По умолчанию латинская раскладка
set iminsert=0
" Показывает первую парную скобку после ввода второй
"
set showmatch

" Формат строки состояния
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

set statusline=%<%f%h%m%r\ \ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set showtabline=2
set noshowmode

set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

"---------------------------
" Search options
"---------------------------

"Add the g flag to search/replace by default
set gdefault

" Highlight search results
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override the 'ignorecase' option if the search patter ncontains upper case characters
set smartcase

" Live search. While typing a search command, show where the pattern
set incsearch

" Disable higlighting search result on Enter key
nnoremap *<cr> :nohlsearch<cr><cr>
" Show matching brackets
set showmatch

"-------------------------
" Горячие клавишы
"-------------------------
map <C-n> :NERDTreeToggle<CR>

nmap <Space> <PageDown>
nmap <cr> o<ESC>k

imap <C-l> <Right>
imap <C-h> <Left>

imap <Leader>{ {}<Left><cr><cr><up><TAB>
imap <Leader>( ()<Left>
imap <Leader>[ []<Left>
imap <Leader>' ''<Left>
imap <Leader>" ""<Left>

imap <Leader><Tab> <C-x><C-o>

vmap < <gv
vmap > >gv

nnoremap * *N

filetype plugin indent on     " обязательно!

"-------------------------
" Plugins
"-------------------------

"Настройки пакетного менеджера Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle'gmarik/Vundle.vim'

" Программирование
" C/C++

"Bundle 'vundle'

Bundle 'snipMate'

" Удобства разные
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'jszakmeister/vim-togglecursor'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mhinz/vim-startify'
Bundle 'kien/ctrlp.vim'
"Bundle 'fweep/vim-tabber'

" Цветовые схемы
Bundle 'vim-scripts/summerfruit256.vim'

" Верстка
Bundle 'mattn/emmet-vim'
"Bundle 'skammer/vim-css-color'  -  coloresque better
Bundle 'gorodinskiy/vim-coloresque'


"-------------------------
"Настройка плагинов
"-------------------------

"Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"POWERLINE
let g:Powerline_symbols = "fancy"

"Indent guides
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 0
"let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" Startify
let g:startify_change_to_dir = 0
let g:startify_files_number = 8
let g:startify_bookmarks = ['~/.vimrc',]
let g:startify_list_order = [
		\ ['   My most recently', '   used files'],
		\ 'files',
		\ ['   My most recently used files in the current directory:'],
		\ 'dir',
		\ ['   These are my sessions:'],
		\ 'sessions',
		\ ['   These are my bookmarks:'],
		\ 'bookmarks',
		\ ]

" Tabline

