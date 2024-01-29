return {
  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = 'moon',
        transparent = true,
        tokyonight_dark_float = false,
        dim_inactive = true,
        hide_inactive_statusline = true,
      })
      vim.cmd([[colorscheme tokyonight-moon]])
      vim.cmd([[hi TabLine guibg=NONE guifg=NONE]])
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

    end,
  },

  -- Utilities
  'tpope/vim-surround',
  'tpope/vim-abolish',
  { 'szw/vim-maximizer',     keys = { { '<space>m', ':MaximizerToggle <CR>' } } },
  { 'windwp/nvim-autopairs', config = true },
  { 'karb94/neoscroll.nvim', config = true },
  'famiu/bufdelete.nvim',
  { 'tversteeg/registers.nvim', config = true },
  { 'chentoast/marks.nvim',     config = true },
  'dstein64/vim-startuptime',
  { 'mcauley-penney/tidy.nvim', config = true },
  'rhysd/clever-f.vim',
  { 'folke/todo-comments.nvim', config = true },
  { 'numToStr/Comment.nvim',    config = true },
  'benizi/vim-automkdir',
  'gpanders/editorconfig.nvim',
  'ellisonleao/glow.nvim',
  'mong8se/actually.nvim',
  'superhawk610/ascii-blocks.nvim',
  { 'akinsho/git-conflict.nvim', version = "*",                                    config = true },
  'Bekaboo/deadcolumn.nvim',

  -- Better Git
  { 'sindrets/diffview.nvim',    dependencies = { 'kyazdani42/nvim-web-devicons' } },
  { 'ruifm/gitlinker.nvim',      config = true },

  -- Earthly, will be removed when tree-sitter is available
  { 'earthly/earthly.vim',       branch = 'main' },

  -- Frontend
  'mattn/emmet-vim',

  -- Better quickfix
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },

  -- Better wildmenu
  { 'gelguy/wilder.nvim',    config = function() require('wilder').setup({ modes = { ':', '/', '?' } }) end },

  -- Which key
  { 'folke/which-key.nvim',  config = true },
}
