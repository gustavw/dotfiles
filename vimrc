map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
syntax enable
" Auto update .vimrc
autocmd! bufwritepost .vimrc source %
"
filetype plugin on
" set vertical and horizonatal splits
set splitright
set splitbelow
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
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
"set t_Co=256
"let g:solarized_termcolors=256
colorscheme blackboard
" Set ColorColumn to a dark color
highlight ColorColumn ctermbg=235
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
set nobackup
set nowritebackup
set noswapfile

" Size col and row of buffer.
nmap <leader>w+ :vertical res +1<cr>
nmap <leader>w- :vertical res -1<cr>
nmap <leader>h+ :vertical res +1<cr>
nmap <leader>h- :vertical res -1<cr>
nmap ^[< :vertical res -1^M
" Install plugin in (~/.vim/compiler)
" git clone git://github.com/vim-scripts/.vim.git
"autocmd FileType python compiler
" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()
" ============================================================================
" Python IDE Setup
" ============================================================================
" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2
" RNLD specific plugins
source ~/dotfiles/vimrc_py " python
" RNLD Postgres scritps
"source ~/.vimrc_psql

