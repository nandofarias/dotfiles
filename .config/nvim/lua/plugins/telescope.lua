local vimp = require('vimp')

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

vimp.nnoremap('<C-p>', function() require('telescope.builtin').find_files() end)
vimp.nnoremap('<leader>ff', function() require('telescope.builtin').live_grep() end)
vimp.nnoremap('<leader>fb', function() require('telescope.builtin').buffers() end)
vimp.nnoremap('<leader>fh', function() require('telescope.builtin').help_tags() end)
vimp.nnoremap('<leader>ft', function() require('telescope.builtin').treesitter() end)
