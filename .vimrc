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
set background=dark
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
"   Plugins
"-------------------------

"Настройки пакетного менеджера Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()


" Программирование
" C/C++
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'majutsushi/tagbar'

"Bundle 'vundle'
"
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
Bundle 'fweep/vim-tabber'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'TagHighlight'
"Bundle 'gcmt/taboo.vim'
Bundle 'junegunn/limelight.vim'




" Цветовые схемы
Bundle 'vim-scripts/summerfruit256.vim'

" Верстка
Bundle 'mattn/emmet-vim'
"Bundle 'skammer/vim-css-color'  -  coloresque better
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'wavded/vim-stylus'


"-------------------------
"Настройка плагинов
"-------------------------


"NERDTree
map <leader>n :NERDTreeToggle<CR>


"Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = '<c-z>'
autocmd FileType html,css,styl,EmmetInstall


"YCM
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_invoke_completion = '<leader><TAB>'

nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"POWERLINE
let g:Powerline_symbols = "fancy"

" Startify
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

" Stylus
autocmd BufRead,BufNewFile *.styl set filetype=styl
autocmd Syntax styl runtime! bundle/vim-stylus/syntax/stylus.vim
autocmd FileType styl set omnifunc=csscomplete#CompleteCSS

" TagBar
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
highlight TagbarSignature guifg=Red ctermfg=Red

" Whitespace
nmap <leader>w :StripWhitespace<CR>


" CntrlP
let g:ctrlp_map = '<leader>p'


" Vim-tabber
let g:tabber_filename_style = 'filename'
let g:tabber_wrap_when_shifting = 1
nnoremap <silent> <C-t> :999TabberNew<CR>:Startify<CR>
