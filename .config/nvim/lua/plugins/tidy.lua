return {
  'mcauley-penney/tidy.nvim',
  event = "BufWritePre",
  opts = {
    enabled_on_save = false,
    only_modified_lines = true,
  },
  keys = {
    { "<leader>tt", function() require("tidy").toggle() end, desc = "Toggle Tidy" },
    { "<leader>tr", function() require("tidy").run() end, desc = "Run Tidy" },
  },
}
