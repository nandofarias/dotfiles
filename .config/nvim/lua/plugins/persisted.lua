return {
  'olimorris/persisted.nvim',
  event = 'BufReadPre',
  keys = {
    {
      '<Leader>sl',
      function()
        require('persisted').load()
      end,
      desc = 'Load Session'
    },
    {
      '<Leader>ss',
      function()
        require('persisted').save()
      end,
      desc = 'Save Session'
    },
    { '<Leader>st', ':Telescope persisted<CR>', desc = "Telescope Sessions" }
  },
  config = function()
    require('persisted').setup {
      use_git_branch = true,
    }

    require('telescope').load_extension('persisted')
  end
}
