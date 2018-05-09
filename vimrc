""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""
"                VIMRC : HE                "
""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""

"""" Plugins
"" Vim-plug begin
  call plug#begin('~/.vim/plugged')

"" Plugins list
  " filetree explorer
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  " git wrapper
  Plug 'tpope/vim-fugitive'
  " async syntax checker
  Plug 'w0rp/ale'
  " fuzzy file finder
  Plug 'kien/ctrlp.vim'
  " use <tab> for insert mode completions
  Plug 'ervandew/supertab'
  " simple mappings for quoting/parenthesizing
  Plug 'tpope/vim-surround'
  " molokai colorscheme
  Plug 'tomasr/molokai'
  " vim plugin for ack
  Plug 'mileszs/ack.vim'
  " vim plugin for the silver searcher
  Plug 'rking/ag.vim'
  " expand html abbreviations
  Plug 'mattn/emmet-vim'
  " expand javascript support
  Plug 'pangloss/vim-javascript'
  " add indent guides
  Plug 'nathanaelkane/vim-indent-guides'
  " add status/tabline
  Plug 'bling/vim-airline'
  " themes for airline
  Plug 'vim-airline/vim-airline-themes'
  " react jsx syntax highlighting and indenting
  Plug 'mxw/vim-jsx'
  "Plug 'maxmellon/vim-jsx-pretty'
  "Plug 'chemzqm/vim-jsx-improve' "disabled vim-javascript to enable this
  " html5 omnicomplete and syntax
  Plug 'othree/html5.vim', {'for': 'html'}
  " qml syntax highlighting
  Plug 'peterhoeg/vim-qml', {'for': 'qml'}
  " qt->qrc syntax highlighting
  Plug 'edtsft/vim-qrc', {'for': 'qrc'}
  " comply with pep8 in python indentation
  Plug 'Vimjas/vim-python-pep8-indent', {'for': 'py'}
  " snippets engine for vim
  Plug 'SirVer/ultisnips'
  " snippets
  Plug 'honza/vim-snippets'
  " ledger filetype for vim
  Plug 'ledger/vim-ledger', {'for': ['ledger', 'ldg', 'dat']}
  " vim interface for taskwarrior
  Plug 'blindFS/vim-taskwarrior'
  " up to date php syntax for vim
  Plug 'StanAngeloff/php.vim'
  " open list o most recently used files
  Plug 'yegappan/mru'
  " syntax checker
  "Plug 'scrooloose/syntastic'
  " tab completion
  "Plug 'Valloric/YouCompleteMe'
  " updates tags files automatically when saving
  "Plug 'craigemery/vim-autotag'

  "" Vim-plug end
  call plug#end()

""""""""""""""""""""""""""
"    HE CONFIGURATION    "
""""""""""""""""""""""""""

"""" Basic settings
"" General
  syntax on
  syntax enable
  set nocompatible	" be iMproved
  filetype on
  set modelines=0   "CVE-2007-2438
  set backspace=2   "more powerful backspacing
  " don't write backup file if vim is being called by "crontab -e"
  au BufWrite /private/tmp/crontab.* set nowritebackup
  " don't write backup file if vim is being called by "chpass"
  au BufWrite /private/etc/pw.* set nowritebackup
  set encoding=utf8
  " disable automatic commenting
  au FileType * set fo-=c fo-=r fo-=o
"" Tabing
  set expandtab
  set tabstop=2
  set shiftwidth=2
  " python
  autocmd FileType python setlocal sw=4 ts=4
"" Searching
  set hlsearch
  set incsearch
  set ignorecase
  set smartcase
"" Visuals
  colorscheme molokai
  set background=dark
  set mouse=a
  set number
  set cursorline
    " highlight number on cursorline
    hi LineNr term=bold ctermfg=DarkGrey gui=bold guifg=DarkGrey
    hi clear CursorLine
    augroup CLClear
      autocmd! ColorScheme * hi clear CursorLine
    augroup END
    hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow
"" Indent guides options
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=232
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=233
"" Airline options
  let g:airline_theme='luna'
  let g:airline_powerline_fonts = 1
  let g:ale_linters = { 'javascript': ['eslint'] }
  " set the filename section
  let g:airline_section_c = '%t'
  " set the line number section
  let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
  " ale syntax checker status
  let g:airline#extensions#ale#enabled = 1
"" CtrlP options
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|node_modules)$',
    \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
  \}
  let g:ctrlp_max_files = 0
  let g:ctrlp_working_path_mode = 'r'
