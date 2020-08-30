:source ~/.config/nvim/autoload/plug.vim

" Defaults
set shell=$SHELL
scriptencoding utf-8

" Plugins
call plug#begin()
  " The theme
  Plug 'dracula/vim'
  Plug 'rakr/vim-one'
  Plug 'vim-airline/vim-airline'

  " Bazel
  Plug 'google/vim-maktaba'
  Plug 'bazelbuild/vim-bazel'
  Plug 'bazelbuild/vim-ft-bzl'
  
  " Code Navigation
  Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
  Plug 'mileszs/ack.vim'
  Plug 'keith/swift.vim'
  Plug 'vim-syntastic/syntastic'

  Plug 'jremmen/vim-ripgrep'

  Plug 'vbundles/nerdtree'
  Plug 'scrooloose/nerdtree'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'godlygeek/tabular'

  Plug 'terryma/vim-multiple-cursors'

  Plug 'plasticboy/vim-markdown'
  Plug 'udalov/kotlin-vim'
  Plug 'tpope/vim-jdaddy',     { 'for': 'json' }
  Plug 'klen/python-mode'
  Plug 'rust-lang/rust.vim'
  Plug 'saltstack/salt-vim'

  Plug 'christoomey/vim-tmux-navigator'

  " Play nice with tmux
  Plug 'sjl/vitality.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-git'
call plug#end()

" Leader
let mapleader = ","

" Theme
syntax on
color dracula

" Random Configurations
set showcmd
set number
set autoread
set autowrite
set expandtab
set smartindent
set ts=2 sts=2 sw=2
set whichwrap+=<,>,h,l,[,]
set noerrorbells
set mouse=a
set spell spelllang=en_us

" Mappings
map <C-o> :NERDTreeToggle<CR>

" CtrlP
nmap <C-p> :SK<cr>

set inccommand=nosplit

" Clipboard setup
if has('clipboard')     " If the feature is available
  set clipboard=unnamed " copy to the system clipboard

  if has('unnamedplus')
    set clipboard+=unnamedplus
  endif
endif
