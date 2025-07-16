return {
  'olimorris/persisted.nvim',
  event = 'BufReadPre',
  keys = {
    {
      '<Leader>pl',
      function()
        require('persisted').load()
      end,
      desc = 'Load Session'
    },
    {
      '<Leader>ps',
      function()
        require('persisted').save()
      end,
      desc = 'Save Session'
    },
    { '<Leader>pt', ':Telescope persisted<CR>', desc = "Telescope Sessions" }
  },
  config = function()
    require('persisted').setup {
      use_git_branch = true,
      autoload = true,
    }

    require('telescope').load_extension('persisted')
  end
}
