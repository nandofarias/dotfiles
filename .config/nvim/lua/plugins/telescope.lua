return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-file-browser.nvim',
    'debugloop/telescope-undo.nvim',
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
      extensions = {
        persisted = {
          layout_config = { width = 0.55, height = 0.55 }
        }
      }
    }

    require('telescope').load_extension('fzf')
    require("telescope").load_extension('file_browser')
    require("telescope").load_extension('undo')
  end,
  keys = {
    { '<leader>fs', function() require('telescope.builtin').find_files() end,   desc = "Find Files" },
    { '<leader>ff', function() require('telescope.builtin').live_grep() end,    desc = "Find Word" },
    { '<C-p>', function() require('telescope.builtin').buffers() end,      desc = "Find Buffers" },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end,    desc = "Find Tags" },
    { '<leader>ft', function() require('telescope.builtin').treesitter() end,   desc = "Find Treesitter" },
    { '<leader>tu', function() require('telescope').extensions.undo.undo() end, desc = "Telescope undo" },
  }
}
