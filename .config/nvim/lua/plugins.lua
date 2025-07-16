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
  'tpope/vim-abolish',
  { 'windwp/nvim-autopairs',    config = true },
  { 'tversteeg/registers.nvim', config = true },
  { 'chentoast/marks.nvim',     config = true },
  'dstein64/vim-startuptime',
  'rhysd/clever-f.vim',
  { 'folke/todo-comments.nvim', config = true },
  { 'numToStr/Comment.nvim',    config = true },
  'benizi/vim-automkdir',
  'gpanders/editorconfig.nvim',
  'mong8se/actually.nvim',
  'superhawk610/ascii-blocks.nvim',
  'Bekaboo/deadcolumn.nvim',

  -- Better Git
  { 'sindrets/diffview.nvim', dependencies = { 'kyazdani42/nvim-web-devicons' } },

  -- Frontend
  'mattn/emmet-vim',

  -- Better quickfix
  { 'kevinhwang91/nvim-bqf',  ft = 'qf' },

  -- Better wildmenu
  { 'gelguy/wilder.nvim',     config = function() require('wilder').setup({ modes = { ':', '/', '?' } }) end },

  -- Which key
  { 'folke/which-key.nvim',   config = true },
}
