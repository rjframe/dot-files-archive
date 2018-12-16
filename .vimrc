" From romainl - https://gist.github.com/romainl/4df4cde3498fada91032858d7af213c2
if !exists('g:env')
	if has('win64') || has('win32') || has('win16')
		let g:env = 'WINDOWS'
	else
		let g:env = toupper(substitute(system('uname'), '\n', '', ''))
	endif
endif

if g:env =~ 'WINDOWS'
    let &runtimepath="$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after"
endif

" Vundle configuration.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'
Plugin 'previm/previm'
Plugin 'vimwiki/vimwiki'

call vundle#end()

filetype plugin indent on
syntax on

" Convenient leader.
let mapleader=' '

" I default to UNIX line endings, even on Windows. Vim handles them just fine.
set fileformat=unix
set fileformats=unix,dos
set encoding=utf-8
set fileencoding=utf-8
set autoread

set backspace=indent,eol,start
set expandtab
set smarttab
set smartindent
set shiftwidth=4
set tabstop=4
set cpoptions+=n

set noswapfile
set undodir="~/.vim/undo"
set undofile
set undolevels=500
set history=1000

" Treat wrapped lines as unwrapped.
nnoremap j gj
nnoremap k gk

" Search settings
set ignorecase
set smartcase
set incsearch

" Set guide columns.
set cc=81,121

set laststatus=2
set scrolloff=5
set showmatch

set nu
" I want to see 82 characters, regardless of the size of the gutter; this gives 
" me a 3-char margin on the right, which looks nice, and we won't wrap once the
" left gutter expands by one.
" From http://superuser.com/a/330352
au BufRead * let &numberwidth = float2nr(log10(line("$"))) + 4
	\| let &columns = &numberwidth + 83

set nostartofline " Keep the cursor's column position.
