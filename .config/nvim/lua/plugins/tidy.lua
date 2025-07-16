return {
  'mcauley-penney/tidy.nvim',
  opts = {
    enabled_on_save = false,
    only_modified_lines = true,
    init = function()
      vim.keymap.set('n', "<leader>tt", require("tidy").toggle, {})
      vim.keymap.set('n', "<leader>tr", require("tidy").run, {})
    end
  }
}
