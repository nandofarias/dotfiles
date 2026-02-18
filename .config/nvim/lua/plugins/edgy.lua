return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    options = {
      left = { size = 40 },
    },
    bottom = {
      "Trouble",
      { ft = "qf",   title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        filter = function(buf)
          return vim.bo[buf].buftype == "help"
        end,
      },
      { ft = "grug-far", title = "Search and Replace", size = { height = 0.4 } },
    },
    left = {
      {
        title = "Outline",
        ft = "sagaoutline",
        pinned = true,
        open = "Lspsaga outline",
      },
    },
  },
}
