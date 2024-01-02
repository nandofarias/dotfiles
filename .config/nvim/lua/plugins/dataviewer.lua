return {
  'vidocqh/data-viewer.nvim',
  opts = {
    autoDisplayWhenOpenFile = true,
    view = {
      float = false,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kkharji/sqlite.lua", -- Optional, sqlite support
  }
}
