return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
    'RRethy/nvim-treesitter-textsubjects',
    'windwp/nvim-ts-autotag',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'IndianBoy42/tree-sitter-just',
  },
  config = function()
    require "nvim-treesitter.install".compilers = { "gcc-11" }
    require('tree-sitter-just').setup {}
    require('nvim-treesitter.configs').setup({
      ensure_installed = 'all',
      ignore_install = { "liquidsoap" },
      indent = {
        enable = true
      },
      highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
      },
      autotag = {
        enable = true,
      },
      context_commentstring = {
        enable = true
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["am"] = "@class.outer",
            ["im"] = "@class.inner",
            ["ac"] = "@comment.outer",
            ["as"] = "@statement.outer"
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },
      textsubjects = {
        enable = true,
        keymaps = {
          ['.'] = 'textsubjects-smart',
        }
      },
    })
  end
}
