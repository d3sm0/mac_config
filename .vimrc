" Vim setting d3sm0

" Basic
filetype off                  " required
let mapleader=','
set nocompatible              " be iMproved, required
set encoding=utf8
set number
set ruler
set hidden
set history=500
set showmatch " show matching parenthesis


" Turn off backup
" set nobackup
" set nowb
" set noswapfile

" Move between windows
nnoremap <C-J> <C-W><C-J> "split below
nnoremap <C-K> <C-W><C-K> "split above
nnoremap <C-L> <C-W><C-L> "split right
nnoremap <C-H> <C-W><C-H> "split left
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

" Vim wiki
" Split type
" set splitbelow
" set splitright

" Folding
set foldmethod=indent
set foldlevel=99

" Indent
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
filetype plugin indent on    " required

" Search
set hlsearch

" Vundle setting
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'vim-syntastic/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'lervag/vimtex'
" Plugin 'xolox/vim-notes'
" Plugin 'xolox/vim-misc'
Plugin 'vimwiki/vimwiki'
call vundle#end()            " required

" Theme
syntax on
let python_highlight_all=1
colorscheme solarized

" lightline settings
set laststatus=2
if !has('gui_running')
	set t_Co=256
endif
set noshowmode

" nerdtree
autocmd vimenter * NERDTree
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let g:NERDTreeShowHidden=1
" let g:NERDTreeChDirMode=2
" let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeIgnore=['\.DS_STORE', '\~$','\.swp','\.pyc$','\.git','__pycache__']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
 
" Auto-complete
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:ycm_python_binary_path = '/usr/local/bin/python3'
" Jedi
" let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" syntastisc
let g:syntastisc_python_checkers=['python','flake8']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" Silver searcher
let $FZ_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
set grepprg=ag\ --nogroup\ --nocolor
