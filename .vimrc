"   Plugins
"-------------------------

"

    "Настройки пакетного менеджера Vundle
    set nocompatible              " be iMproved, required
    filetype off                  " required

    "set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'


    " Программирование
        Plugin 'Valloric/YouCompleteMe'
        "Plugin 'SirVer/ultisnips'
        "Plugin 'majutsushi/tagbar'
        Plugin 'klen/python-mode'

    " Удобства разные
        Plugin 'ntpeters/vim-better-whitespace'
        Plugin 'jszakmeister/vim-togglecursor'
        Plugin 'scrooloose/nerdtree'
        Plugin 'scrooloose/nerdcommenter'
        Plugin 'bling/vim-airline'
        Plugin 'vim-airline/vim-airline-themes'
        Plugin 'mhinz/vim-startify'
        Plugin 'kien/ctrlp.vim'
        Plugin 'Raimondi/delimitMate'
        Plugin 'tpope/vim-surround'
        Plugin 'Lokaltog/vim-easymotion'
        Plugin 'bling/vim-bufferline'
        Plugin 'edkolev/tmuxline.vim'
        Plugin 'airblade/vim-gitgutter'
        Plugin 'gregsexton/MatchTag'
        Plugin 'tpope/vim-fugitive'
        Plugin 'scrooloose/syntastic'
        Plugin 'Xuyuanp/nerdtree-git-plugin'
        Plugin 'mileszs/ack.vim'
        Plugin 'NLKNguyen/copy-cut-paste.vim'
        Plugin 'jlanzarotta/bufexplorer'
        Plugin 'nelstrom/vim-qargs'
        Plugin 'elzr/vim-json'
        Plugin 'editorconfig/editorconfig-vim'

    " Frontend
        Plugin 'mattn/emmet-vim'
        Plugin 'gorodinskiy/vim-coloresque'
        Plugin 'JulesWang/css.vim'
        Plugin 'wavded/vim-stylus'
        Plugin 'SevInf/vim-bemhtml'

        Plugin 'lervag/vimtex'
        Plugin 'kchmck/vim-coffee-script'
        "Plugin 'cakebaker/scss-syntax.vim'
        Plugin 'tpope/vim-haml'
        Plugin 'digitaltoad/vim-jade'
        Plugin 'lepture/vim-jinja'
        Plugin 'heavenshell/vim-jsdoc'
        Plugin 'git://github.com/pangloss/vim-javascript.git'
        Plugin 'ternjs/tern_for_vim'
        Plugin 'mxw/vim-jsx'


    " Colorcheme
        Plugin 'flazz/vim-colorschemes'
        Plugin 'altercation/vim-colors-solarized'
        Plugin 'ColorSchemeMenuMaker'


    call vundle#end()            " required
    filetype plugin indent on    " required

" Interface
"-------------------------
    set showcmd
    " Нормальная индентация текста
    set wrap

    set breakindent

    set noswapfile

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
    let g:enable_bold_font = 1

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
    set listchars=trail:·,tab:»·,eol:¬
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
    "function ModeChange()
        "if getline(1) =~ "^#!"
            "if getline(1) =~ "bin/"
                "silent !chmod a+x <afile>
            "endif
        "endif
    "endfunction
    "au BufWritePost * call ModeChange()


    set completeopt-=preview


