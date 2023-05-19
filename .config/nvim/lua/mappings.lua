-- Operators
vim.keymap.set('o', 'ic', 'i{')
vim.keymap.set('o', 'ib', 'i[')
vim.keymap.set('o', 'ip', 'i(')

-- General
vim.keymap.set('n', '<space>no', ':nohlsearch <CR>', { silent = true })
vim.keymap.set('n', 'gs', ':set spell! <CR>', { silent = true })
vim.keymap.set('n', '<space>cc', ':cclose <CR>', { silent = true })
vim.keymap.set('n', '<space>bd', ':Bdelete <CR>', { silent = true, desc = "Buffer Delete" })
vim.keymap.set('n', '<space>ba', ':%bdelete|edit#|bdelete# <CR>', { silent = true, desc = "Buffer Delete All" })
vim.keymap.set('n', '<space>ww', ':w <CR>', { silent = true, desc = "Save Buffer" })
vim.keymap.set('n', '<space>wq', ':wq <CR>', { silent = true, desc = "Save and Quit" })
vim.keymap.set('n', '<space>qa', ':qa <CR>', { silent = true, desc = "Quit" })

-- Move lines
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Open config
vim.keymap.set('n', '<space>ov', ':e $MYVIMRC <CR>', { desc = "Open init.lua" })
vim.keymap.set('n', '<space>ot', ':e ~/.config/tmux/tmux.conf <CR>', { desc = "Open tmux.conf" })
vim.keymap.set('n', '<space>of', ':e ~/.config/fish/config.fish <CR>', { desc = "Open config.fish" })
vim.keymap.set('n', '<space>ok', ':e ~/.config/kitty/kitty.conf <CR>', { desc = "Open kitty.conf" })
vim.keymap.set('n', '<space>ob', ':e ~/.config/brew/Brewfile <CR>', { desc = "Open brewfile" })

-- Navigate wrapped lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

local group = vim.api.nvim_create_augroup('closeWithEsc', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'qf' },
  group = group,
  callback = function()
    vim.keymap.set('n', '<esc>', ':q <CR>', { silent = true, buffer = true })
  end
})
