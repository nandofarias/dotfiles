local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.credo.with({
      condition = function(utils)
        return utils.root_has_file('.credo.exs')
      end
    }),
    null_ls.builtins.formatting.erlfmt,
    null_ls.builtins.diagnostics.fish,
    null_ls.builtins.formatting.fish_indent,
    null_ls.builtins.formatting.just
  },
})
