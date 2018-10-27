""""" HE: VIMRC

"""" PLUGIN MANAGER

""" Vim-plug BEGIN
call plug#begin('~/.vim/plugged')

""" PLUGIN LIST
" filetree explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" git status flags on NerdTree
" Plug 'Xuyuanp/nerdtree-git-plugin'
" git wrapper
Plug 'tpope/vim-fugitive'
" show a git diff in the 'gutter'
Plug 'airblade/vim-gitgutter'
" async syntax checker
Plug 'w0rp/ale'
" fuzzy file finder
Plug 'kien/ctrlp.vim'
" fuzzy file finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" use <tab> for insert mode completions
Plug 'ervandew/supertab'
" Comment functions
Plug 'scrooloose/nerdcommenter'
" simple mappings for quoting/parenthesizing
Plug 'tpope/vim-surround'
" remap . in a way that plugins can tap into it
Plug 'tpope/vim-repeat'
" vim motion on speed
Plug 'easymotion/vim-easymotion'
" molokai colorscheme
Plug 'tomasr/molokai'
" oceanic-next colorscheme
Plug 'mhartington/oceanic-next'
" vim plugin for ack
Plug 'mileszs/ack.vim'
" vim plugin for the silver searcher
Plug 'rking/ag.vim'
" expand html abbreviations
Plug 'mattn/emmet-vim'
" add indent guides
Plug 'nathanaelkane/vim-indent-guides'
" add status/tabline
Plug 'bling/vim-airline'
" themes for airline
Plug 'vim-airline/vim-airline-themes'
" a collection of language packs for Vim
Plug 'sheerun/vim-polyglot'
" expand javascript support
Plug 'pangloss/vim-javascript'
" react jsx syntax highlighting and indenting
Plug 'mxw/vim-jsx'
" yet Another JavaScript Syntax file for Vim
Plug 'othree/yajs.vim'
" syntax for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'
" tools for developing with Node.js in vim
Plug 'moll/vim-node'
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
" react code snippets
Plug 'epilande/vim-react-snippets'
" ledger filetype for vim
Plug 'ledger/vim-ledger', {'for': ['ledger', 'ldg', 'dat']}
" vim interface for taskwarrior
Plug 'blindFS/vim-taskwarrior'
" up to date php syntax for vim
Plug 'StanAngeloff/php.vim', {'for': 'php'}
" better indent HTML sections in PHP files
Plug 'captbaritone/better-indent-support-for-php-with-html', {'for': 'php'}
" pug template engine syntax highlighting and indention
Plug 'digitaltoad/vim-pug'
" open a list of most recently used files
Plug 'yegappan/mru'
" sublime text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'
" dark powered asynchronous completion framework for neovim/Vim8
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" LSP support for vim and neovim
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
" tern-based JavaScript editing support
"  (requires npm install inside .vim/plugged/tern_for_vim)
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
" deoplete.nvim source for javascript
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
" completion function for function parameters
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
" deoplete.nvim source for Python
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
" omni-completion plugin for Java
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
" syntax source for neocomplete/deoplete/ncm
Plug 'Shougo/neco-syntax'
" completion of words in adjacent tmux panes
Plug 'wellle/tmux-complete.vim'
" syntax checker
"Plug 'scrooloose/syntastic'
" tab completion
"Plug 'Valloric/YouCompleteMe'
" updates tags files automatically when saving
"Plug 'craigemery/vim-autotag'

""" Vim-plug END
call plug#end()


"""" USER

""" GENERAL
"" Basic
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
"" Completion
set complete=.,b,u,]
set completeopt=longest,menuone,preview
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
" for vim 7
set t_Co=256
" for vim 8
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
if (has("termguicolors"))
  set termguicolors
endif
" theme
colorscheme molokai
set background=dark
set mouse=a
set number
set relativenumber
set cursorline
" highlight number on cursorline
hi LineNr term=bold ctermfg=237 ctermbg=NONE gui=bold guifg=#3a3a3a guibg=NONE
hi clear CursorLine
augroup CLClear
  autocmd! ColorScheme * hi clear CursorLine
augroup END
hi CursorLineNr term=bold ctermfg=Yellow gui=bold guifg=Yellow

""" MAPPINGS
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
" better completion (uncomment if not using a plugin)
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
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
" buffers
nnoremap <leader>l :bn<CR>
nnoremap <leader>ll :bn<CR>
nnoremap <leader>L :bn!<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>Bn :bn!<CR>
nnoremap <leader>h :bp<CR>
nnoremap <leader>hh :bp<CR>
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
"" Fzf mappings
nmap <leader><tab> :Files<CR>
nmap <leader>fzf :Files<CR>
nmap <leader>fzb :Buffers<CR>
nmap <leader>fzc :Commits<CR>
"" Fugitive mappings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gmv :Gmove<space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
"" LanguageClient mappings
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lf :call LanguageClient_textDocument_documentSymbol()<CR>

""" PLUGINS
"" Indent guides options
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=NONE guibg=NONE
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=232 guibg=#080808
nnoremap <leader>ig :IndentGuidesToggle<CR>
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
"" Deoplete options
let g:deoplete#enable_at_startup = 1
" disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
      \ 'disabled_syntaxes', ['Comment', 'String'])
" sources
call deoplete#custom#option('sources', {
      \ '_': ['file', 'ultisnips'],
      \ 'html': ['file', 'ultisnips', 'LanguageClient'],
      \ 'css': ['file', 'ultisnips', 'LanguageClient'],
      \ 'javascript': ['file', 'ultisnips', 'LanguageClient'],
      \ 'python': ['file', 'ultisnips', 'LanguageClient'],
      \ })
"" LSP options
" automatically start language servers.
let g:LanguageClient_autoStart = 1
" required for operations modifying multiple buffers like rename.
set hidden
" servers
let g:LanguageClient_serverCommands = {
      \ 'html': ['html-languageserver', '--stdio'],
      \ 'css': ['css-languageserver', '--stdio'],
      \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
      \ 'javascript.jsx': ['/usr/local/bin/javascript-typescript-stdio'],
      \ 'python': ['/usr/local/bin/pyls'],
      \ }
"" Supertab options
" setup completion chaining, omni then keyword
"autocmd FileType *
      "\ if &omnifunc != '' |
      "\   call SuperTabChain(&omnifunc, "<c-p>") |
      "\ endif
" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
"" Ultisnips options
let g:UltiSnipsExpandTrigger="<C-e>"
"" Custom snippets folder
set runtimepath+=~/.vim/he-snippets/
