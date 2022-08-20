"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')
	Plug 'prabirshrestha/async.vim'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'mattn/vim-lsp-settings'

	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	"Для использования набрать YcmGenerateConfig/CCGenerateConfig

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

	"dubuging
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

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
