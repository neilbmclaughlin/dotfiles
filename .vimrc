
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Rename'
Plugin 'w0rp/ale'
Plugin 'pangloss/vim-javascript'
Plugin 'christoomey/vim-titlecase'
Plugin 'christoomey/vim-sort-motion'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'ReplaceWithRegister'
Plugin 'vim-indent-object'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'moll/vim-node'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'ternjs/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'PProvost/vim-ps1.git'
Plugin 'OrangeT/vim-csharp'
Plugin 'OmniSharp/omnisharp-vim'

" Keep Plugin commands between vundle#begin/end.

call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
set path+=**
set wildmenu
set nocompatible

set autoread
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set t_Co=256
syntax on
set background=dark
colorscheme distinguished
set relativenumber
set number
set foldmethod=syntax

set tags=./.tags,.tags

" Use global, static locations for back,swap and undo
silent execute '!mkdir -p ~/.vim/tmp/backup'
set backupdir=~/.vim/tmp/backup//
silent execute '!mkdir -p ~/.vim/tmp/swap'
set directory=~/.vim/tmp/swap//
silent execute '!mkdir -p ~/.vim/tmp/undo'
set undodir=~/.vim/tmp/undo//

let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:OmniSharp_server_stdio = 1

runtime macros/matchit.vim
