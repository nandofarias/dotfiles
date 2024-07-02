return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      log_level = "off",
      disable_inline_completion = true,
      disable_keymaps = true,
    })
  end,
}
