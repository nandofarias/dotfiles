return {
  'stevearc/oil.nvim',
  cmd = { "Oil" },
  keys = {
    { "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" } },
  },
  opts = {},
  config = true,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
