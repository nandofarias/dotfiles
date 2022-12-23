vim.cmd [[au VimEnter * hi! TabLineFill gui=none guifg=none guibg=none]]

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
vim.keymap.set('n', '<leader>fa', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>fg', ':NvimTreeFindFile<CR>')
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Troubleshooting#fish
vim.g.shell = '/bin/zsh'
