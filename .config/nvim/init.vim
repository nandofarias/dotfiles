" Init vim-plug
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Utilities
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'andymass/vim-matchup'
Plug 'szw/vim-maximizer'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'karb94/neoscroll.nvim'
Plug 'famiu/bufdelete.nvim'
Plug 'tversteeg/registers.nvim'
Plug 'andweeb/presence.nvim'
Plug 'RRethy/vim-illuminate'
Plug 'bkad/CamelCaseMotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'chentau/marks.nvim'
Plug 'dstein64/vim-startuptime'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'lewis6991/spaceless.nvim'
Plug 'stsewd/gx-extended.vim'
Plug 'lewis6991/impatient.nvim'

" Vim test
Plug 'junegunn/vader.vim'

" Better Git 
Plug 'TimUntersberger/neogit'
Plug 'sindrets/diffview.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ruifm/gitlinker.nvim'
Plug 'pwntester/octo.nvim'

" Statusline
Plug 'nvim-lualine/lualine.nvim'

" File explorer
Plug 'glepnir/dashboard-nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'noib3/nvim-cokeline'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'mrjones2014/dash.nvim', { 'do': 'make install' }

" Language support - treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'p00f/nvim-ts-rainbow'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'RRethy/nvim-treesitter-textsubjects'

" Earthly, will be removed when tree-sitter is available
Plug 'earthly/earthly.vim', { 'branch': 'main' }

" Zen mode
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'

" Language server protocol
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'ray-x/lsp_signature.nvim'

" Autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'andersevenrud/cmp-tmux'

" Language utilities
Plug 'tpope/vim-projectionist'
Plug 'github/copilot.vim'

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

" Better quickfix
Plug 'folke/trouble.nvim'
Plug 'kevinhwang91/nvim-bqf'

" UI
Plug 'MunifTanjim/nui.nvim'
Plug 'CosmicNvim/cosmic-ui'

call plug#end()

" Default autogroup
augroup default
au!
augroup END

" Appearence
set number relativenumber
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
set spelllang=en
" GUI settings
set guifont=FiraCode\ Nerd\ Font:h14

" Dracula PRO
packadd! dracula_pro
let g:dracula_colorterm = 0
colorscheme dracula_pro_van_helsing
" Fix colors mapping with nvim-treesitter, https://github.com/dracula/vim/blob/master/after/plugin/dracula.vim
hi! link TSSymbol DraculaPurple
hi! link Constant DraculaPurple
hi! link TSVariable DraculaOrange
hi! link TSParameter DraculaOrangeItalic
hi! link TSTagAttribute DraculaGreenItalic

" Operators
onoremap ic i{
onoremap ib i[
onoremap ip i(

" Remapings
nmap <silent> <space> :nohlsearch <CR>
nnoremap <silent> <leader>r :source ~/.config/nvim/init.vim <CR>
nnoremap <silent> gs :set spell! <CR>
nnoremap <silent> <leader>qq :exit <CR>
nnoremap <silent> <leader>cc :cclose <CR>
nnoremap <silent> qq :Bdelete<CR>

" Open config
nnoremap <Leader>nv :e ~/.config/nvim/init.vim <CR>
nnoremap <Leader>tm :e ~/.config/tmux/tmux.conf <CR>
nnoremap <Leader>fs :e ~/.config/fish/config.fish <CR>
nnoremap <Leader>al :e ~/.config/alacritty/alacritty.yml <CR>
nnoremap <Leader>kt :e ~/.config/kitty/kitty.conf <CR>
nnoremap <Leader>wz :e ~/.config/wezterm/wezterm.lua <CR>
nnoremap <Leader>br :e ~/.config/brew/Brewfile <CR>

" Commands
:command! Q q
:command! W w
:command! WQ wq
:command! Wq wq

" Functions
function! NumberToggle()
  if(&rnu == 1)
    set nornu
  else
    set rnu
  endif
endfunc
nnoremap <Leader>l :call NumberToggle()<cr>

" PLUGINS
" nvim-autopairs
lua require('nvim-autopairs').setup{}

" neoscroll.nvim
lua require('neoscroll').setup()

" lualine.nvim
hi StatusLine gui=none guibg=none guifg=none
lua << EOF
local dracula_pro = require'statusline.themes.dracula_pro'
require('lualine').setup {
  options = {
    theme = dracula_pro,
    disabled_filetypes = { "dashboard" },
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
}
EOF

" nvim-colorizer
lua require'colorizer'.setup()

" nvim-treesitter
lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  indent = {
    enable = true
  },
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
        ["am"] = "@class.outer",
        ["im"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
  textsubjects = {
    enable = true,
    keymaps = {
      ['.'] = 'textsubjects-smart',
    }
  },
  autotag = {
    enable = true,
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
lua << EOF
require('telescope').setup {
  defaults = {
    layout_config = {
      center = { width = 0.8 },
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
      prompt_prefix = " ",
      previewer = false,
    },
    live_grep = {
      prompt_prefix = " ",
    },
  },
}
require('telescope').load_extension('fzf')
EOF
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>

" lsp-config
lua << EOF
local lspconfig = require("lspconfig")
-- For null-ls
local null_ls = require("null-ls")
local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()) -- For nvim-cmp
local on_attach = function(client, bufnr)
  -- vim-illuminate
  require 'illuminate'.on_attach(client)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  local cmd = vim.api.nvim_command

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  -- needs review
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 2000)]]
  end

  if client.resolved_capabilities.code_action then
    -- buf_set_keymap('n', '<space>cc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<space>ga', '<cmd>lua require("cosmic-ui").code_actions()<cr>', opts)
    buf_set_keymap('v', '<space>ga', '<cmd>lua require("cosmic-ui").range_code_actions()<cr>', opts)
  end

  if client.resolved_capabilities.code_lens then
    buf_set_keymap('n', '<space>cr', '<cmd>lua vim.lsp.codelens.run()<CR>', opts)
    buf_set_keymap('n', '<space>cl', '<cmd>lua vim.lsp.codelens.refresh()<CR>', opts)
    cmd [[augroup LspCodelensAutoGroup]]
    cmd [[au!]]
    cmd [[au BufEnter <buffer> lua vim.lsp.codelens.refresh()]]
    cmd [[au CursorHold <buffer> lua vim.lsp.codelens.refresh()]]
    cmd [[au InsertLeave <buffer> lua vim.lsp.codelens.refresh()]]
    cmd [[augroup end]]
  end
end

-- nvim-lsp-installer
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {
      capabilities = capabilities,
      on_attach = on_attach
    }

    if server.name == "elixirls" then
      opts.settings = {
        elixirLS = {
          fetchDeps = true,
          dialyzerFormat = "dialyxir_short",
        }
      }
    end

    if server.name == "sumneko_lua" then
      opts.settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'hs' }
          },
          workspace = {
            library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                ['/Users/nandofarias/.hammerspoon/Spoons/EmmyLua.spoon/annotations'] = true,
            },
          },
        },
      }
    end

    if server.name == "tsserver" then
      opts.on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
      end
    end

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

