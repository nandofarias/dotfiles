return {
  "emrearmagan/atlas.nvim",
  cmd = { "Atlas" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "sindrets/diffview.nvim",
  },
  keys = {
    { "<leader>gp", "<cmd>Atlas pulls .<cr>", desc = "PR dashboard (Atlas)" },
    { "<leader>gP", "<cmd>Atlas<cr>", desc = "Atlas commands" },
  },
  opts = {
    ui = {
      picker = "snacks",
    },
    providers = {
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
          ["Boulevard/sched"] = "~/Developer/Boulevard/sched/develop",
          ["Boulevard/*"] = "~/Developer/Boulevard/*",
          ["nandofarias/*"] = "~/Developer/personal/*",
        },
      },
    },
  },
}
