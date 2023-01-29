return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-file-browser.nvim',
  },
  config = function()
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
  end,
  keys = {
    { '<leader>fs', function() require('telescope.builtin').find_files() end },
    { '<leader>ff', function() require('telescope.builtin').live_grep() end },
    { '<leader>fb', function() require('telescope.builtin').buffers() end },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end },
    { '<leader>ft', function() require('telescope.builtin').treesitter() end },
  }
}