-- null-ls
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.diagnostics.credo.with({
          condition = function(utils)
            return utils.root_has_file(".credo.exs") 
          end
        }),
        null_ls.builtins.formatting.erlfmt,
        null_ls.builtins.formatting.fish_indent
    },
    on_attach = on_attach,
})
EOF
" format on save
autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000) 

" nvim-cmp + vsnip
let g:vsnip_snippet_dir = '~/.config/nvim/snippets'
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
lua <<EOF
local cmp = require'cmp';
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) 
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-y>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'tmux' },
    { name = 'buffer', 
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end 
      }
    },
  }
}
EOF
hi! link CmpItemAbbr DraculaPurple
hi! link CmpItemKind DraculaYellow

" nvim-tree
lua << EOF
require'nvim-tree'.setup {
  git = {
    ignore = false,
  },
  auto_close = true,
  diagnostic = {
    enable = true,
  },
  view = {
    width = 60,
    side = 'left'
  },
  actions = {
    change_dir = {
      enable = false,
      global = false,
    },
    open_file = {
      quit_on_open = true,
    }
  }
}
EOF
let g:nvim_tree_respect_buf_cwd = 1
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" https://github.com/kyazdani42/nvim-tree.lua/issues/549
set shell=/bin/zsh

" cokeline
hi TabLineFill gui=none guifg=none guibg=none
lua << EOF
local get_hex = require('cokeline/utils').get_hex
local blue = vim.g.terminal_color_4

local errors_fg = get_hex('DiagnosticError', 'fg')
local warnings_fg = get_hex('DiagnosticWarn', 'fg')

