return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local null_ls = require('null-ls')

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettierd.with({
          extra_args = {
            "--single-quote",
            "--no-semi",
            "--jsx-single-quote",
            "--arrow-parens avoid",
          },
          filetypes = {
            "markdown",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "css",
            "scss",
            "less",
            "html",
            "json",
            "yaml",
            "vue",
            "markdown",
            "markdown.mdx",
            "graphql",
            "handlebars",
          },
        }),
        null_ls.builtins.diagnostics.credo.with({
          condition = function(utils)
            return utils.root_has_file('.credo.exs')
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
