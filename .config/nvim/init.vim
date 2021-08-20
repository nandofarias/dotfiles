" Init vim-plug
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Utilities
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimsence/vimsence'

" Filetree
Plug 'preservim/nerdtree'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Language support
Plug 'sheerun/vim-polyglot'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" nvim-telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" lsp
set hidden
let g:LanguageClient_serverCommands = {
    \ 'elixir': ['language_server.sh'],
    \ }
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
autocmd BufWritePre *.ex call FormatOnSave()
autocmd BufWritePre *.exs call FormatOnSave()
function FormatOnSave()
    noautocmd call LanguageClient#textDocument_formatting()
    noautocmd w 
endfunction

" deoplate
let g:deoplete#enable_at_startup = 1

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-y> :NERDTreeFind<CR>
let g:NERDTreeWinPos = "right"

" copy to clipboard
set clipboard=unnamed

" airline
let g:airline_theme='deus'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" vim-fugitive
nnoremap <C-g><C-g> :Git<CR>

" Terminal mode remap
tnoremap <Esc> <C-\><C-n>:q!<CR>

" Appearence
set number cursorline
set showcmd cmdheight=1
set termguicolors background=dark t_Co=256

" Search
nmap <space> :nohlsearch <bar> :pc<CR>

" Dracula PRO
packadd! dracula_pro
syntax enable
let g:dracula_colorterm = 0
colorscheme dracula_pro_van_helsing

