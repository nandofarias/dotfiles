return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'WhoIsSethDaniel/lualine-lsp-progress',
  },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'tokyonight',
        disabled_filetypes = {
          "dashboard",
          "NvimTree",
          "TelescopePrompt",
          "TelescopeResults",
        },
        component_separators = '|',
        section_separators = { left = '', right = '' },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename', 'lsp_progress' },
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
    }
  end
}
