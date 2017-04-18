" Python enviroments
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_python_provider = 1

" General setup
filetype plugin indent on
syntax enable
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
set t_Co=256

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


autocmd! bufwritepost init.vim source %
filetype plugin on
" Assaign new leaderkey ','
let mapleader=","
let g:mapleader=","
nmap <leader>w :w!<cr>
" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed
" Mouse & backspace
set mouse=a
set number "show line number
set tw=79 " width of document
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
"highlight ColorColumn ctermbg=235

"set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set cursorline          " Show cursur the whole line
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
"set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" Easier formatting of paragraphs
vmap Q gq
nmap Q gqap
" History settings
set history=700
set undolevels=700
" tab options
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase
" Disable swp files
"set nobackup
"set nowritebackup
"set noswapfile

" Size col and row of buffer.
nmap <leader>w+ :vertical res +1<cr>
nmap <leader>w- :vertical res -1<cr>
nmap <leader>h+ :vertical res +1<cr>
nmap <leader>h- :vertical res -1<cr>
nmap ^[< :vertical res -1^M

" Plugin section
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'altercation/vim-colors-solarized'
Plug 'https://github.com/lisposter/vim-blackboard.git'
Plug 'tpope/vim-vividchalk'
Plug 'JuliaEditorSupport/julia-vim'
" Language server protocol specific
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
" (Optional) Multi-entry selection UI.
Plug 'Shougo/denite.nvim'
" (Optional) Completion integration with deoplete.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" (Optional) Completion integration with nvim-completion-manager.
Plug 'roxma/nvim-completion-manager'
" (Optional) Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'
call plug#end()

" Airline plugin settings
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme = 'jellybeans'

" Show NERDtree on startup
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Set color scheme
"let g:solarized_termcolors=256
"let g:solarized_termtrans = 1
set background=dark
colorscheme vividchalk
" Languate Server Protocol specific config
set hidden

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" Languate Server Protocol specific config
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['cargo', 'run', '--release', '--manifest-path=/opt/rls/Cargo.toml'],
    \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ 'python': ['pyls'],
    \ 'julia': ['julia -e "using LanguageServer"'],
    \ 'haskell': ['hie', '--lsp', '-d', '-l', '/tmp/hie.log']
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
