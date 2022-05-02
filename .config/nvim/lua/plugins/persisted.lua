local vimp = require('vimp')

vimp.nnoremap('<Leader>sl', function () 
  require("persisted").load()
end)

require("persisted").setup {
  use_git_branch = true,
}