"" Syntastic options
  let g:syntastic_javascript_checkers = ['eslint']
"" JSX options
  " allow JSX in normal JS files
  let g:jsx_ext_required = 0
"" Ledger options
  let g:ledger_align_at = 60
  let g:ledger_decimal_sep = '.'
  let g:ledger_default_commodity = 'MAD'
  let g:ledger_commodity_before = 0
  let g:ledger_commodity_sep = ' '
  au FileType ledger inoremap <silent> <s-Tab> <c-x><c-o>
  au FileType ledger vnoremap <silent><buffer> <TAB> :LedgerAlign<CR>
  au FileType ledger inoremap <silent><buffer> <c-a> <Esc>:call ledger#align_amount_at_cursor()<CR>
  au FileType ledger noremap { ?^\d<CR>
  au FileType ledger noremap } /^\d<CR>
  au FileType ledger noremap <silent><buffer> <c-t> :call ledger#transaction_state_toggle(line('.'), ' *?!')<CR>
"" Emmet options
  let g:user_emmet_settings = {
    \  'javascript.jsx' : {
      \      'extends' : 'jsx',
      \  },
    \}
"" Custom snippets folder
  set runtimepath+=~/.vim/he-snippets/

"""" Mappings
"" General
  " leader
  nnoremap <space> <nop>
  let mapleader = "\<space>"
  " local leader
  let maplocalleader = "\\"
  " better escape
  inoremap jj <Esc>
  " apply mapping
  nnoremap Q @q
  vnoremap Q :norm @q<CR>
  " better movements between splits
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-h> <C-W>h
  map <C-l> <C-W>l
  " quick open
  nnoremap <leader>sv :vsplit<CR>
  nnoremap <leader>sh :split<CR>
  nnoremap <leader>gf :vertical wincmd f<CR>
  nnoremap <leader>nt :NERDTree<CR>
  nnoremap <leader>ak :Ack<space>
  nnoremap <leader>ag :Ag<space>
  " tabs
  nnoremap <leader>tn :tabnew<CR>
  nnoremap <leader>tc :tabclose<CR>
  " remove highlight
  nnoremap <leader>nh :nohlsearch<CR>
  nnoremap <leader><space> :nohlsearch<CR>
  " buffers
  nnoremap <leader>l :bn<CR>
  nnoremap <leader>L :bn!<CR>
  nnoremap <leader>bn :bn<CR>
  nnoremap <leader>Bn :bn!<CR>
  nnoremap <leader>h :bp<CR>
  nnoremap <leader>H :bp!<CR>
  nnoremap <leader>bp :bp<CR>
  nnoremap <leader>Bp :bp!<CR>
  nnoremap <leader>bl :buffers<CR>
  nnoremap <leader>bb :buffers<CR>:buffer<Space>
  nnoremap <leader>Bb :buffers<CR>:buffer!<Space>
  nnoremap <leader>bd :bd<CR>
  nnoremap <leader>Bd :bd!<CR>
  nnoremap <leader>ba :1,1000 bd!<CR>
  nnoremap <leader>bq :bp <BAR> bd #<CR>
  nnoremap <leader>Bq :bp! <BAR> bd! #<CR>
  " edit new buffer
  nnoremap <leader>en :enew<CR>
  nnoremap <leader>En :enew!<CR>
  nnoremap <leader>ef :e<Space>
  " edit/save vimrc
  nnoremap <leader>ve :edit $MYVIMRC<CR>
  nnoremap <leader>Ve :edit! $MYVIMRC<CR>
  nnoremap <leader>vs :source $MYVIMRC<CR>:nohlsearch<CR>
  " quit a file
  nnoremap <leader>q :q<CR>
  nnoremap <leader>Q :q!<CR>
  " save a file
  nnoremap <leader>w :w<CR>
  " save then quit a file
  nnoremap <leader>wq :wq<CR>
  nnoremap <leader>Wq :wq!<CR>
  " open mru vim
  nnoremap <leader>f :MRU<CR>
  " add line without changing mode or position
  nnoremap <leader>o m`o<Esc>``
  nnoremap <leader>O m`O<Esc>``
  " yank text to the OS X clipboard
  noremap <leader>y "*y
  noremap <leader>yy "*Y
  " preserve indentation while pasting text from the OS X clipboard
  noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
  " preserve visual selection after indenting
  vmap > >gv
  vmap < <gv

"" Ale mappings
  " ale error navigation
  nmap <leader>erp <Plug>(ale_previous_wrap)
  nmap <leader>ern <Plug>(ale_next_wrap)
