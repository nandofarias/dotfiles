return {
  "ishiooon/codex.nvim",
  dependencies = { "folke/snacks.nvim" },
  cmd = {
    "Codex",
    "CodexFocus",
    "CodexSend",
    "CodexTreeAdd",
  },
  keys = {
    { "<leader>a",  nil,                  desc = "AI/Codex" },
    { "<leader>ao", "<cmd>Codex<cr>",    desc = "Toggle Codex" },
    { "<leader>ap", "<cmd>CodexFocus<cr>", desc = "Focus Codex" },
    { "<leader>ae", "<cmd>CodexSend<cr>",  mode = "v", desc = "Send to Codex" },
    {
      "<leader>ae",
      "<cmd>CodexTreeAdd<cr>",
      desc = "Add file to Codex",
      ft = { "oil", "snacks_picker_list" },
    },
  },
  opts = {
    terminal_cmd = "/Users/ffarias/.local/share/mise/installs/node/25.4.0/bin/codex",
    env = {
      ENABLE_IDE_INTEGRATION = "true",
      CODEX_CODE_SSE_PORT = "12345",
      CODEX_NVIM_NOTIFY_PATH = "/tmp/codex.nvim/notify.jsonl",
    },
    status_indicator = {
      cli_notify_path = "/tmp/codex.nvim/notify.jsonl",
      turn_active_timeout_ms = 300000,
      turn_idle_grace_ms = 2000,
      inflight_timeout_ms = 300000,
    },
  },
}
