return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/playground',
        'RRethy/nvim-treesitter-textsubjects',
        'windwp/nvim-ts-autotag',
        'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('nvim-treesitter.configs').setup({
          ensure_installed = 'all',
          indent = {
              enable = true
          },
          highlight = {
              enable = true,
              use_languagetree = true,
              additional_vim_regex_highlighting = { "markdown" },
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

      require("nvim-treesitter.parsers").get_parser_configs().just = {
          install_info = {
              url = "https://github.com/IndianBoy42/tree-sitter-just",
              files = { "src/parser.c", "src/scanner.cc" },
              branch = "main",
              use_makefile = true,
          },
          maintainers = { "@IndianBoy42" },
      }
    end
}
