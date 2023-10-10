return {
  'lukas-reineke/indent-blankline.nvim',
  main = "ibl",
  config = function()
    vim.cmd [[ au VimEnter * highlight IndentBlanklineChar guifg=#202020 gui=nocombine ]]
    vim.cmd [[ au VimEnter * highlight IndentBlanklineContextChar guifg=#454545 gui=nocombine ]]

    require("ibl").setup {
      exclude = {
        filetypes = {
          "help",
          "terminal",
          "dashboard",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
          "NvimTree",
          "packer",
          "dbout",
        },
        buftypes = { "terminal" },
      }
    }
  end
}
