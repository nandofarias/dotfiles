return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
  keys = {
    { '<leader>fa', ':NvimTreeToggle<CR>',         desc = "Open File Tree" },
    { '<leader>fg', ':NvimTreeFindFileToggle<CR>', desc = "Toggle Find File" },
  },
  config = function()
    vim.cmd [[hi! NvimTreeNormalNC guibg=none ctermbg=none ]]
    vim.cmd [[hi! NvimTreeNormal guibg=none ctermbg=none ]]
    vim.cmd [[hi! NvimTreeWinSeparator guibg=none ctermbg=none ]]

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
  end
}
