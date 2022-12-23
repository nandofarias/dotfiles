require('telescope').setup {
  defaults = {
    layout_config = {
      center = { width = 0.8 },
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
      prompt_prefix = " ",
      previewer = false,
    },
    live_grep = {
      prompt_prefix = " ",
    },
  },
}

require('telescope').load_extension('fzf')
require("telescope").load_extension "file_browser"

vim.keymap.set('n', '<leader>fs', function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').live_grep() end)
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end)
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end)
vim.keymap.set('n', '<leader>ft', function() require('telescope.builtin').treesitter() end)
