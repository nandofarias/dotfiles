local vimp = require('vimp')
-- Operators
vimp.onoremap('ic', 'i{')
vimp.onoremap('ib', 'i[')
vimp.onoremap('ip', 'i(')

-- General
vimp.nnoremap({ 'silent' }, '<space>no', ':nohlsearch <CR>')
vimp.nnoremap({ 'silent' }, '<space>r', ':source $MYVIMRC <CR>')
vimp.nnoremap({ 'silent' }, 'gs', ':set spell! <CR>')
vimp.nnoremap({ 'silent' }, '<space>cc', ':cclose <CR>')
vimp.nnoremap({ 'silent' }, '<space>bx', ':Bdelete <CR> <Plug>(cokeline-focus-prev)<CR>')
vimp.nnoremap({ 'silent' }, '<space>bd', ':%bdelete|edit#|bdelete# <CR>')
vimp.nnoremap({ 'silent' }, '<space>w', ':w <CR>')
vimp.nnoremap({ 'silent' }, '<space>qq', ':qa <CR>')

-- Move lines
vimp.nnoremap('<A-j>', ':m .+1<CR>==')
vimp.nnoremap('<A-k>', ':m .-2<CR>==')
vimp.inoremap('<A-j>', '<Esc>:m .+1<CR>==gi')
vimp.inoremap('<A-k>', '<Esc>:m .-2<CR>==gi')
vimp.vnoremap('<A-j>', ":m '>+1<CR>gv=gv")
vimp.vnoremap('<A-k>', ":m '<-2<CR>gv=gv")

-- Open config
vimp.nnoremap('<space>ov', ':e $MYVIMRC <CR>')
vimp.nnoremap('<space>ot', ':e ~/.config/tmux/tmux.conf <CR>')
vimp.nnoremap('<space>of', ':e ~/.config/fish/config.fish <CR>')
vimp.nnoremap('<space>oa', ':e ~/.config/alacritty/alacritty.yml <CR>')
vimp.nnoremap('<space>ok', ':e ~/.config/kitty/kitty.conf <CR>')
vimp.nnoremap('<space>ob', ':e ~/.config/brew/Brewfile <CR>')

-- Navigate wrapped lines
vimp.nnoremap('j', 'gj')
vimp.nnoremap('k', 'gk')

local group = vim.api.nvim_create_augroup('closeWithEsc', { clear = true })
vim.api.nvim_create_autocmd('FileType', { pattern = { 'qf' }, group = group, callback = function()
  vimp.nmap({ 'silent', 'buffer' }, '<esc>', ':q <CR>')
end })
