return {
  'rest-nvim/rest.nvim',
  ft = 'http',
  dependencies = {
    {
      "vhyrro/luarocks.nvim",
      opts = {
        rocks = { "nvim-nio", "mimetypes", "xml2lua", "lua-curl" }
      }
    },
  },
  config = function()
    require("rest-nvim").setup()
  end,
  keys = {
    { "<leader>hr", "<cmd>Rest run<cr>",      desc = "Run request under the cursor" },
    { "<leader>hl", "<cmd>Rest run last<cr>", desc = "Re-run latest request" },
  }
}
