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
  use 'norcalli/nvim-colorizer.lua'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'karb94/neoscroll.nvim'
  use 'famiu/bufdelete.nvim'
  use 'tversteeg/registers.nvim'
  use 'andweeb/presence.nvim'
  use 'RRethy/vim-illuminate'
  use 'chaoren/vim-wordmotion'
  use 'christoomey/vim-tmux-navigator'
  use 'chentau/marks.nvim'
  use 'dstein64/vim-startuptime'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }
  use 'lewis6991/spaceless.nvim'
  use 'stsewd/gx-extended.vim'
  use 'lewis6991/impatient.nvim'
  use 'olimorris/persisted.nvim'
  use 'code-biscuits/nvim-biscuits'
  use 'rhysd/clever-f.vim'
  use 'folke/todo-comments.nvim'
  use 'numToStr/Comment.nvim'
  use 'kevinhwang91/nvim-hlslens'
  use 'luukvbaal/stabilize.nvim'
  use { 'bennypowers/nvim-regexplainer', requires = { 'MunifTanjim/nui.nvim' } }
  use 'benizi/vim-automkdir'

  -- Better Git
  use 'TimUntersberger/neogit'
  use 'sindrets/diffview.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'ruifm/gitlinker.nvim'
  use 'pwntester/octo.nvim'
  use 'kdheepak/lazygit.nvim'

  -- Statusline
  use 'nvim-lualine/lualine.nvim'

  -- File explorer
  use 'glepnir/dashboard-nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'noib3/nvim-cokeline'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'mrjones2014/dash.nvim', run = 'make install' }

  -- Language support - treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'RRethy/nvim-treesitter-textsubjects'
  use 'lewis6991/spellsitter.nvim'

  -- Earthly, will be removed when tree-sitter is available
  use { 'earthly/earthly.vim', branch = 'main' }

  -- Zen mode
  use 'folke/zen-mode.nvim'
  use 'folke/twilight.nvim'

  -- Language server protocol
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'ray-x/lsp_signature.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'tami5/lspsaga.nvim'
  use 'kosayoda/nvim-lightbulb'
  use 'folke/lsp-colors.nvim'
  use 'onsails/lspkind-nvim'
  use 'j-hui/fidget.nvim'
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
  use 'github/copilot.vim'

  -- Frontend
  use 'mattn/emmet-vim'

  -- Test
  use 'vim-test/vim-test'
  use 'preservim/vimux'

  -- Rest
  use 'NTBBloodbath/rest.nvim'

  -- Database
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'

  -- Better quickfix
  use 'folke/trouble.nvim'
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }

  -- UI
  use 'rcarriga/nvim-notify'

  -- Better wildmenu
  use 'gelguy/wilder.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
