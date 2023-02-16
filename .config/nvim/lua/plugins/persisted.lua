return {
    'olimorris/persisted.nvim',
    keys = {
        { '<Leader>sl', function()
          require('persisted').load()
        end, desc = 'Save Session' },
        { '<Leader>ss', function()
          require('persisted').save()
        end, desc = 'Load Session' },
        { '<Leader>st', ':Telescope persisted<CR>', desc = "Telescope Sessions" }
    },
    config = function()
      require('persisted').setup {
          use_git_branch = true,
          branch_separator = '@@',
          after_save = function()
            vim.notify('Session was saved!')
          end,
          telescope = {
              before_source = function()
                vim.cmd('bufdo Bwipeout')
              end
          },
      }

      require('telescope').load_extension('persisted')
    end
}