require('cokeline').setup({
  buffers = {
    new_buffers_position = 'next',
  },
  default_hl = {
    fg = function(buffer)
      return
        buffer.is_focused
        and get_hex('Normal', 'fg')
         or get_hex('Comment', 'fg')
    end,
    bg = get_hex('ColorColumn', 'bg'),
  },
  sidebar = {
    filetype = 'NvimTree',
    components = {
      {
        text = '  NvimTree',
        hl = {
          fg = blue,
          bg = get_hex('NvimTreeNormal', 'bg'),
          style = 'bold'
        }
      },
    }
  },
  components = {
    {
      text = ' ',
      bg = get_hex('Normal', 'bg'),
    },
    {
      text = '',
      fg = get_hex('ColorColumn', 'bg'),
      bg = get_hex('Normal', 'bg'),
    },
    {
      text = function(buffer)
        return buffer.devicon.icon
      end,
      fg = function(buffer)
        return buffer.devicon.color
      end,
    },
    {
      text = ' ',
    },
    {
      text = function(buffer) return buffer.filename end,
      style = function(buffer)
        return buffer.is_focused and 'bold' or nil
      end,
    },
    {
      text = function(buffer)
        return
          (buffer.diagnostics.errors ~= 0 and '  ' .. buffer.diagnostics.errors)
          or (buffer.diagnostics.warnings ~= 0 and '  ' .. buffer.diagnostics.warnings)
          or ''
      end,
      fg = function(buffer)
        return
          (buffer.diagnostics.errors ~= 0 and errors_fg)
          or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
          or nil
      end,
      truncation = { priority = 1 },
    },
    {
      text = ' ',
    },
    {
      text = '',
      delete_buffer_on_left_click = true,
    },
    {
      text = '',
      fg = get_hex('ColorColumn', 'bg'),
      bg = get_hex('Normal', 'bg'),
    },
  },
})
EOF
nnoremap <silent><Tab> <Plug>(cokeline-focus-next)<CR>
nnoremap <silent><S-Tab> <Plug>(cokeline-focus-prev)<CR>
nnoremap <silent><leader>1 <Plug>(cokeline-focus-1)<CR>
nnoremap <silent><leader>2 <Plug>(cokeline-focus-2)<CR>
nnoremap <silent><leader>3 <Plug>(cokeline-focus-3)<CR>
nnoremap <silent><leader>4 <Plug>(cokeline-focus-4)<CR>
nnoremap <silent><leader>5 <Plug>(cokeline-focus-5)<CR>
nnoremap <silent><leader>6 <Plug>(cokeline-focus-6)<CR>
nnoremap <silent><leader>7 <Plug>(cokeline-focus-7)<CR>
nnoremap <silent><leader>8 <Plug>(cokeline-focus-8)<CR>
nnoremap <silent><leader>9 <Plug>(cokeline-focus-9)<CR>

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
let g:dashboard_default_executive = 'telescope'
let g:dashboard_custom_section ={
\   'a': {'description': ['  Find File                 leader f f'], 'command': 'Telescope find_files'},
\   'b': {'description': ['  Find Word                 leader f g'], 'command': 'Telescope live_grep'},
\   'c': {'description': ['  Recents                   leader f h'], 'command': 'Telescope oldfiles'},
\   'd': {'description': ['  New File                  leader c n'], 'command': 'DashboardNewFile'},
\   'f': {'description': ['  Update Plugins            leader u  '], 'command': 'PlugUpdate'},
\   'g': {'description': ['  Settings                  leader n v'], 'command': 'edit $MYVIMRC'},
\   'h': {'description': ['  Exit                      leader q q'], 'command': 'exit'}
\ }
let g:dashboard_custom_header = [
\ '                        ______________                 ',
\ '                       /             /|                ',
\ '                      /             / |                ',
\ '                     /____________ /  |                ',
\ '                    | ___________ |   |                ',
\ '                    ||$ nvim █   ||   |                ',
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
\]
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>fg :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>
hi! link DashboardShortcut DraculaGreen

" vim-test
nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
nmap <silent> tl :TestLast<CR>
nmap <silent> tg :TestVisit<CR>
let test#strategy = 'vimux'
let g:test#preserve_screen = 0

" gitsigns.nvim
highlight link GitSignsCurrentLineBlame DraculaComment
lua << EOF
require('gitsigns').setup {
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 500,
  },
  current_line_blame_opts = {
    ignore_whitespace = true,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
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
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "NvimTree",
  },
  buftype_exclude = { "terminal" },
}
EOF

" vim-illuminate
let g:Illuminate_ftblacklist = ['help', 'terminal', 'dashboard', 'lspinfo', 'TelescopePrompt', 'TelescopeResults', 'NvimTree']

" rest.nvim
lua require("rest-nvim").setup()

" vim-dadbod + completion + ui
autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
let g:db_ui_winwidth = 60
let g:db_ui_win_position = 'right'
let g:db_ui_force_echo_notifications = 1

" trouble.nvim
lua require("trouble").setup {}
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap <leader>xr <cmd>TroubleToggle lsp_references<cr>

" presence.nvim
lua require("presence"):setup()

" copilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
let g:copilot_filetypes = {
  \ 'xml': v:false,
  \ "help": v:false,
  \ 'terminal': v:false,
  \ 'dashboard': v:false,
  \ 'packer': v:false,
  \ 'lspinfo': v:false,
  \ 'TelescopePrompt': v:false,
  \ 'TelescopeResults': v:false,
  \ 'NvimTree': v:false,
  \ }

" gitlinker
lua require"gitlinker".setup()

" CamelCaseMotion
let g:camelcasemotion_key = '<space>'

" octo.nvim
lua << EOF
require"octo".setup({
  default_remote = {"origin"};
})
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.markdown.filetype_to_parsername = "octo"
EOF
nnoremap <leader>o :Octo pr list<CR>

" dash.nvim
nnoremap <leader>? :Dash!<cr>

" marks.nvim
lua require'marks'.setup {}

" markdown-preview
let g:mkdp_browser = 'safari'

" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css,jsx,heex,html.eex EmmetInstall

" lsp_signature.nvim
lua << EOF
require'lsp_signature'.setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded"
  }
})
EOF

" spaceless.nvim
lua require'spaceless'.setup()

" cosmic-ui
lua require'cosmic-ui'.setup()
nnoremap <silent> gn <cmd>lua require("cosmic-ui").rename()<cr>

" impatient.nvim
lua require('impatient')
