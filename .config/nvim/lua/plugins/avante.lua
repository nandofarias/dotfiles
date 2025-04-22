return {
  "yetone/avante.nvim",
  keys = {
    { "<leader>aa", "<cmd>AvanteAsk<cr>",    desc = "Avante Ask" },
    { "<leader>at", "<cmd>AvanteToggle<cr>", desc = "Avante Toggle" },
    { "<leader>ac", "<cmd>AvanteChat<cr>",   desc = "Avante Chat" }
  },
  opts = {
    provider = "openai",
    openai = {
      endpoint = "https://api.openai.com/v1",
      model = "gpt-4o-mini",
      timeout = 30000,
      max_tokens = 4096,
      api_key_name =
      "cmd:op read op://Private/52xxch3fqpsxvitcl6kuokjdoe/api_key --no-newline --account familia-farias.1password.com",
    },
    mappings = {
      ask = "<leader>aa",     -- ask
      edit = "<leader>ae",    -- edit
      refresh = "<leader>ar", -- refresh
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
    },
  },
}