"
" GUI
"---------------------------

    if has('gui_running')
        set guitablabel=%t\ %M
        set guioptions-=m
        set guioptions-=T
        set guioptions-=r
        set guioptions-=L
        set macligatures
        set guifont=Fira\ Code:h14
    endif
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

    nnoremap <silent><TAB> :<C-u>bn<CR>
    nnoremap <silent><S-TAB> :<C-u>bp<CR>

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
    nnoremap <silent><leader>bd :<C-u>bn<bar>sp<bar>bp<bar>bd<CR>
    " Buffer's list
    nnoremap <leader>ls :<C-u>ls<CR>
    " Open tagbar
    nnoremap <leader>t :<C-u>TagbarToggle<CR>
    " Delete all whitespace
    nnoremap <leader>w :StripWhitespace<CR>
    " See in plugins setting
    " Open .vimrc
    nnoremap <leader>v :<C-u>e ~/.vimrc<CR>

    "let g:ctrlp_map = '<leader>p'
    "
    " Switch between current and last buffer
    nmap <leader>. <c-^>

    " Get the name of the current file
    nmap <leader>fp :<C-u>echo @%<cr>
    nmap <leader>fy :<C-u>:let @" = expand("%")<cr>


    nnoremap <Leader><left>  :<C-u>leftabove  vnew<CR>
    nnoremap <Leader><right> :<C-u>rightbelow vnew<CR>
    nnoremap <Leader><up>    :<C-u>leftabove  new<CR>
    nnoremap <Leader><down>  :<C-u>rightbelow new<CR>

    " ,r
        " Find and replace in all open buffers
        " See http://vim.wikia.com/wiki/VimTip382
        function! Replace()
            let s:cword = expand('<cword>')
            if !s:cword
                let s:cword = input("Put the word:")
            endif
            let s:word = input("Replace " . s:cword . " with:")
            :exe 'bufdo! %s/\<' . s:cword . '\>/' . s:word . '/gce'
            :unlet! s:word
            :unlet! s:cword
        endfunction
        nnoremap <Leader>r :<C-u>call Replace()<CR>

    " ,R
        " Find and replace in all open buffers
        " See http://vim.wikia.com/wiki/VimTip382
        function! ArgReplace()
            let s:cword = expand('<cword>')
            if !s:cword
                let s:cword = input("Put the word:")
            endif
            let s:word = input("Replace " . s:cword . " with:")
            let s:dir = input("in Dir:")
            :exe 'Ack!' . s:cword . ' ' . s:dir
            :exe 'Qargs'
            :exe 'argdo! %s/\<' . s:cword . '\>/' . s:word . '/gce' . '| w'
            :unlet! s:word
            :unlet! s:cword
        endfunction
        nnoremap <Leader>R :<C-u>call ArgReplace()<CR>

    nnoremap <Space> <PageDown>

    nnoremap <cr> o<ESC>k

    "Y from cursor position to the end of line
    nnoremap Y y$

    " Search matches are always in center
    nnoremap n nzz
    nnoremap N Nzz

    noremap <up>    <C-W>+
    noremap <down>  <C-W>-
    noremap <left>  3<C-W><
    noremap <right> 3<C-W>>


    imap <C-l> <Right>
    imap <C-h> <Left>
    imap <C-j> <Down>
    imap <C-k> <Up>


    vmap < <gv
    vmap > >gv

    nnoremap * *N

    map ё `
    map й q
    map ц w
    map у e
    map к r
    map е t
    map н y
    map г u
    map ш i
    map щ o
    map з p
    map х [
    map ъ ]
    map ф a
    map ы s
    map в d
    map а f
    map п g
    map р h
    map о j
    map л k
    map д l
    map ж ;
    map э '
    map я z
    map ч x
    map с c
    map м v
    map и b
    map т n
    map ь m
    map б ,
    map ю .
    map Ё ~
    map Й Q
    map Ц W
    map У E
    map К R
    map Е T
    map Н Y
    map Г U
    map Ш I
    map Щ O
    map З P
    map Х {
    map Ъ }
    map Ф A
    map Ы S
    map В D
    map А F
    map П G
    map Р H
    map О J
    map Л K
    map Д L
    map Ж :
    map Э "
    map Я Z
    map Ч X
    map С C
    map М V
    map И B
    map Т N
    map Ь M
    map Б <
    map Ю >


"   File specific
"-------------------------

    "--- Python ---
        augroup filetype_python
            autocmd!
            autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
            \ formatoptions+=croq softtabstop=4 smartindent
            \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
            autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
        augroup END

    "--- CSS ---
        augroup filetype_css
            autocmd!
            autocmd FileType css set omnifunc=csscomplete#CompleteCSS
        augroup END

    "--- Stylus ---
        augroup filetype_stylus
            autocmd!
            autocmd BufRead,BufNewFile *.styl set filetype=stylus
            autocmd FileType stylus set omnifunc=csscomplete#CompleteCSS
            autocmd FileType stylus setlocal iskeyword+=-
            autocmd FileType stylus setlocal iskeyword+=$
        augroup END

    "--- SCSS ---
        "au BufRead,BufNewFile *.scss set filetype=scss
        augroup filetype_scss
            autocmd!
            autocmd FileType scss set iskeyword+=-
        augroup END

    "--- HTML ---
        augroup filetype_html
            autocmd!
            autocmd FileType html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
        augroup END


    "--- Jade ---
        augroup filetype_jade
            autocmd!
            autocmd BufRead,BufNewFile *.jade set filetype=jade
            autocmd FileType jade setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
        augroup END

    "--- Haml ---
        augroup filetype_haml
            autocmd!
            autocmd FileType haml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
        augroup END

    "--- Yaml ---
        augroup filetype_yaml
            autocmd!
            autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
        augroup END


    "-- BEMHTML ---
        augroup filetype_bemhtml
            autocmd!
            autocmd BufRead,BufNewFile *.bemhtml set filetype=bemhtml
        augroup END

    "--- Coffee ---
        augroup filetype_coffee
            autocmd!
            autocmd BufRead,BufNewFile *.coffee set filetype=coffee
            autocmd FileType coffee setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
        augroup END

    "--- Js ---
        augroup filetype_js
             autocmd FileType javascript setlocal omnifunc=tern#Complete
        augroup END

    "--- TeX ---
        augroup filetype_tex
            autocmd!
            autocmd BufRead,BufNewFile *.tex set filetype=tex
            autocmd FileType tex nnoremap <leader>c :<c-u>VimtexCompileToggle<c-r>
            autocmd FileType tex nnoremap <leader>v :<c-u>VimtexView<c-r>
        augroup END


"    Настройка плагинов
"-------------------------

    "--- Solarized ---
        let g:solarized_termtrans=1    "default value is 0
        let g:solarized_termcolors=256    "default value is 16
        let g:solarized_visibility="low"    "default value is normal
        syntax enable
        set background=dark
        colorscheme solarized



    "--- NERDTree ---
        map <leader>n :NERDTreeToggle<CR>

        " NERDTress File highlighting
        function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
            exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg
            exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
        endfunction

        "call NERDTreeHighlightFile('bemhtml', 'Magenta', 'none', 'Magenta', 'none')
        "call NERDTreeHighlightFile('bemjson.js', 'Magenta', 'none', 'Magenta', 'none')
        "call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', 'none')
        "call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', 'none')
        "call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', 'none')
        "call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', 'none')
        "call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', 'none')
        "call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', 'none')
        "call NERDTreeHighlightFile('bemhtml', 'Magenta', 'none', '#ff00ff', 'none')
        "call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', 'none')
        "call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', 'none')
        "call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', 'none')
        "call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
        "call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
        "call NERDTreeHighlightFile('py', 'Magenta', 'none', '#ff00ff', 'none')

    "--- Emmet ---
    "let g:user_emmet_install_global = 0
        let g:user_emmet_leader_key = '<c-z>'
        autocmd FileType html, EmmetInstall


    "--- YCM ---
        let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
        let g:ycm_autoclose_preview_window_after_completion=1
        "let g:ycm_use_ultisnips_completer = 1

        " For TeX
          if !exists('g:ycm_semantic_triggers')
            let g:ycm_semantic_triggers = {}
          endif
          let g:ycm_semantic_triggers.tex = [
                \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
                \ ]

    "--- Airline ---
        let g:airline_powerline_fonts = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tmuxline#enabled = 0
        let g:airline#extensions#tabline#fnamemod = ':t'
        let g:airline_right_alt_sep = ' '
        let g:airline_right_sep = ' '
        let g:airline_left_alt_sep= ' '
        let g:airline_left_sep = ' '

    "--- Tmuxline ---
      let g:tmuxline_separators = {
          \ 'left' : ' ',
          \ 'left_alt': ' ',
          \ 'right' : ' ',
          \ 'right_alt' : ' ',
          \ 'space' : ' '}
      let g:tmuxline_theme = 'airline_visual'

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
        "let g:ctrlp_custom_ignore = '\v[\/](node_modules|bower_components)|(\.(swp|ico|git|svn))$'
        let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|(\.(jpg|mp4|png|ogv|webm)$'

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

    "-- TeX --

    "-- Syntastic --
        let g:syntastic_enable_tex_checker = 0
        function! JavascriptLinter(curpath)
          let parent=1
          let local_path=a:curpath
          let local_jscs=local_path . '.jscsrc'

          while parent <= 255
            if filereadable(local_jscs)
              return ['jscs']
            endif
            let parent = parent + 1
            let local_path = local_path . "../"
            let local_jscs = local_path . '.jscsrc'
          endwhile

          unlet parent local_jscs

          return ['jshint']
        endfunction

        function! JscsFix()
            "Save current cursor position"
            let l:winview = winsaveview()
            "Pipe the current buffer (%) through the jscs -x command"
            % ! jscs -x
            "Restore cursor position - this is needed as piping the file"
            "through jscs jumps the cursor to the top"
            call winrestview(l:winview)
        endfunction
        command! JscsFix :call JscsFix()

        let g:syntastic_javascript_checkers=[]

    "--- BufExplorer ---
        let g:bufExplorerShowRelativePath=1

    "--- Tern ---
        let g:tern_show_signature_in_pum=1

    "--- YouCompleteMe ---
    " make YCM compatible with UltiSnips (using supertab)

    "--- UltiSnips ---
     " better key bindings for UltiSnipsExpandTrigger
         let g:UltiSnipsExpandTrigger="<leader><tab>"
         let g:UltiSnipsJumpForwardTrigger="<c-j>"
         let g:UltiSnipsJumpBackwardTrigger="<c-k>"

    "--- jsdoc ---
        let g:jsdoc_allow_input_prompt = 1
        let g:jsdoc_input_description = 1
        let g:jsdoc_underscore_private = 1
        let g:jsdoc_access_descriptions = 1

