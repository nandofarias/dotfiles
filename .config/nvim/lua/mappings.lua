-- Operators
vim.keymap.set('o', 'ic', 'i{')
vim.keymap.set('o', 'ib', 'i[')
vim.keymap.set('o', 'ip', 'i(')

-- General
vim.keymap.set('n', '<space>no', ':nohlsearch <CR>', { silent = true })
vim.keymap.set('n', '<space>r', ':source $MYVIMRC <CR>', { silent = true })
vim.keymap.set('n', 'gs', ':set spell! <CR>', { silent = true })
vim.keymap.set('n', '<space>cc', ':cclose <CR>', { silent = true })
vim.keymap.set('n', '<space>bx', ':Bdelete <CR> <Plug>(cokeline-focus-prev)<CR>', { silent = true })
vim.keymap.set('n', '<space>bd', ':%bdelete|edit#|bdelete# <CR>', { silent = true })
vim.keymap.set('n', '<space>w', ':w <CR>', { silent = true })
vim.keymap.set('n', '<space>qq', ':qa <CR>', { silent = true })

-- Move lines
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Open config
vim.keymap.set('n', '<space>ov', ':e $MYVIMRC <CR>')
vim.keymap.set('n', '<space>ot', ':e ~/.config/tmux/tmux.conf <CR>')
vim.keymap.set('n', '<space>of', ':e ~/.config/fish/config.fish <CR>')
vim.keymap.set('n', '<space>oa', ':e ~/.config/alacritty/alacritty.yml <CR>')
vim.keymap.set('n', '<space>ok', ':e ~/.config/kitty/kitty.conf <CR>')
vim.keymap.set('n', '<space>ob', ':e ~/.config/brew/Brewfile <CR>')

-- Navigate wrapped lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

local group = vim.api.nvim_create_augroup('closeWithEsc', { clear = true })
vim.api.nvim_create_autocmd('FileType', { pattern = { 'qf' }, group = group, callback = function()
  vim.keymap.set('n', '<esc>', ':q <CR>', { silent = true, buffer = true })
end })
