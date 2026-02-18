return {
  'vidocqh/data-viewer.nvim',
  ft = { "csv", "tsv" },
  opts = {
    autoDisplayWhenOpenFile = true,
    view = {
      float = false,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kkharji/sqlite.lua",
  },
}
