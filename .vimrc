syntax on
set guifont=SpaceMonoNerdFontCompleteM-Regular:h18

set clipboard=unnamed

set nocompatible
set noerrorbells
set vb t_vb= " sets the errorbell to visual bell and clears visual bell
set autoindent
set nowrap
" set smartcase
set ignorecase
set incsearch
set textwidth=80

" remaps the leader from backslash to space
nnoremap <SPACE> <Nop>
let mapleader=" "

" ------------------------------------------------------------------------------

" always show the status bar
set laststatus=2

" enable 256 colors
" set t_Co=256
" set t_ut=

" turn on line numbering
set nu

" turn on relative line numbering
set relativenumber

" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

" sane editing
set tabstop=4
set softtabstop=4
set shiftwidth=4
" set colorcolumn=80
set noexpandtab
set viminfo='25,\"50,n~/.viminfo

" mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
	if g:is_mouse_enabled == 1
		echo "Mouse OFF"
		set mouse=
		let g:is_mouse_enabled = 0
	else
		echo "Mouse ON"
		set mouse=a
		let g:is_mouse_enabled = 1
	endif
endfunction

" sets the 'tabs' and 'End of Lines' symbols
set listchars=tab:→\ ,eol:↲

" Fuzzy Search (:find ...)
set nocompatible		" limit search to your project
set path+=**			" search all subdirectories and recursively
set wildmenu			" shows multiple matches on one line

"###############################################################################
"#	Python Settings
"###############################################################################

let python_highlight_all=1

filetype plugin indent on
autocmd Filetype python setlocal noexpandtab ts=4 sw=4 sts=4

" au BufNewFile, BufRead *.py
" 	\  set tabstop=4
" 	\  set softtabstop=4
" 	\  set shiftwidth=4
" 	\  set textwidth=79
" 	\  set expandtab
" 	\  set autoindent
" 	\  set fileformat=unix

"###############################################################################
"#	Web Coding Settings
"###############################################################################

au BufNewFile, BufRead *.js,*.html,*.css
	\  set tabstop=2
	\  set softtabstop=2
	\  set shiftwidth=2

"###############################################################################
"#	Netrw File Explorer
"###############################################################################

let g:netrw_keepdir = 1
" let g:netrw_winsize = 50		" set netrw window size to ##%
let g:netrw_banner = 0			" hide the banner (toggle with 'I')
let g:netrw_liststyle = 0		" default view
let g:netrw_liststyle = 1		" show time and size
let g:netrw_liststyle = 2		" show in two columns
let g:netrw_liststyle = 3		" show tree style explorer
let g:netrw_preview = 1			" open splits to the right

nnoremap <leader>d :Lexplore %:p:h<CR>
" nnoremap <Leader>da :Lexplore<CR>

" Keymaps in Netrw 
function! NetrwMapping()
	" Navigation
	nmap <buffer> l <CR>
	nmap <buffer> . gh
	nmap <buffer> P <C-w>z
	nmap <buffer> L <CR>:Lexplore<CR>
	nmap <buffer> <Leader>d :Lexplore<CR>
		" -: 'go up' a directory
		" u: 'go up' (in history)
		" U: 'go down' (in history)
		" l: opens directory or file
		" L: open file AND close Netrw
		" Leader d : close Netrw
		" o: open file horizontally
		" v: open file vertically
		" .: toggle dot files
		" p: preview file
		" P: closes preview window

	" Marks
	nmap <buffer> <TAB> mf
	nmap <buffer> <S-TAB> mF
	nmap <buffer> <Leader><TAB> mu
		" Tab : toggles mark on file or dir
		" S-Tab : unmakrs all files in current buffer
		" Leader Tab : remove all marks on all files

	" File Management
	nmap <buffer> mC mtmc
	nmap <buffer> mX mtmm
	nmap <buffer> f; mx
		" %: Will create a file. 
		" R: Will rename a file.
		" mt: Will set a target
		" mc: Will copy the marked files.
		" mC: Use this to 'skip' a step. After you mark your files you can put the
		" cursor in a dir and this will assign the target dir and copy in one step
		" mm: Will move marked files.
		" mX: Same thing as fC but for moving files.
		" f;: Will be for running external commands on the marked files.

	" Bookmarks
		" mb: To create a bookmark.
		" bB: To remove the most recent bookmark.
		" gb: To jump to the most recent bookmark
		" qb: To list all Bookmarks
endfunction

augroup netrw_mapping
	autocmd!
	autocmd filetype netrw call NetrwMapping()
augroup END

"###############################################################################
"#	Plugins Vundle
"###############################################################################

" set nocompatible              " required
" filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'

" Plugins begin

" Bundle 'Valloric/YouCompleteMe'

" Plugins end

" call vundle#end()            " required
" filetype plugin indent on    " required

"###############################################################################
"#	Plugins Vim Plug
"###############################################################################

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
	https://raw.gitbubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" plugins start
Plug 'tpope/vim-commentary'
" Plug 'lepture/vim-jinja'
" Plug 'nvie/vim-flake8'
" Plug 'kien/ctrlp.vim'
" Plug 'preservim/NERDTree'
" Plug 'tmhedberg/SimpylFold'
" Plug 'vim-scripts/indentpython.vim'
" Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
" Plug 'ap/vim-buftabline'
" Plug 'airblade/vim-gitgutter'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'majutsushi/tagbar'
" Plug 'pangloss/vim-javascript'
" plugins end

" color schemes start
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
" color schemes end

" color schemes for lighline start
Plug 'shinchu/lightline-gruvbox.vim'
" color schemes for lightline end

call plug#end()

" Plugins Vim Plug end

"###############################################################################
"#	Colors
"###############################################################################

" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
"
" if (has("autocmd") && !has("gui_running"))
" 	augroup colorset
" 		autocmd
" 		let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
" 		autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
" 	augroup END
" endif

" let g:gruvbox_contrast_dark = 'hard'
" if exists('+termguicolors')
"     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif
" let g:gruvbox_invert_selection='0'

colorscheme gruvbox 
" colorscheme onedark
set background=dark
" filetype on
" filetype plugin indent on

" ------------------------------------------------------------------------------

" lightline
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
" let g:lightline.colorscheme = 'onedark'

"###############################################################################
"#	Mappings
"###############################################################################

" Add new line without entering insert mode with Enter
" nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" auto close brackets etc...
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

