vim.notify = require("notify")
local vimp = require('vimp')
vimp.nnoremap('<Leader>sl', function()
  require("persisted").load()
end)

vimp.nnoremap('<Leader>ss', function()
  require("persisted").save()
end)

vimp.nnoremap('<Leader>st', ':Telescope persisted<CR>')


require("persisted").setup {
  use_git_branch = true,
  after_save = function()
    vim.notify("Session was saved!")
  end,
  telescope = {
    before_source = function()
      pcall(vim.cmd, "bufdo Bwipeout")
    end,
    after_source = function(session)
      pcall(vim.cmd, "git checkout " .. session.branch)
    end,
  },
}

require("telescope").load_extension("persisted")
