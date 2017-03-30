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
    Plugin 'elzr/vim-json'
    Plugin 'zhaocai/GoldenView.Vim'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'pangloss/vim-javascript'
    Plugin 'chemzqm/vim-jsx-improve'
    Plugin 'epilande/vim-react-snippets'
    Plugin 'rking/ag.vim'
    Plugin 'romainl/Apprentice'
    Plugin 'tpope/vim-rails'
    Plugin 'tpope/vim-surround'
    Plugin 'klen/python-mode'
    Plugin 'Shougo/neocomplete.vim'
    Plugin 'mhinz/vim-startify'

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
filetype plugin on
set number
set relativenumber
set cursorline
""""""""" set cursorcolumn
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
set list listchars=tab:\ \ ,trail:·
" set list listchars=tab:»-,trail:·,extends:»,precedes:«
set syntax=whitespace
set autoindent
set smartindent
set virtualedit=block
set backspace=indent,eol,start
" Searching
set hlsearch
set incsearch
set ignorecase
set modeline
set modelines=10
set nojoinspaces
set autoread
set showcmd
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
set backupdir=~/.vim/backups
" Tab completion
set wildignore+=*.o,*.obj,.git,*.rbc,.svn
set laststatus=2

" Ctrlp cleanup
let g:ctrlp_custom_ignore= '\v[\/](\.git|\node_modules|\.hg|\.svn|\.settings|\.sass-cache|cache|\.rsync_cache/([^\/]+\/))$'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/node_modules/*,*.DS_Store
"""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\~$', '\.DS_Store']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd BufRead,BufNewFile $HOME let NERDTreeShowHidden=0

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
autocmd BufWritePost *.go GoInstall

let g:user_emmet_install_global = 1
let g:user_emmet_leader_key=','
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" autocmd FileType qf wincmd J
"let g:go_list_type = "quickfix"
set rtp+=$GOPATH/src/github.com/nsf/gocode/vim
"let g:go_gocode_autobuild = 1
"let g:go_gocode_propose_builtins = 1
set nobackup
set nowritebackup
set noswapfile
let g:syntastic_go_checkers = ['errcheck']
let g:jsx_ext_required = 0
"""""""""""""""""""""""""""""""""
"""" CTAGS """"""""""""""
set tags=tags,.tags
set guifont=Inconsolata\ for\ Powerline\ Nerd\ Font\ Complete:h16
syntax enable
set mouse=
filetype plugin indent on
" set viminfo="NONE"

command WQ wq
command Wq wq
command W w
command Q q


"""
set runtimepath^=~/.vim/bundle/ag

"ctrp
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:vim_json_syntax_conceal = 0
let g:goldenview__enable_default_mapping = 0
let g:enable_bold_font = 1
set background=dark
colorscheme apprentice
hi cursorlinenr ctermfg=white cterm=bold
hi Normal ctermbg=none
let g:airline_powerline_fonts=1
let g:UltiSnipsExpandTrigger="<tab>"
" format json on open json file
autocmd BufRead,BufNewFile *.json :%!python -m json.tool
let g:pymode_python = 'python3'
function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction

if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
let g:ctrlp_match_window = 'top,order:btt,min:1,max:30,results:30'
"let g:airline#extensions#tabline#enabled = 1
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
" emmet jsx
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
