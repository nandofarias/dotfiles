local vimp = require('vimp')
-- Operators
vimp.onoremap('ic', 'i{')
vimp.onoremap('ib', 'i[')
vimp.onoremap('ip', 'i(')

-- General
vimp.nnoremap({ 'silent' }, '<space>no', ':nohlsearch <CR>')
vimp.nnoremap({ 'silent' }, '<leader>r', ':source $MYVIMRC <CR>')
vimp.nnoremap({ 'silent' }, 'gs', ':set spell! <CR>')
vimp.nnoremap({ 'silent' }, '<leader>cc', ':cclose <CR>')
vimp.nnoremap({ 'silent' }, '<space>qq', ':Bdelete <CR> <Plug>(cokeline-focus-prev)<CR>')
vimp.nnoremap({ 'silent' }, '<space>da', ':%bdelete|edit#|bdelete# <CR>')

-- Move lines
vimp.nnoremap('<A-j>', ':m .+1<CR>==')
vimp.nnoremap('<A-k>', ':m .-2<CR>==')
vimp.inoremap('<A-j>', '<Esc>:m .+1<CR>==gi')
vimp.inoremap('<A-k>', '<Esc>:m .-2<CR>==gi')
vimp.vnoremap('<A-j>', ":m '>+1<CR>gv=gv")
vimp.vnoremap('<A-k>', ":m '<-2<CR>gv=gv")

-- Open config
vimp.nnoremap('<Leader>vi', ':e $MYVIMRC <CR>')
vimp.nnoremap('<Leader>tm', ':e ~/.config/tmux/tmux.conf <CR>')
vimp.nnoremap('<Leader>fs', ':e ~/.config/fish/config.fish <CR>')
vimp.nnoremap('<Leader>al', ':e ~/.config/alacritty/alacritty.yml <CR>')
vimp.nnoremap('<Leader>kt', ':e ~/.config/kitty/kitty.conf <CR>')
vimp.nnoremap('<Leader>br', ':e ~/.config/brew/Brewfile <CR>')

-- Navigate wrapped lines
vimp.nnoremap('j', 'gj')
vimp.nnoremap('k', 'gk')

local group = vim.api.nvim_create_augroup('closeWithEsc', { clear = true })
vim.api.nvim_create_autocmd('FileType', { pattern = { 'qf' }, group = group, callback = function()
  vimp.nmap({ 'silent', 'buffer' }, '<esc>', ':q <CR>')
end })
