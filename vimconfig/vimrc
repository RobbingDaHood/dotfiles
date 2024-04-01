set nocompatible
set hidden
set confirm
set nocp
filetype plugin on
set relativenumber number
set undodir=~/.vim/undo_dir
set undofile
set clipboard=unnamedplus,unnamed
set hlsearch
set incsearch
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set spell spelllang=en_us
set termguicolors
set backspace=indent,eol,start  " more powerful backspacing; And necessary on some machine for it even to work.
colorscheme slate

call plug#begin() 

Plug 'https://github.com/md-img-paste-devs/md-img-paste.vim'  "Copy image from clipboard (in case of .md file), save it to disk and link it
Plug 'https://github.com/tpope/vim-eunuch' "Got it primarily for its Move
Plug 'https://github.com/powerman/vim-plugin-AnsiEsc' "Excape ANSI colors in files: use :AnsiEsc command
call plug#end()

" md-img-paste.vim setup to overwrite p
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
