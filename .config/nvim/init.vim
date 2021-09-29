" Init vim-plug
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Utilities
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dylanaraps/root.vim'
Plug 'andymass/vim-matchup'
Plug 'szw/vim-maximizer'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'karb94/neoscroll.nvim'
Plug 'famiu/bufdelete.nvim'

" Better Git 
Plug 'TimUntersberger/neogit'
Plug 'sindrets/diffview.nvim'
Plug 'lewis6991/gitsigns.nvim'

" Statusline
Plug 'vim-airline/vim-airline'

" File explorer
Plug 'glepnir/dashboard-nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'

" Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Language support - treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'p00f/nvim-ts-rainbow'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" Zen mode
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'

" Language server protocol
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Language utilities
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-projectionist'

" Frontend
Plug 'mattn/emmet-vim'

" Test
Plug 'vim-test/vim-test'
Plug 'preservim/vimux'

" Rest
Plug 'NTBBloodbath/rest.nvim'

" Database
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

call plug#end()

" Default autogroup
augroup default
au!
augroup END

" Appearence
set number
set showcmd cmdheight=1
set termguicolors background=dark t_Co=256
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set clipboard=unnamed
set splitright
set mouse=a
set wrap
set signcolumn=yes
set completeopt=menu,menuone,noselect
set hidden
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾ " hide ~ at the end of vuffer
set undofile
set undodir=~/.vimundo/

" Dracula PRO
packadd! dracula_pro
let g:dracula_colorterm = 0
colorscheme dracula_pro_van_helsing
" Fix colors mapping with nvim-treesitter, https://github.com/dracula/vim/blob/master/after/plugin/dracula.vim#L70
hi! link TSSymbol DraculaPurple
hi! link TSVariable DraculaOrange
hi! link TSParameter DraculaOrangeItalic
hi! link TSTagAttribute DraculaGreenItalic

" Operators
onoremap ic i{
onoremap ib i[
onoremap ip i(

" Remapings
nmap <silent><space> :nohlsearch <CR>
nnoremap <silent><leader>q :Bdelete <CR>
nnoremap <silent><leader>c :enew <CR>
inoremap <C-c> <esc>
nnoremap <silent><Leader>r :source ~/.config/nvim/init.vim <CR>

" Open config
nnoremap <Leader>nv :e ~/.config/nvim/init.vim <CR>
nnoremap <Leader>tm :e ~/.config/tmux/tmux.conf <CR>
nnoremap <Leader>fs :e ~/.config/fish/config.fish <CR>
nnoremap <Leader>al :e ~/.config/alacritty/alacritty.yml <CR>

" PLUGINS
" nvim-autopairs
lua require('nvim-autopairs').setup{}

" neoscroll.nvim
lua require('neoscroll').setup()

" vim-airline
let g:airline_theme = 'dracula_pro'

" nvim-colorizer
lua require'colorizer'.setup()

" nvim-treesitter
lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    use_languagetree = true
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
parser_configs.http = {
  install_info = {
    url = "https://github.com/NTBBloodbath/tree-sitter-http",
    files = { "src/parser.c" },
    branch = "main",
  },
}
EOF

" nvim-telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" lsp
lua << EOF
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()) -- For nvim-cmp

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  -- needs review
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {
      capabilities = capabilities,
      on_attach = on_attach
    }

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)
EOF
let g:lsp_installer_allow_federated_servers = v:true

" nvim-cmp + vsnip
let g:vsnip_snippet_dir = '~/.config/nvim/snippets'
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
lua <<EOF
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) 
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'buffer' },
  }
})
EOF

" Neoformat
" https://github.com/sbdchd/neoformat/issues/134
au default BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
let g:neoformat_enabled_typescript = ['prettier', 'prettier-eslint', 'tslint']
let g:neoformat_enabled_javascript = ['prettier', 'prettier-eslint']

" nvim-tree
lua << EOF
require'nvim-tree'.setup {
  auto_close = true,
  lsp_diagnostics = true,
  view = {
    width = 50,
    side = 'right'
  }
}
EOF
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" https://github.com/kyazdani42/nvim-tree.lua/issues/549
set shell=/bin/zsh

