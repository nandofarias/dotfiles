return {
  'kyazdani42/nvim-tree.lua',
  depencencies = {
    'kyazdani42/nvim-web-devicons',
  },
  keys = {
    { '<leader>fa', ':NvimTreeToggle<CR>' },
    { 'n', '<leader>fg', ':NvimTreeFindFile<CR>' },
  },
  config = function()
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
    -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Troubleshooting#fish
    vim.g.shell = '/bin/zsh'
  end
}
