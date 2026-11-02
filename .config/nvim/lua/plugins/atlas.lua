-- atlas.nvim: PR review + issues dashboard (trial alongside octo.nvim)
-- Early development upstream; expect breaking changes on update.
return {
  "emrearmagan/atlas.nvim",
  cmd = { "Atlas" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "sindrets/diffview.nvim",
  },
  -- Only two keys to remember; everything else lives in menus:
  --   :Atlas lists every command, and g? inside Atlas shows its keys.
  keys = {
    { "<leader>gp", "<cmd>Atlas pulls .<cr>", desc = "PR dashboard (Atlas)" },
    { "<leader>gP", "<cmd>Atlas<cr>", desc = "Atlas commands" },
  },
  ---@type AtlasConfig
  opts = {
    ui = {
      picker = "snacks",
    },
    providers = {
      -- Uses the gh CLI login; no token here
      github = {},
    },
    pulls = {
      default_merge_method = "squash",
      github = {
        views = {
          {
            name = "Review requested",
            key = "1",
            layout = "compact",
            search = "is:pr is:open review-requested:@me sort:updated-desc",
          },
          {
            name = "My PRs",
            key = "2",
            layout = "compact",
            search = "is:pr is:open author:@me sort:updated-desc",
          },
          {
            name = "This repo",
            key = "3",
            layout = "grouped",
            current_repo = true,
            search = "is:pr is:open sort:updated-desc",
          },
        },
        bookmarks = {
          items = {
            ["Needs my approval"] = "is:pr is:open review-requested:@me review:required",
            ["Drafts"] = "is:pr is:draft author:@me",
            ["Recently merged"] = "is:pr is:merged author:@me sort:updated-desc",
          },
        },
      },
      repo_config = {
        paths = {
          ["Boulevard/*"] = "~/Developer/Boulevard/*",
          ["nandofarias/*"] = "~/Developer/personal/*",
        },
      },
    },
  },
}
