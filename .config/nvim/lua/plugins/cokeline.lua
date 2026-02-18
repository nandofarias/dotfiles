return {
  'willothy/nvim-cokeline',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<S-Tab>',   '<Plug>(cokeline-focus-prev)',  { silent = true, desc = "Prev Buffer" } },
    { '<Tab>',     '<Plug>(cokeline-focus-next)',  { silent = true, desc = "Next Buffer" } },
    { "<Leader>p", "<Plug>(cokeline-switch-prev)", { silent = true, desc = "Switch Prev Buffer" } },
    { "<Leader>n", "<Plug>(cokeline-switch-next)", { silent = true, desc = "Switch Next Buffer" } }
  },
  config = function()
    local hlgroups = require("cokeline.hlgroups")
    local green = vim.g.terminal_color_2
    local errors_fg = hlgroups.get_hl_attr('DiagnosticError', 'fg')
    local warnings_fg = hlgroups.get_hl_attr('DiagnosticWarn', 'fg')
    local default_bg = '#444a73'
    local map = vim.api.nvim_set_keymap

    require('cokeline').setup({
      buffers = {
        new_buffers_position = 'next',
        filter_valid = function(buffer)
          return buffer.type ~= "quickfix"
        end
      },
      fill_hl = 'FloatBorder',
      default_hl = {
        fg = function(buffer)
          return buffer.is_focused
              and hlgroups.get_hl_attr('Normal', 'fg')
              or hlgroups.get_hl_attr('Comment', 'fg')
        end,
        bg = default_bg,
      },
      -- sidebar = {
      --   filetype = 'NvimTree',
      --   components = {
      --     {
      --       text = '  LeftBar',
      --       style = 'bold',
      --       bg = 'none',
      --     },
      --   }
      -- },
      components = {
        {
          text = '',
          bg = 'none',
          fg = default_bg,
        },
        {
          text = function(buffer)
            return buffer.devicon.icon
          end,
          fg = function(buffer)
            return buffer.devicon.color
          end,
        },
        {
          text = ' ',
        },
        {
          text = function(buffer) return buffer.filename end,
          style = function(buffer)
            return buffer.is_focused and 'bold' or nil
          end,
        },
        {
          text = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and '  ' .. buffer.diagnostics.errors)
                or (buffer.diagnostics.warnings ~= 0 and ' ⚠ ' .. buffer.diagnostics.warnings)
                or ''
          end,
          fg = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and errors_fg)
                or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
                or nil
          end,
          truncation = { priority = 1 },
        },
        {
          text = ' ',
        },
        {
          text = function(buffer)
            return buffer.is_modified and '●' or '󱎘'
          end,
          fg = function(buffer)
            return buffer.is_modified and green or nil
          end,
          delete_buffer_on_left_click = true,
          truncation = { priority = 1 },
        },
        {
          text = '',
          bg = 'none',
          fg = default_bg,
        },
        {
          text = ' ',
          bg = 'none',
        },
      },
    })

    for i = 1, 9 do
      map(
        "n",
        ("<Leader>%s"):format(i),
        ("<Plug>(cokeline-focus-%s)"):format(i),
        { silent = true }
      )
    end
  end
}
