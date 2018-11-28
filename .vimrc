set nocompatible

" New PC tasks:
" - Install Vundle
" - Set up YouCompleteMe
"   * See https://valloric.github.io/YouCompleteMe/#full-installation-guide

"Vundle commands:
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

" Vundle configuration.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'itchyny/lightline.vim'
Plugin 'bling/vim-bufferline'
Plugin 'somini/vim-autoclose'
Plugin 'tpope/vim-speeddating'
Plugin 'mhinz/vim-signify'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'previm/previm'

"Syntax
"Plugin 'udalov/kotlin-vim'
"Plugin 'dleonard0/pony-vim-syntax'

" Colorschemes I like.
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'

if has("python3")
	Plugin 'simnalamburt/vim-mundo'
endif

" To try:
" Plugin 'w0rp/ale'

call vundle#end()

filetype plugin indent on
syntax on

 au BufNewFile,BufRead *.ss set filetype=xhtml
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

" Search settings
set ignorecase
set smartcase
set incsearch

" Convenient leader.
let mapleader=' '

" Set guide columns.
set cc=81,121

" Fix typos.
command! W :w

map <leader>t :NERDTreeToggle<CR>

" Fold on braces.
map <leader>z za/{/e}<ESC>

" Move backward/forward through the file.
noremap <leader>n <C-I>
noremap <leader>b <C-O>

" Buffer navigation.
noremap <leader>j :bprevious<cr>
noremap <leader>k :bnext<cr>

" Macro control
nnoremap Q @@
set lazyredraw

" Run file w/ DMD (12/15/17)
noremap <leader>r :0,$!dmd -run -<cr>

" Unittest current file in D (4/24/18)
function! DTest()
  let l:fn = substitute(expand('%:r'), '/', '-', 'g') . '.lst'
  call delete(l:fn)
  cexpr system('dmd -cov -unittest -main -run ' . expand('%'))
  if filereadable(l:fn)
     normal gg
     execute '13vsplit' l:fn
     normal gg
     set scrollbind
     normal ^Wl
     set scrollbind
  endif
endfunction
autocmd FileType d nnoremap <leader>t :call DTest()<cr>


set title
set laststatus=2

" I want to see 82 characters for my code, regardless of the size of the
" gutter; this gives me a 3-char margin on the right, which looks nice, and we
" won't wrap once the left gutter expands.
set nu
" From http://superuser.com/a/330352
au BufRead * let &numberwidth = float2nr(log10(line("$"))) + 4
	\| let &columns = &numberwidth + 83

set nostartofline " Keep the cursor's column position.

set autowriteall

set scrolloff=5
set showmatch
set showcmd

" Split-window navigation.
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

set foldmethod=syntax
set foldminlines=5
set foldnestmax=4
set foldlevel=99
nnoremap <space> za

" Treat wrapped lines as unwrapped.
nnoremap j gj
nnoremap k gk

set undodir="~/.vim/undo"
set undofile
set undolevels=500
set history=1000

augroup AutoBlockComment
	" Don't auto-comment newlines for single-line comments.
	autocmd! FileType c,cpp,d setlocal comments -=:// comments +=f://
augroup END

" Don't expandtab for makefiles.
autocmd FileType make setlocal noexpandtab

""" Plugin configuration

" vim-autoclose
let g:AutoCloseExpandSpace=0

" YouCompleteMe
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Molokai
let g:molokai_original=1

" vim-better-whitespace
" Remove extra whitespace on save.
autocmd BufWritePre * StripWhitespace

" vim-signify
let g:signify_vcs_list=['git', 'hg']
if has("gui_running")
	if has("gui_gtk2")
		set guifont=Inconsolata\ 12
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h14
	elseif has("gui_win32")
		" set guifont=Consolas:h11:cANSI
        set guifont=Fira\ Code:h11
        " set guifont=Iosevka:h12
        set renderoptions=type:directx
	endif
else
	set t_Co=256
endif

" previm
" TODO: Cross-platform path.
let g:previm_open_cmd=shellescape('C:\Users\rjfra\AppData\Local\Vivaldi\Application\vivaldi.exe')
