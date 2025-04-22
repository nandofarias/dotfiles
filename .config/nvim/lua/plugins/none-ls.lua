return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require('null-ls')

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.biome.with({
          condition = function(utils)
            return utils.root_has_file({ "biome.json" }) -- only enable if root has a biome file
          end,
        }),
        require("none-ls.diagnostics.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file({ ".eslintrc.js", ".eslintrc.ts", ".eslintrc.json" }) -- only enable if root has an eslint file
          end,
        }),
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.credo.with({
          condition = function(utils)
            return utils.root_has_file({ ".credo.exs" }) -- only enable if root has a credo file
          end
        }),
        null_ls.builtins.formatting.erlfmt,
        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.formatting.fish_indent,
        null_ls.builtins.formatting.just,
        null_ls.builtins.formatting.terraform_fmt
      },
    })
  end
}
