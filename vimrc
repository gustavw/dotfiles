" Install vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
" Tmux fix
set guicursor=
"
filetype plugin on
" Disable sound
set visualbell
" set vertical and horizonatal splits
set splitright
set splitbelow
" Assaign new leaderkey ','
let mapleader=","
let g:mapleader=","
nmap <leader>w :w!<cr>
" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamedplus
" WSL NeoVIM # sudo ln -s /mnt/d/Neovim/bin/win32yank.exe /usr/bin/win32yank
" Mouse & backspace
set mouse=a
set number "show line number
noremap <F3> :set invnumber<CR>
set tw=0 " width of document
"set nowrap " don't automatically wrap on load
"set fo-=t " don't automatically wrap text when typing
set wrapmargin=0
set wrap
set linebreak
"set columns=80
set colorcolumn=80
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
au InsertLeave * match ExtraWhitespace /\s\+$/
" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
"set t_Co=256
"let g:solarized_termcolors=256
"let g:colors_name="summerfruit256"
"colorscheme blackboard
" Set ColorColumn to a dark color
highlight ColorColumn ctermbg=235
highlight Normal ctermfg=White
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
" Ruler and matching parantacies
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
hi LineNr ctermfg=darkgrey ctermbg=None
hi CursorLineNr ctermbg=white
set cursorline          " Show cursur the whole line
hi clear CursorLine
"hi CursorLine   cterm=bold ctermbg=darkblue ctermfg=lightgreen
"hi CursorLine gui=underline cterm=underline ctermfg=None
hi CursorLine   cterm=bold ctermbg=None ctermfg=None
"hi CursorLineNR cterm=bold ctermfg=black ctermbg=white
set formatoptions+=o    " Continue comment marker in new lines.


" Size col and row of buffer.
nmap <leader>w+ :vertical res +1<cr>
nmap <leader>w- :vertical res -1<cr>
nmap <leader>h+ :vertical res +1<cr>
nmap <leader>h- :vertical res -1<cr>
nmap ^[< :vertical res -1^M

" Tab commands
nmap <leader>t :tabnew <cr>
nmap <leader>T :tabclose <cr>

" Install plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'https://github.com/lisposter/vim-blackboard.git'
Plug 'https://github.com/vim-scripts/summerfruit256.vim.git'
Plug 'davidhalter/jedi-vim'
Plug 'rust-lang/rust.vim'
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
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

" Set color scheme
"let g:solarized_termcolors=256
"let g:solarized_termtrans = 1
"set background=dark
"colorscheme blackboard
let g:colors_name="summerfruit256"
colorscheme summerfruit256
" Languate Server Protocol specific config
set hidden

" RNLD specific plugins
" Close nerdtree after a file is selected
let NERDTreeQuitOnOpen = 1

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" CtrlP using ripgrep
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>

set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" jedi
let g:jedi#use_tabs_not_buffers = 0  " use buffers instead of tabs
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_command = "<localleader>gt"
let g:jedi#goto_assignments_command = "<localleader>ga"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<localleader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Exit terminal insert mode
tnoremap <Esc> <C-\><C-n>
noremap <leader>b :buffers<CR>:buffer<Space>

