"set nocompatible
filetype plugin on
function! LoadVundle()
    let vundle_installed=filereadable(expand('~/.vim/bundle/vundle/README.md'))
    if vundle_installed == 0
        echo "Creating backups directory..."
        silent !mkdir -p ~/.vim/backups
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    " Bundle definitions
    Plugin 'tpope/vim-fugitive'
    Plugin 'majutsushi/tagbar'
    Plugin 'tomtom/tcomment_vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'kien/ctrlp.vim'
    Plugin 'chriskempson/vim-tomorrow-theme'
    Plugin 'Raimondi/delimitMate'
    Plugin 'mattn/emmet-vim'
    Plugin 'scrooloose/syntastic'
    Plugin 'fatih/vim-go'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'vim-airline/vim-airline'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'ervandew/supertab'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'dracula/vim'
    Plugin 'Shougo/deoplete.nvim'
		Plugin 'Valloric/MatchTagAlways'
		Plugin 'fatih/molokai'

    Plugin 'mxw/vim-jsx'
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'vim-scripts/JavaScript-Indent'
    Plugin 'w0ng/vim-hybrid'
    Plugin 'othree/javascript-libraries-syntax.vim'


    if vundle_installed==0
        echo vundle_installed
        echo "Vundle Installed, now Installing Bundles..."
        echo ""
        :BundleInstall
        silent !make -C ~/.vim/bundle/vimproc.vim
    endif
    filetype plugin indent on
endfunction
call LoadVundle()
set number
set relativenumber
set cursorline
hi cursorlinenr ctermfg=white cterm=bold
set nuw=5
set ruler
set hidden
syntax on
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set linespace=2
set scrolloff=5
set clipboard=unnamed
set expandtab
set list listchars=tab:\ \ ,trail:·
"set list listchars=tab:»-,trail:·,extends:»,precedes:«
set syntax=whitespace
set autoindent
set smartindent
set virtualedit=block
set splitbelow
" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Show (partial) command in the status line
"set showcmd
" Use modeline overrides
set modeline
set modelines=10
" Insert only one space when joining lines with terminating punctuation
set nojoinspaces
" Automatically reload files changed outside of vim
set autoread
" Display incomplete commands
set showcmd
" Keep more context when scrolling off the end of a buffer
set scrolloff=3
" Scroll optimizations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()
set background=dark
set backupdir=~/.vim/backups
set directory=~/.vim/backups

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.svn,vendor/gems/*
" load the plugin and indent settings for the detected filetype
filetype plugin indent on
" Status bar
set laststatus=2

" Ctrlp cleanup
let g:ctrlp_custom_ignore= '\v[\/](\.git|\node_modules|\.hg|\.svn|\.settings|\.sass-cache|cache|\.rsync_cache|vendor/([^\/]+\/)*vendor)$'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules/*,*.DS_Store
map <Leader>tf :call ToggleFolding()<CR>
"""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\~$', '\.DS_Store']
autocmd BufRead,BufNewFile $HOME let NERDTreeShowHidden=0

imap jj <Esc>
imap <c-h>:hide <CR>
map <c-b> <Esc>:w <CR>:!clear <CR> :GoRun <CR>
map <c-n> :NERDTreeToggle<CR>
map <c-f> :CtrlP<CR>
map <c-f> :CtrlP<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
noremap <C-h> <C-W>h
map <C-l> <C-W>l
map <c-m> :TagbarToggle<CR>
""" TAB""""
nnoremap <Tab> :bnext<CR>
imap <c-s> <Esc>:wa<CR>
map <c-s> :wa <CR>

let g:user_emmet_install_global = 1
let g:user_emmet_leader_key=','
let mapleader = ";"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
set nobackup
set nowritebackup
set noswapfile
let g:go_def_mode = 'godef'
"let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:syntastic_go_checkers = ['go', 'errcheck']
let g:jsx_ext_required = 0
"""""""""""""""""""""""""""""""""
"""" CTAGS """"""""""""""
set tags=tags,.tags

function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
autocmd BufWritePost *.cpp,*.h,*.c,*.go,*.php call UpdateTags()
let g:airline_powerline_fonts=1

set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline\ Nerd\ Font\ Complete:h13
"color molokai
"let g:rehash256 = 1
syntax enable
set background=dark
colorscheme hybrid
let g:airline_theme='dracula'
set completeopt-=preview
set wildmenu
set wildmode=longest:full,list:full

command WQ wq
command Wq wq
command W w
command Q q

" neovim ctrl+h
if has('nvim')
  nmap <BS> <C-W>h
endif
"neocomplete
set runtimepath+=~/.config/nvim/bundle/deoplete.nvim
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'
let g:deoplete#omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:deoplete#omni_patterns.go = '[^.[:digit:] *\t]\.\w*'
set rtp+=$GOPATH/src/github.com/nsf/gocode/vim
set runtimepath^=~/.vim/bundle/ag

"javascript
let g:used_javascript_libs = 'jquery,react, flux'
