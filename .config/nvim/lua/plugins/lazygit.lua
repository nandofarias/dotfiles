local vimp = require('vimp')

vimp.nnoremap({ 'silent' }, '<leader>gg', ':LazyGit<CR>')
vimp.nnoremap({ 'silent' }, '<leader>gp', function()
  require("telescope").extensions.lazygit.lazygit()
end)

require("telescope").load_extension("lazygit")
