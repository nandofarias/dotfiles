return {
    'TimUntersberger/neogit',
    cmd = "Neogit",
    keys = {
        { '<leader>gg', ':Neogit<cr>' }
    },
    config = function()
      require("neogit").setup({
          signs = {
              -- { CLOSED, OPENED }
              section = { "", "" },
              item = { "", "" },
              hunk = { "", "" },
          },
          integrations = { diffview = true }, -- adds integration with diffview.nvim
      })
    end,
}
