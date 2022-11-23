local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Get list of all plugins config
local get_plugins_list = function()
  local vim_path = vim.fn.stdpath('config')
  local modules_dir = vim_path .. '/lua/plugins'
  local list = {}
  local tmp = vim.split(fn.globpath(modules_dir, '*.lua'), '\n')
  for _, f in ipairs(tmp) do
    list[#list + 1] = string.match(f, 'lua/(.+).lua$')
  end
  return list
end

-- Install your plugins here
return require('packer').startup(function(use)
  -- Lua helper
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'svermeulen/vimpeccable'

  -- Utilities
  use 'tpope/vim-surround'
  use 'tpope/vim-abolish'
  use 'andymass/vim-matchup'
  use 'szw/vim-maximizer'
  use 'uga-rosa/ccc.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup({}) end }
  use 'windwp/nvim-ts-autotag'
  use { 'karb94/neoscroll.nvim', config = function() require('neoscroll').setup() end }
  use 'famiu/bufdelete.nvim'
  use { 'tversteeg/registers.nvim', config = function() require('registers').setup() end }
  use 'andweeb/presence.nvim'
  use 'RRethy/vim-illuminate'
  use 'christoomey/vim-tmux-navigator'
  use { 'chentoast/marks.nvim', config = function() require('marks').setup({}) end }
  use 'dstein64/vim-startuptime'
  use { 'mcauley-penney/tidy.nvim', config = function() require('tidy').setup() end }
  use 'stsewd/gx-extended.vim'
  use 'lewis6991/impatient.nvim'
  use 'olimorris/persisted.nvim'
  use 'rhysd/clever-f.vim'
  use { 'folke/todo-comments.nvim', config = function() require('todo-comments').setup({}) end }
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
  use 'kevinhwang91/nvim-hlslens'
  use { 'bennypowers/nvim-regexplainer', requires = { 'MunifTanjim/nui.nvim' } }
  use 'benizi/vim-automkdir'
  use 'gpanders/editorconfig.nvim'
  use 'ellisonleao/glow.nvim'
  use 'mong8se/actually.nvim'
  use 'superhawk610/ascii-blocks.nvim'
  use { 'lukas-reineke/virt-column.nvim', config = function()
    vim.cmd [[ au VimEnter * highlight VirtColumn guifg=#202020 gui=nocombine ]]
    require('virt-column').setup()
  end }

  -- Window hacks
  use { 'luukvbaal/stabilize.nvim', config = function() require('stabilize').setup() end }
  use 'simeji/winresizer'
  use 'xiyaowong/nvim-transparent'

  -- Better Git
  use 'TimUntersberger/neogit'
  use 'sindrets/diffview.nvim'
  use 'lewis6991/gitsigns.nvim'
  use { 'ruifm/gitlinker.nvim', config = function() require('gitlinker').setup() end }
  use 'pwntester/octo.nvim'
  use 'kdheepak/lazygit.nvim'

  -- Statusline
  use 'nvim-lualine/lualine.nvim'
  use 'WhoIsSethDaniel/lualine-lsp-progress'

  -- File explorer
  use 'glepnir/dashboard-nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'noib3/nvim-cokeline'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Language support - treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'RRethy/nvim-treesitter-textsubjects'

  -- Earthly, will be removed when tree-sitter is available
  use { 'earthly/earthly.vim', branch = 'main' }

  -- Zen mode
  use 'folke/zen-mode.nvim'
  use { 'folke/twilight.nvim', config = function() require('twilight').setup({}) end }

  -- Language server protocol
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'ray-x/lsp_signature.nvim'
  use { 'simrat39/symbols-outline.nvim', config = function() require('symbols-outline').setup() end }
  use 'glepnir/lspsaga.nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'folke/lsp-colors.nvim'
  use 'rmagatti/goto-preview'

  -- Autocomplete
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'andersevenrud/cmp-tmux'

  -- Language utilities
  use 'tpope/vim-projectionist'

  -- Frontend
  use 'mattn/emmet-vim'

  -- Test
  use 'vim-test/vim-test'
  use 'preservim/vimux'

  -- Rest
  use { 'NTBBloodbath/rest.nvim', config = function() require('rest-nvim').setup() end }

  -- Database
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'

  -- Better quickfix
  use 'folke/trouble.nvim'
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }

  -- UI
  use 'rcarriga/nvim-notify'
  use 'stevearc/dressing.nvim'

  -- Better wildmenu
  use 'gelguy/wilder.nvim'

  -- Ext utilities integration
  use { 'mrjones2014/dash.nvim', run = 'make install' }
  use 'epwalsh/obsidian.nvim'

  -- Messages
  use 'AckslD/messages.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

  -- require all plugins config
  local plugins_file = get_plugins_list()
  for _, m in ipairs(plugins_file) do
    require(m)
  end
end)
