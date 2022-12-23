vim.keymap.set('n', '<leader>gl', ':LazyGit<CR>', { silent = true })
vim.keymap.set('n', '<leader>gp', function()
  require("telescope").extensions.lazygit.lazygit()
end, { silent = true })

require("telescope").load_extension("lazygit")
