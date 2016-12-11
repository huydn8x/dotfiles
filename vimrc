"set nocompatible
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
    Plugin 'majutsushi/tagbar'
    Plugin 'tomtom/tcomment_vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'Raimondi/delimitMate'
    Plugin 'mattn/emmet-vim'
    Plugin 'scrooloose/syntastic'
    Plugin 'fatih/vim-go'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'vim-airline/vim-airline'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'mxw/vim-jsx'
    Plugin 'elzr/vim-json'
    Plugin 'brantb/vim-colors-solarized'
    "Plugin 'maralla/completor.vim'
    Plugin 'zhaocai/GoldenView.Vim'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'ervandew/supertab'
    Plugin 'SirVer/ultisnips'
    Plugin 'phuc-ngo/vim-snippets'

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
" set relativenumber
set cursorline
""""""""" set cursorcolumn
hi cursorlinenr ctermfg=white cterm=bold
set nuw=4
set ruler
set hidden
syntax on
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set linespace=2
set scrolloff=5
set clipboard=unnamed
set expandtab
"set list listchars=tab:\ \ ,trail:·
"set list listchars=tab:»-,trail:·,extends:»,precedes:«
set syntax=whitespace
set autoindent
set smartindent
set virtualedit=block
set splitbelow
set backspace=indent,eol,start
" Searching
set hlsearch
set incsearch
"set ignorecase
"set smartcase
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
set wildignore+=*.o,*.obj,.git,*.rbc,.svn
set laststatus=2

" Ctrlp cleanup
let g:ctrlp_custom_ignore= '\v[\/](\.git|\node_modules|\.hg|\.svn|\.settings|\.sass-cache|cache|\.rsync_cache/([^\/]+\/))$'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/node_modules/*,*.DS_Store
map <Leader>tf :call ToggleFolding()<CR>
"""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\~$', '\.DS_Store']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd BufRead,BufNewFile $HOME let NERDTreeShowHidden=0

imap jj <Esc>
imap <c-h>:hide <CR>
map <c-b> <Esc>:w <CR>:!clear <CR> :GoRun <CR>
map <c-n> :NERDTreeToggle<CR>
map <c-f> :CtrlP<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
noremap <C-h> <C-W>h
map <C-l> <C-W>l
map <c-m> :TagbarToggle<CR>
""" TAB""""
nnoremap <Tab> :bnext<CR>
imap <c-s> <Esc>:w<CR>
map <c-s> <Esc>:w<CR>

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
"let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:syntastic_go_checkers = ['errcheck']
let g:go_list_type = "quickfix"
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
" autocmd BufWritePost *.cpp,*.h,*.c,*.go,*.php,*.js,*.jsx call UpdateTags()

set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Complete:h16
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:airline_powerline_fonts=1
let g:enable_bold_font = 1

set completeopt-=preview

command WQ wq
command Wq wq
command W w
command Q q

set rtp+=$GOPATH/src/github.com/nsf/gocode/vim
"autocmd BufWritePre * %s/\s\+$//e

"ctrp
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif
set path+=**
let g:vim_json_syntax_conceal = 0
set completeopt=longest,menuone
set runtimepath^=~/.vim/bundle/ag
set runtimepath+=~/.vim/bundle/deoplete.nvim/
let g:goldenview__enable_default_mapping = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:deoplete#omni_patterns.go = '[^. \t0-9]\.\w*'
set mouse=
let g:UltiSnipsExpandTrigger="<tab>"
filetype plugin indent on
set viminfo="NONE"
"neovim
if has('nvim')
    nmap <BS> <C-W>h
endif
" format json
autocmd BufRead,BufNewFile *.json :%!python -m json.tool