" bufferline
lua << EOF
require("bufferline").setup{
  options = {
    diagnostics = "nvim_lsp",
    custom_areas = {
      right = function()
        local result = {}
        local error = vim.lsp.diagnostic.get_count(0, [[Error]])
        local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
        local info = vim.lsp.diagnostic.get_count(0, [[Information]])
        local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

        if error ~= 0 then
          table.insert(result, {text = "  " .. error, guifg = "#FF9580"})
        end

        if warning ~= 0 then
          table.insert(result, {text = "  " .. warning, guifg = "#FFCA80"})
        end

        if hint ~= 0 then
          table.insert(result, {text = "  " .. hint, guifg = "#8AFF80"})
        end

        if info ~= 0 then
          table.insert(result, {text = "  " .. info, guifg = "#80FFEA"})
        end
        return result
      end,
     }
  }
}
EOF
nnoremap <silent>]b :BufferLineCycleNext<CR>
nnoremap <silent>[b :BufferLineCyclePrev<CR>
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

" root.nvim
let g:root#patterns = ['.git', 'mix.exs', '_build', 'deps', 'node_modules', 'README.md']

" neogit
lua << EOF
require("neogit").setup{
  integrations = {
    diffview = true
  }
}
EOF
nnoremap <C-g> :Neogit<CR>

" dashboard-nvim
let g:dashboard_disable_statusline = 1
let g:dashboard_default_executive = 'telescope'
let g:dashboard_custom_shortcut={
\ 'last_session'       : '\ s l',
\ 'find_history'       : '\ f h',
\ 'find_file'          : '\ f f',
\ 'new_file'           : '\ c n',
\ 'change_colorscheme' : '\ t c',
\ 'find_word'          : '\ f a',
\ 'book_marks'         : '\ f b',
\ }
let g:dashboard_custom_header = [
\ '                        ______________                 ',
\ '                       /             /|                ',
\ '                      /             / |                ',
\ '                     /____________ /  |                ',
\ '                    | ___________ |   |                ',
\ '                    ||█          ||   |                ',
\ '                    ||           ||   |                ',
\ '                    ||           ||   |                ',
\ '                    ||___________||   |                ',
\ '                    |   _______   |  /                 ',
\ '                   /|  (_______)  | /                  ',
\ '                  ( |_____________|/                   ',
\ '                   \                                   ',
\ '               .=======================.               ',
\ '               | ::::::::::::::::  ::: |               ',
\ '               | ::::::::::::::[]  ::: |               ',
\ '               |   -----------     ::: |               ',
\ '               `-----------------------`               ',
\ '                                                       ',
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

" vim-test
nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
nmap <silent> tl :TestLast<CR>
nmap <silent> tg :TestVisit<CR>
let test#strategy = 'vimux'
let g:test#preserve_screen = 0

" gitsigns.nvim
lua << EOF
require('gitsigns').setup {
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 500,
  },
}
EOF

" vim-matchup
lua << EOF
require'nvim-treesitter.configs'.setup {
  matchup = {
    enable = true
  }
}
EOF

" nvim-ts-rainbow
lua << EOF
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil,
    colors = { "#FFCA80", "#FF80BF", "#80FFEA" },
  }
}
EOF

" zen-mode.nvim + twilight.nvim
lua require("twilight").setup {}
lua require("zen-mode").setup {}
nnoremap <Leader>z :ZenMode<CR>

" nvim-ts-context-commentstring
lua << EOF
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}
EOF

" vim-maximizer
nnoremap <Leader>m :MaximizerToggle<CR>

" indent-blankline.nvim
highlight IndentBlanklineChar guifg=#202020 gui=nocombine
highlight IndentBlanklineContextChar guifg=#454545 gui=nocombine

lua << EOF
require("indent_blankline").setup {
  enabled = true,
  use_treesitter = true,
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
  show_current_context = true,
  filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "NvimTree",
  },
  buftype_exclude = { "terminal" },
}
EOF

" rest.nvim
lua require("rest-nvim").setup()

" vim-dadbod + completion + ui
autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
let g:db_ui_winwidth = 60
let g:db_ui_win_position = 'right'
let g:db_ui_force_echo_notifications = 1
