vim.cmd [[au VimEnter * hi! TabLineFill gui=none guifg=none guibg=none]]

local vimp = require('vimp')

require('nvim-tree').setup {
  git = {
    ignore = false,
  },
  diagnostics = {
    enable = true,
  },
  view = {
    width = 45,
    side = 'left'
  },
  actions = {
    change_dir = {
      enable = false,
      global = false,
    },
    open_file = {
      quit_on_open = true,
    }
  }
}
vim.g.nvim_tree_respect_buf_cwd = 1
vimp.nnoremap('<C-n>', ':NvimTreeToggle<CR>')
vimp.nnoremap('<leader>n', ':NvimTreeFindFile<CR>')
-- https://github.com/kyazdani42/nvim-tree.lua/issues/549
vim.g.shell = '/bin/zsh'
