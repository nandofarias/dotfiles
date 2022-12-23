vim.keymap.set('n', 'tn', ':TestNearest<CR>', { silent = true })
vim.keymap.set('n', 'tf', ':TestFile<CR>', { silent = true })
vim.keymap.set('n', 'ts', ':TestSuite<CR>', { silent = true })
vim.keymap.set('n', 'tl', ':TestLast<CR>', { silent = true })
vim.keymap.set('n', 'tg', ':TestVisit<CR>', { silent = true })

vim.g['test#strategy'] = 'vimux'
vim.g['test#preserve_screen'] = 0
