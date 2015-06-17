"-------------------------
"
" Базовые настройки

"-------------------------
"
filetype off
"autocmd FileType <desired_filetypes> autocmd BufWritePre <buffer> StripWhitespace
set showcmd
" Включаем перенос строк по буквам, а не по словам
set wrap

set shell=/bin/bash

" Показывать все возможные кандидаты для выбора при авто-завершении команд в командной строке
set wildmenu
set wildmode=list:longest
set wildignore=.git,*.swp,*/tmp/*
"set wcm=<TAB>

" Оформление
set t_Co=255
colorscheme solarized
let g:rehash256 = 1
set background=light
let g:solarized_termcolors=16
let g:solarized_visibility =  "low"
autocmd ColorScheme * highlight RedundantSpaces ctermbg=red


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
syntax enable

" Размер табуляции
set shiftwidth=4
set softtabstop=4
set tabstop=4
set list
set listchars=tab:>·,trail:·,extends:>,precedes:<

set sessionoptions+=tabpages,globals
set tabline=%!tabber#TabLine()

" Backspace
set backspace=indent,eol,start

" По умолчанию латинская раскладка
set iminsert=0

" Показывает первую парную скобку после ввода второй
set showmatch

" Disable vi-compatibility
set nocompatible

" Формат строки состояния
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

set showtabline=2
set guitablabel=%t\ %M

set statusline=%<%f%h%m%r\ \ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set noshowmode

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs


" Undo redo история изменений

if version >= 700
    set history=64
    set undolevels=128
    set undodir=~/.vim/undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" Автоматически исполняемый скрипт
function ModeChange()
    if getline(1) =~ "^#!"
        if getline(1) =~ "bin/"
            silent !chmod a+x <afile>
        endif
    endif
endfunction
au BufWritePost * call ModeChange()

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
"   Mapping
"-------------------------


" Кирилица
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

let mapleader=','

" Tabs
"nmap <C-t> :tabnew<cr>
nmap <TAB> gt
nmap <S-TAB> gT
nmap <silent> <c-t> :tabnew<CR>:Startify<CR>

nmap <Space> <PageDown>
nmap <cr> o<ESC>k

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>

" switch between current and last buffer
nmap <leader>. <c-^>



imap <C-l> <Right>
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <leader>


vmap < <gv
vmap > >gv

nnoremap * *N

filetype plugin indent on     " обязательно!

"-------------------------
"   Languages support
"-------------------------

"--- Python ---
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

"--- Stylus ---
autocmd BufRead,BufNewFile *.styl set filetype=styl
autocmd Syntax styl runtime! bundle/vim-stylus/syntax/stylus.vim
autocmd FileType styl set omnifunc=csscomplete#CompleteCSS

"-------------------------
"   Plugins
"-------------------------

"Настройки пакетного менеджера Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()


" Программирование
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'majutsushi/tagbar'
Bundle 'klen/python-mode'

"Bundle 'vundle'
"
Bundle 'snipMate'

" Удобства разные
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'jszakmeister/vim-togglecursor'
"Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'bling/vim-airline'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'mhinz/vim-startify'
Bundle 'kien/ctrlp.vim'
"Bundle 'fweep/vim-tabber'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'TagHighlight'
"Bundle 'gcmt/taboo.vim'
Bundle 'junegunn/limelight.vim'
Bundle 'bling/vim-bufferline'
Bundle 'edkolev/tmuxline.vim'


" Цветовые схемы
Bundle 'vim-scripts/summerfruit256.vim'
Bundle 'lsdr/monokai'
Bundle 'tomasr/molokai'

" Верстка
Bundle 'mattn/emmet-vim'
"Bundle 'skammer/vim-css-color'  -  coloresque better
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'wavded/vim-stylus'


"-------------------------
"    Настройка плагинов
"-------------------------


"--- NERDTree ---
map <leader>n :NERDTreeToggle<CR>


"--- Emmet ---
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = '<c-z>'
autocmd FileType html,css,styl,EmmetInstall


"--- YCM ---
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_invoke_completion = '<leader><TAB>'

nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"POWERLINE
"let g:Powerline_symbols = "fancy"

"--- Airline ---
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"--- Tmuxline ---
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

      "\'x'    : '#(date)',


"--- Startify ---
set viminfo='100,n$HOME/.vim/viminfo

autocmd VimEnter *
			\   if !argc()
			\ |   Startify
			\ |   NERDTree
			\ |   wincmd w
			\ | endif

let g:startify_change_to_dir = 0
let g:startify_files_number = 8
let g:startify_session_persistence = 0
let g:startify_bookmarks = ['~/.vimrc',]
let g:startify_list_order = [
		\ ['   Last recently opened files:'],
		\ 'files',
		\ ['   Last recently modified files in the current directory:'],
		\ 'dir',
		\ ['   My sessions:'],
		\ 'sessions',
		\ ['   My bookmarks:'],
		\ 'bookmarks',
		\ ]
let g:startify_session_dir = '~/.vim/session'
let g:startify_skiplist = [
	   \ 'COMMIT_EDITMSG',
	   \ $VIMRUNTIME .'/doc',
	   \ 'bundle/.*/doc',
	   \ '\.DS_Store'
	   \ ]


"--- TagBar ---
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
highlight TagbarSignature guifg=Red ctermfg=Red

"--- Whitespace ---
nmap <leader>w :StripWhitespace<CR>

"--- CntrlP ---
let g:ctrlp_map = '<leader>p'

"--- Multiple cursor ---
let g:multi_cursor_quit_key='<C-c>'

" Vim-tabber
"let g:tabber_filename_style = 'filename'
"let g:tabber_wrap_when_shifting = 1
"nnoremap <silent> <C-t> :999TabberNew<CR>:Startify<CR>

"--- PyMode ---
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pep8"
let g:pymode_lint_ignore="E501,W601,C0110"

" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

let g:pymode_options_max_line_length = 119
