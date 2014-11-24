set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Command-T quick open files
Plugin 'git://git.wincent.com/command-t.git'

" SCSS syntax highlighting
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'

" Git gutter
Plugin 'airblade/vim-gitgutter'

" Color scheme
Plugin 'altercation/vim-colors-solarized'

" Powerline
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
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

" Set syntax highlighting
syntax on

" Set linenums
set number

" Color scheme
set t_Co=256
set background=dark
" solarized options 
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
hi clear SignColumn

let g:airline_powerline_fonts=1

" Change leader key to something more accessible
let mapleader=","

" Remap split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural splitting
set splitbelow
set splitright

" Set tab options
" Expand tabs to spaces
set expandtab
" Set tab size
set tabstop=2
set shiftwidth=2
