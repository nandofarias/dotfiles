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
  'mong8se/actually.nvim',
  'superhawk610/ascii-blocks.nvim',
  'Bekaboo/deadcolumn.nvim',

  -- Better Git
  { 'sindrets/diffview.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },

  -- Frontend
  'mattn/emmet-vim',

  -- Better quickfix
  { 'kevinhwang91/nvim-bqf',  ft = 'qf' },

  -- Which key
  { 'folke/which-key.nvim',
    opts = {
      spec = {
        { "<leader>a", group = "AI/Claude" },
        { "<leader>b", group = "Buffers" },
        { "<leader>d", group = "Database" },
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>h", group = "Git Hunks" },
        { "<leader>i", group = "Iron REPL" },
        { "<leader>j", group = "JSON" },
        { "<leader>o", group = "Open Config" },
        { "<leader>p", group = "Sessions" },
        { "<leader>r", group = "HTTP/Run" },
        { "<leader>s", group = "Search/Split" },
        { "<leader>t", group = "Test" },
        { "<leader>w", group = "Save" },
        { "<leader>c", group = "Conflicts" },
        { "<leader>x", group = "Trouble" },
      },
    },
  },
}
