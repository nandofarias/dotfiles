return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  keys = {
    {
      "<leader>sr",
      function()
        require("grug-far").open()
      end,
      desc = "Search and Replace (grug-far)",
    },
    {
      "<leader>sr",
      function()
        require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      mode = "v",
      desc = "Search selection (grug-far)",
    },
  },
  opts = {
    engine = "ripgrep",
  },
}
