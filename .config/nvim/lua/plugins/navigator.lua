return {
  'numToStr/Navigator.nvim',
  config = true,
  keys = {
    { '<C-h>', '<CMD>NavigatorLeft<CR>',                 desc = 'Navigate Left',     mode = 'n' },
    { '<C-l>', '<CMD>NavigatorRight<CR>',                desc = 'Navigate Right',    mode = 'n' },
    { '<C-k>', '<CMD>NavigatorUp<CR>',                   desc = 'Navigate Up',       mode = 'n' },
    { '<C-j>', '<CMD>NavigatorDown<CR>',                 desc = 'Navigate Down',     mode = 'n' },
    { '<C-p>', '<CMD>NavigatorPrevious<CR>',             desc = 'Navigate Previous', mode = 'n' },
    { "<C-h>", [[<C-\><C-n><CMD>NavigatorLeft<CR>]],     desc = 'Navigate Left',     mode = 't' },
    { "<C-j>", [[<C-\><C-n><CMD>NavigatorDown<CR>]],     desc = 'Navigate Down',     mode = 't' },
    { "<C-k>", [[<C-\><C-n><CMD>NavigatorUp<CR>]],       desc = 'Navigate Up',       mode = 't' },
    { "<C-l>", [[<C-\><C-n><CMD>NavigatorRight<CR>]],    desc = 'Navigate Right',    mode = 't' },
    { '<C-p>', [[<C-\><C-n><CMD>NavigatorPrevious<CR>]], desc = 'Navigate Previous', mode = 't' },
  }
}
