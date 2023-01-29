return {
  'olimorris/persisted.nvim',
  config = function()
    vim.keymap.set('n', '<Leader>sl', function()
      require('persisted').load()
    end)

    vim.keymap.set('n', '<Leader>ss', function()
      require('persisted').save()
    end)

    vim.keymap.set('n', '<Leader>st', ':Telescope persisted<CR>')


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
