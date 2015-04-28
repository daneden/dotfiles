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

" Commenting
" Use <Leader>cc to comment/uncomment lines
Plugin 'scrooloose/nerdcommenter'

" Surround (insert surrounding quotes etc)
Plugin 'tpope/vim-surround'

" Tab completions
Plugin 'ervandew/supertab'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" HTML5
Plugin 'othree/html5.vim'

" Gists
Plugin 'mattn/gist-vim'

" Web API (required for Gists)
Plugin 'mattn/webapi-vim'

" Dash for documentation
Plugin 'rizzatti/dash.vim'

" Pencil for writing
Plugin 'reedes/vim-pencil'

" Rename files
Plugin 'danro/rename.vim'

" Ack for fast search
Plugin 'mileszs/ack.vim'

" Linting!
Plugin 'scrooloose/syntastic'

" NERDTree
Plugin 'scrooloose/nerdtree.git'

" Transparent pasting (cmd-v works as expectec)
Plugin 'ConradIrwin/vim-bracketed-paste'

" Base16 themes
Plugin 'chriskempson/base16-vim'

" Less syntax highlighting
Plugin 'groenewege/vim-less'

" Git syntax stuff
Plugin 'tpope/vim-git'

" Dim inactive panes
Plugin 'blueyed/vim-diminactive'

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

" Set up SCSS Lint
let g:syntastic_scss_checkers = ['scss_lint']

" Set syntax highlighting
syntax on

" Set linenums
set number

" Highlight cursor column & row
set cursorline
set cursorcolumn

" Color scheme
set t_Co=256
set background=dark
" solarized options
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme base16-google
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

" Allow mouse interaction
set mouse=a

" Set mapping for NERDTree
nnoremap <leader>e :NERDTree<cr>

" Automatically open NERDTree (this might get old fast)
autocmd VimEnter * NERDTree

" Shift the cursor to the file pane instead of defaulting to NERDTree
autocmd VimEnter * wincmd p

" Automatically make splits equal in size
autocmd VimResized * wincmd =

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

" Automatically trim whitespace on save
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" Dim inactive windows
autocmd VimEnter * DimInactive

" Most of the rules from here on out are stolen from thoughtbot/dotfiles
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
