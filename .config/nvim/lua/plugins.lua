return {
  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },

  -- Lua helper
  'wbthomason/packer.nvim',
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',

  -- Utilities
  'tpope/vim-surround',
  'tpope/vim-abolish',
  { 'szw/vim-maximizer', keys = { { '<space>m', ':MaximizerToggle <CR>' } } },
  { 'windwp/nvim-autopairs', config = true },
  { 'karb94/neoscroll.nvim', config = true },
  'famiu/bufdelete.nvim',
  { 'tversteeg/registers.nvim', config = true },
  'RRethy/vim-illuminate',
  { 'chentoast/marks.nvim', config = true },
  'dstein64/vim-startuptime',
  { 'mcauley-penney/tidy.nvim', config = true },
  'stsewd/gx-extended.vim',
  'rhysd/clever-f.vim',
  { 'folke/todo-comments.nvim', config = true },
  { 'numToStr/Comment.nvim', config = true },
  'benizi/vim-automkdir',
  'gpanders/editorconfig.nvim',
  'ellisonleao/glow.nvim',
  'mong8se/actually.nvim',
  'superhawk610/ascii-blocks.nvim',
  { 'lukas-reineke/virt-column.nvim', config = function()
    vim.cmd [[ au VimEnter * highlight VirtColumn guifg=#202020 gui=nocombine ]]
    require('virt-column').setup()
  end },

  -- Window hacks
  { 'luukvbaal/stabilize.nvim', config = true },
  'simeji/winresizer',
  'xiyaowong/nvim-transparent',

  -- Better Git
  'sindrets/diffview.nvim',
  { 'ruifm/gitlinker.nvim', config = true },

  -- Earthly, will be removed when tree-sitter is available
  { 'earthly/earthly.vim', branch = 'main' },

  -- Frontend
  'mattn/emmet-vim',

  -- Better quickfix
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },

  -- Better wildmenu
  { 'gelguy/wilder.nvim', config = function() require('wilder').setup({ modes = { ':', '/', '?' } }) end }
}
