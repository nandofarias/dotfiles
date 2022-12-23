require('rest-nvim').setup()

vim.keymap.set({ 'n', 't' }, '<leader>rf', '<Plug>RestNvim<CR>')
vim.keymap.set({ 'n', 't' }, '<leader>rl', '<Plug>RestNvimLast<CR>')
vim.keymap.set({ 'n', 't' }, '<leader>rp', '<Plug>RestNvimPreview<CR>')
