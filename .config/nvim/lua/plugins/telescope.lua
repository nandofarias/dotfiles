return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        -- winblend = 60,
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
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
  end,
  keys = {
    { '<leader>fs', function() require('telescope.builtin').find_files() end,   desc = "Find Files" },
    { '<leader>ff', function() require('telescope.builtin').live_grep() end,    desc = "Find Word" },
    { '<leader>bb', function() require('telescope.builtin').buffers() end,      desc = "Find Buffers" },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end,    desc = "Find Tags" },
    { '<leader>ft', function() require('telescope.builtin').treesitter() end,   desc = "Find Treesitter" },
    { '<leader>fd', function() require('telescope.builtin').diagnostics() end,   desc = "Find Diagnostics" },
    { '<leader>fr', function() require('telescope.builtin').resume() end,       desc = "Resume Last Search" },
    { '<leader>fo', function() require('telescope.builtin').oldfiles() end,     desc = "Recent Files" },
    { '<leader>fw', function() require('telescope.builtin').grep_string() end,  desc = "Find Word Under Cursor" },
    { '<leader>gc', function() require('telescope.builtin').git_commits() end,  desc = "Git Commits" },
    { '<leader>gs', function() require('telescope.builtin').git_status() end,   desc = "Git Status" },
  }
}
