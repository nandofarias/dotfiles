return {
  "yetone/avante.nvim",
  keys = {
    { "<leader>aa", "<cmd>AvanteAsk<cr>",    desc = "Avante Ask" },
    { "<leader>at", "<cmd>AvanteToggle<cr>", desc = "Avante Toggle" },
    { "<leader>ac", "<cmd>AvanteChat<cr>",   desc = "Avante Chat" }
  },
  opts = {
    provider = "openai",
    providers = {
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o-mini",
        timeout = 30000,
        max_tokens = 4096,
        api_key_name =
        "cmd:op read op://Private/52xxch3fqpsxvitcl6kuokjdoe/api_key --no-newline --account familia-farias.1password.com",
      },
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514",
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 1024,
        },
        api_key_name =
        "cmd:op read op://Private/Anthropic/credential --no-newline --account familia-farias.1password.com",
      },
    },
    behaviour = {
      auto_suggestions = false,
      minimize_diff = false,
      enable_cursor_planning_mode = true,
      enable_claude_text_editor_tool_mode = true,
    },
    mappings = {
      ask = "<leader>aa",     -- ask
      edit = "<leader>ae",    -- edit
      refresh = "<leader>ar", -- refresh
    },
    system_prompt = function()
      local hub = require("mcphub").get_hub_instance()
      return hub and hub:get_active_servers_prompt() or ""
    end,
    -- Using function prevents requiring mcphub before it's loaded
    custom_tools = function()
      return {
        require("mcphub.extensions.avante").mcp_tool(),
      }
    end,
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
}
