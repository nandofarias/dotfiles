return {
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty",
      integrations = {
        markdown = { enabled = false }, -- diagram.nvim handles this
      },
      max_width = 600,
      max_height = 180,
      max_height_window_percentage = 100,
      max_width_window_percentage = 100,
    },
  },
  {
    "3rd/diagram.nvim",
    dependencies = { "3rd/image.nvim" },
    ft = { "markdown" },
    opts = {
      events = {
        render_buffer = {},        -- no automatic inline rendering
        clear_buffer = { "BufLeave" },
      },
      renderer_options = {
        mermaid = {
          theme = "dark",
          scale = 12,
        },
      },
    },
    keys = {
      {
        "<leader>md",
        function() require("diagram").show_diagram_hover() end,
        mode = "n",
        ft = { "markdown" },
        desc = "Show Mermaid diagram",
      },
    },
  },
}
