call plug#begin('~/.vim/plugged')

	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'Valloric/YouCompleteMe'
	"Для использования набрать YcmGenerateConfig/CCGenerateConfig
	Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

	"Git integration
	Plug 'tpope/vim-fugitive'
	Plug 'stanangeloff/php.vim'	
	Plug 'othree/html5.vim'
	Plug 'hail2u/vim-css3-syntax'

	"thems
	"Plug 'morhetz/gruvbox'
	Plug 'altercation/vim-colors-solarized'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'itchyny/lightline.vim'
call plug#end()

"let g:airline_theme='gruvbox'
"let g:lightline = { 'colorscheme': 'darcula.vim' }

set number
set tabstop=4
set shiftwidth=4
"set nosmarttab
"set expandtab
noh
set hlsearch
set incsearch
syntax on
set nowrap
"set nosmartindent
set history=200

"colorscheme gruvbox
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

map <C-n> :NERDTreeToggle<CR>
nnoremap <F5> :w <CR> :!make && ./run
nnoremap <F6> :w <CR> :!make debug && ./run
