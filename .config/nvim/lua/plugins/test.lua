local vimp = require('vimp')

vimp.nmap({ 'silent' }, 'tn', ':TestNearest<CR>')
vimp.nmap({ 'silent' }, 'tf', ':TestFile<CR>')
vimp.nmap({ 'silent' }, 'ts', ':TestSuite<CR>')
vimp.nmap({ 'silent' }, 'tl', ':TestLast<CR>')
vimp.nmap({ 'silent' }, 'tg', ':TestVisit<CR>')

vim.g['test#strategy'] = 'vimux'
vim.g['test#preserve_screen'] = 0
