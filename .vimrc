" Interface
"-------------------------
    filetype off
    set showcmd
    " Нормальная индентация текста
    set wrap
    set breakindent

    set shell=/bin/bash
    "set shell=/usr/local/bin/fish

    " Показывать все возможные кандидаты для выбора при авто-завершении команд в командной строке
    set wildmenu
    set wildmode=list:longest
    set wildignore=.git,*.swp,*/tmp/*

    set iskeyword+=-
    "set wcm=<TAB>

    " Кирилица
    set keymap=russian-jcukenwin
    set iminsert=0
    set imsearch=0

    " Оформление
    set t_Co=256
    colorscheme solarized
    let g:rehash256 = 1
    set background=light
    let g:solarized_termcolors=256
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
    set smarttab
    set expandtab

    set list!
    "set listchars=tab:> eol:¬,trail:·,extends:>,precedes:<
    set listchars=tab:➜\ ,eol:¬,trail:·,extends:>,precedes:<
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

    " Show matching brackets
    set showmatch

" Mapping
"-------------------------

    let mapleader=','


    nnoremap *<cr> :nohlsearch<cr><cr>

    nnoremap <TAB> gt
    nnoremap <S-TAB> gT

    nnoremap j gj
    nnoremap k gk

    nnoremap <silent> <c-t> :<C-u>tabnew<CR>:Startify<CR>

    nnoremap ]q <silent> :<C-u>cprev<cr>
    nnoremap [q <silent> :<C-u>cnext<cr>

    ",fml for see all <leader> shorcuts

    " Shortcut for :%s//
    nnoremap <leader>s :<C-u>%s//<left>
    " Open Startify
    nnoremap <leader>S :<C-u>Startify<CR>
    " Next buffer
    nnoremap <leader>bn :<C-u>bn<CR>
    " Prev buffer
    nnoremap <leader>bp :<C-u>bp<CR>
    " Delere buffer without closing window
    nnoremap <leader>bd :<C-u>bp<bar>sp<bar>bn<bar>bd<CR>
    " Buffer's list
    nnoremap <leader>ls :<C-u>ls<CR>
    " Open tagbar
    nnoremap <leader>t :<C-u>TagbarToggle<CR>
    " Delete all whitespace
    nnoremap <leader>w :StripWhitespace<CR>
    " See in plugins setting
    "let g:ctrlp_map = '<leader>p'
    "
    nnoremap <Leader><left>  :<C-u>leftabove  vnew<CR>
    nnoremap <Leader><right> :<C-u>rightbelow vnew<CR>
    nnoremap <Leader><up>    :<C-u>leftabove  new<CR>
    nnoremap <Leader><down>  :<C-u>rightbelow new<CR>

    nnoremap <Space> <PageDown>

    nnoremap <cr> o<ESC>k


    noremap <up>    <C-W>+
    noremap <down>  <C-W>-
    noremap <left>  3<C-W><
    noremap <right> 3<C-W>>
    " Switch between current and last buffer
    nmap <leader>. <c-^>



    imap <C-l> <Right>
    imap <C-h> <Left>
    imap <C-j> <Down>
    imap <C-k> <Up>


    vmap < <gv
    vmap > >gv

    nnoremap * *N


"   File specific
"-------------------------

    "--- Python ---
        autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
        \ formatoptions+=croq softtabstop=4 smartindent
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
        autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

    "--- Stylus ---
        autocmd BufRead,BufNewFile *.styl set filetype=stylus
        autocmd Syntax styl runtime! bundle/vim-stylus/syntax/stylus.vim
        autocmd FileType stylus set omnifunc=csscomplete#CompleteCSS
        autocmd FileType styl setlocal iskeyword+=-
        autocmd FileType styl setlocal iskeyword+=$

    "--- Haml ---
        autocmd FileType jade setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
        autocmd FileType js setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

    "-- BEMHTML ---
        autocmd BufRead,BufNewFile *.bemhtml set filetype=bemhtml


"   Plugins
"-------------------------

    "Настройки пакетного менеджера Vundle
        filetype plugin indent on
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
        Bundle 'gmarik/vundle.git'


    " Программирование
        Bundle 'Valloric/YouCompleteMe'
        Bundle 'SirVer/ultisnips'
        Bundle 'majutsushi/tagbar'
        Bundle 'klen/python-mode'

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
        Bundle 'Raimondi/delimitMate'
        Bundle 'tpope/vim-surround'
        Bundle 'Lokaltog/vim-easymotion'
        Bundle 'TagHighlight'
        Bundle 'junegunn/limelight.vim'
        Bundle 'bling/vim-bufferline'
        Bundle 'edkolev/tmuxline.vim'
        Bundle 'airblade/vim-gitgutter'
        Bundle 'gregsexton/MatchTag'
        Bundle 'ryanoasis/vim-webdevicons'
        Bundle 'junegunn/goyo.vim'
        Bundle 'tpope/vim-fugitive'
        Bundle 'scrooloose/syntastic'
        Bundle 'ktonga/vim-follow-my-lead'


    " Цветовые схемы
        Bundle 'vim-scripts/summerfruit256.vim'
        Bundle 'lsdr/monokai'
        Bundle 'tomasr/molokai'
        Bundle 'cocopon/iceberg.vim'

    " Верстка
        Bundle 'mattn/emmet-vim'
        "Bundle 'skammer/vim-css-color'  -  coloresque better
        Bundle 'gorodinskiy/vim-coloresque'
        Bundle 'hail2u/vim-css3-syntax'
        Bundle 'vim-scripts/vim-stylus'
        Bundle 'csscomb/vim-csscomb'
        Bundle 'pangloss/vim-javascript'
        Bundle 'SevInf/vim-bemhtml'
        " Haml, scss, sass
        "Bundle 'tpope/vim-haml'




"    Настройка плагинов
"-------------------------


"--- NERDTree ---
    map <leader>n :NERDTreeToggle<CR>

    " NERDTress File highlighting
    function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
        exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
        exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    endfunction

    call NERDTreeHighlightFile('bemhtml', 'Magenta', 'none', 'Magenta', '#151515')
    call NERDTreeHighlightFile('bemjson.js', 'Magenta', 'none', 'Magenta', '#151515')
    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('bemhtml', 'Magenta', 'none', '#ff00ff', '#151515')
    call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
    call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('py', 'Magenta', 'none', '#ff00ff', '#151515')

"--- Emmet ---
"let g:user_emmet_install_global = 0
    let g:user_emmet_leader_key = '<c-z>'
    autocmd FileType html, EmmetInstall


"--- YCM ---
    let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_use_ultisnips_completer = 1
    let g:ycm_key_invoke_completion = '<leader><TAB>'


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

          ""\'x'    : '#(date)',


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
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
    highlight TagbarSignature guifg=Red ctermfg=Red

"--- CntrlP ---
    let g:ctrlp_map = '<leader>p'

"--- Multiple cursor ---
    let g:multi_cursor_quit_key='<C-c>'


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

"--- cc3 ---
    augroup VimCSS3Syntax
        autocmd!
        autocmd FileType css setlocal iskeyword+=-
    augroup END

"--- Web-devicons ---

    let g:webdevicons_enable_airline_tabline = 0
    let g:webdevicons_enable_airline_statusline = 1



"--- Goyo ---
    let g:goyo_margin_top = 1
    function! s:goyo_enter()
      if has('gui_running')
        set fullscreen
        set background=light
        set linespace=7
      elseif exists('$TMUX')
        silent !tmux set status off
      endif
    endfunction

    function! s:goyo_leave()
      if has('gui_running')
        set nofullscreen
        set background=dark
        set linespace=0
      elseif exists('$TMUX')
        silent !tmux set status on
      endif
    endfunction

    autocmd User GoyoEnter nested call <SID>goyo_enter()
    autocmd User GoyoLeave nested call <SID>goyo_leave()

"-- GitGutter --
    let g:gitgutter_realtime = 0

