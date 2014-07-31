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

"  set vertical and horizonatal splits
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

" Python specific part
map <F5> :w ! python3<CR>

" Size col and row of buffer.
nmap <leader>w+ :vertical res +1<cr> 
nmap <leader>w- :vertical res -1<cr> 
nmap <leader>h+ :vertical res +1<cr> 
nmap <leader>h- :vertical res -1<cr> 
nmap ^[< :vertical res -1^M

" Install  plugin in (~/.vim/compiler)
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
" Set pydoc to open in a vertical split 'vnew' and search word marked by cursor
let g:pydoc_version = 'pydoc3.4'
nmap <leader>d :call Rnldvimdev(
    \ 'vnew',
    \ '__pydoc__',
    \ "r ! " . g:pydoc_version . ' ' . expand('<cword>'))
    \ <cr> 

" Set python interpreter to execute in a split vnew
nmap <leader><F5> :call Rnldvimdev(
    \ 'vnew',
    \ '__python__',
    \ "r ! python3 " . @%)
    \ <cr> 

" Setup pylint
nmap <leader>l :call Rnldvimdev(
    \ 'vnew',
    \ '__pylint__',
    \ "r ! pylint " . @%)
    \ <cr> 


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode

" Make pyhton3 as default
"let g:pymode_python = 'python3'

"let g:pymode_doc = 1
"let g:pymode_doc_bind = 'K'

"map <Leader>g :call RopeGotoDefinition()<CR>
"let ropevim_enable_shortcuts = 1
"let g:pymode_rope_goto_def_newwin = "vnew"
"let g:pymode_rope_extended_complete = 1
"let g:pymode_breakpoint = 0
"let g:pymode_syntax = 1
"let g:pymode_syntax_builtin_objs = 0
"let g:pymode_syntax_builtin_funcs = 0
"let g:pymode_folding = 0
"let g:pymode_rope_guess_project=0
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
