return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local tokyonight = require('lualine.themes.tokyonight')
    tokyonight.normal.c.bg = 'none'

    require('lualine').setup {
      options = {
        theme = tokyonight,
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
        lualine_c = { 'filename', function() return require('lsp-progress').progress() end },
        lualine_x = {
          {
            require('lazy.status').updates,
            cond = require('lazy.status').has_updates,
            color = { bg = 'none', fg = '#ff966c' },
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
