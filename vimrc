""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""
"                VIMRC : HE                "
""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""

"Vundle PluginManager Settings
set nocompatible	      " be iMproved
filetype off            " temporary option for vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" " call vundle#begin('~/some/path/here')

" " PLUGINS
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" " Keep Plugin commands between vundle#begin/end.

" " plugin on GitHub repo
Plugin 'scrooloose/nerdtree'             "filetree explorer
Plugin 'tpope/vim-fugitive'              "git wrapper
"Plugin 'scrooloose/syntastic'            "syntax checker
Plugin 'w0rp/ale'	                       "async syntax checker
Plugin 'kien/ctrlp.vim'                  "fuzzy file finder
Plugin 'ervandew/supertab'               "use <tab> for insert mode completions
Plugin 'tpope/vim-surround'              "simple mappings for quoting/parenthesizing
Plugin 'tomasr/molokai'                  "molokai colorscheme
Plugin 'mileszs/ack.vim'                 "vim plugin for ack
Plugin 'craigemery/vim-autotag'          "updates tags files automatically when saving
Plugin 'mattn/emmet-vim'                 "expand html abbreviations
Plugin 'pangloss/vim-javascript'         "expand javascript support
Plugin 'nathanaelkane/vim-indent-guides' "add indent guides
Plugin 'bling/vim-airline'               "add status/tabline
Plugin 'vim-airline/vim-airline-themes'	 "themes for airline
Plugin 'mxw/vim-jsx'                     "react jsx syntax highlighting and indenting
Plugin 'othree/html5.vim'                "html5 omnicomplete and syntax
Plugin 'peterhoeg/vim-qml'	             "qml syntax highlighting
Plugin 'edtsft/vim-qrc'	                 "qt->qrc syntax highlighting
"Plugin 'Valloric/YouCompleteMe'          "tab completion

" " plugin from http://vim-scripts.org/vim/scripts.html

" " Git plugin not hosted on GitHub

" " git repos on your local machine (i.e. when working on your own plugin)

" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"
" " All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
" " To ignore plugin indent changes, instead use:
" " filetype plugin on
" "
" " Brief help
" "    :PluginList       - lists configured plugins
" "    :PluginInstall    - installs plugins; append `!` to update or just
" "    :PluginUpdate
" "    :PluginSearch foo - searches for foo; append `!` to refresh local cache
" "    :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""
"    HE CONFIGURATION    "
""""""""""""""""""""""""""

"""" Basic settings
"general
  syntax on
  syntax enable
  filetype on
  set modelines=0   "CVE-2007-2438
  set backspace=2   "more powerful backspacing
  "don't write backup file if vim is being called by "crontab -e"
  au BufWrite /private/tmp/crontab.* set nowritebackup
  "don't write backup file if vim is being called by "chpass"
  au BufWrite /private/etc/pw.* set nowritebackup
  set encoding=utf8
  "disable automatic commenting
  au FileType * set fo-=c fo-=r fo-=o
"tabing
  set expandtab
  set tabstop=2
  set shiftwidth=2
"searching
  set hlsearch
  set incsearch
  set ignorecase
  set smartcase
"visuals
  colorscheme molokai
  set background=dark
  set mouse=a
  set number
  set cursorline
    "highlight number on cursorline
    hi LineNr term=bold ctermfg=DarkGrey gui=bold guifg=DarkGrey
    hi clear CursorLine
    augroup CLClear
      autocmd! ColorScheme * hi clear CursorLine
    augroup END
    hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow
"Indent guides options
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=232
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=233
"Airline options
  let g:airline_theme='luna'
  let g:airline_powerline_fonts = 1
  "set the filename section
  let g:airline_section_c = '%t'
  "set the line number section
  let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
  "ale syntax checker status
  let g:airline#extensions#ale#enabled = 1
"CtrlP options
  let g:ctrlp_max_files = 0
"Syntastic options
  let g:syntastic_javascript_checkers = ['eslint']
"JSX options
  "Allow JSX in normal JS files
  let g:jsx_ext_required = 0

"""" Mappings
  ""leader
  nnoremap <space> <nop>
  let mapleader = "\<space>"
  ""local leader
  let maplocalleader = "\\"

  "better escape
    inoremap jj <Esc>
  "better movements between splits
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l
  "quick open
    nnoremap <leader>vs :vsplit<CR>
    nnoremap <leader>hs :split<CR>
    nnoremap <leader>tn :tabnew<CR>
    nnoremap <leader>gf :vertical wincmd f<CR>
    nnoremap <leader>nt :NERDTree<CR>
    nnoremap <leader>a :Ack<space>
  "remove highlight
    nnoremap <leader>nh :nohlsearch<CR>
  "edit/save vimrc
    nnoremap <leader>ev :vsplit $MYVIMRC<CR>
    nnoremap <leader>sv :source $MYVIMRC<CR>
  "add line without changing mode or position
    nnoremap <leader>o m`o<Esc>``
    nnoremap <leader>O m`O<Esc>``
  "yank text to the OS X clipboard
    noremap <leader>y "*y
    noremap <leader>yy "*Y

  "preserve indentation while pasting text from the OS X clipboard
    noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

  "ale error navigation
    noremap <leader>pe <Plug>(ale_previous_wrap)
    noremap <leader>ne <Plug>(ale_next_wrap)
