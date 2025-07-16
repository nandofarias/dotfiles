return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys",  gap = 1, padding = 1 },
        {
          pane = 2,
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = "Notifications",
              cmd = "gh notify -s -a -n5",
              action = function()
                vim.ui.open("https://github.com/notifications")
              end,
              key = "n",
              icon = " ",
              height = 5,
              enabled = true,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 3",
              key = "P",
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              height = 7,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { section = "startup" },
      },
    },
    explorer = { enabled = true },
    image = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    -- scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    -- Top Pickers & Explorer
    { "<leader>bd", function() Snacks.bufdelete() end,          desc = "Buffer delete" },
    { "<leader>fa", function() Snacks.explorer() end,           desc = "File Explorer" },
    { "<leader>fg", function() Snacks.explorer.reveal() end,    desc = "Reveal File" },
    { "<leader>gy", function() Snacks.gitbrowse() end,          desc = "Git Browse",           mode = { "n", "v" } },
    { "<leader>fR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    { "<leader>.",  function() Snacks.scratch() end,            desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end,     desc = "Select Scratch Buffer" },
    { "<leader>z",  function() Snacks.zen() end,                desc = "Toggle Zen Mode" },
    { "<leader>Z",  function() Snacks.zen.zoom() end,           desc = "Toggle Zoom" },
  },
}
