return {
  'pwntester/octo.nvim',
  cmd = { 'Octo' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>orl', function()
      local remote = vim.fn.system("gh repo view --json nameWithOwner -q .nameWithOwner"):gsub("%s+", "")
      vim.cmd("Octo search is:pr is:open review-requested:@me repo:" .. remote)
    end, desc = "List PRs requesting my review (this repo)" },
    { '<leader>oru', function()
      local remote = vim.fn.system("gh repo view --json nameWithOwner -q .nameWithOwner"):gsub("%s+", "")
      vim.cmd("Octo search is:pr is:open review-requested:@me review:required repo:" .. remote)
    end, desc = "List PRs needing approval (this repo)" },
    { '<leader>orL', '<cmd>Octo search is:pr is:open review-requested:@me<cr>', desc = "List all PRs requesting review" },
    { '<leader>ors', '<cmd>Octo review start<cr>',                           desc = "Start review" },
    { '<leader>orp', function()
      local ok, last = pcall(vim.fn.readfile, vim.fn.expand("~/.cache/octo-last-pr"))
      if not ok or #last == 0 then
        vim.notify("No last PR saved", vim.log.levels.WARN)
        return
      end
      local number = last[1]:match("(%d+)$")
      if number then
        vim.cmd("Octo pr edit " .. number)
      end
    end, desc = "Open last reviewed PR" },
    { '<leader>orr', '<cmd>Octo review resume<cr>',                           desc = "Resume review" },
    { '<leader>ora', '<cmd>Octo review submit approve<cr>',                  desc = "Approve PR" },
    { '<leader>orc', '<cmd>Octo review comments<cr>',                        desc = "View review comments" },
    { '<leader>ore', '<cmd>Octo review submit<cr>',                          desc = "Submit review (end)" },
    { '<leader>orx', function()
      -- Get PR number from current Octo buffer
      local bufname = vim.api.nvim_buf_get_name(0)
      local pr_number = bufname:match("octo://.-/(%d+)")
      if not pr_number then
        vim.notify("Not in an Octo PR buffer", vim.log.levels.WARN)
        return
      end
      -- Write diff to a temp file so Claude can read it
      local remote = vim.fn.system("gh repo view --json nameWithOwner -q .nameWithOwner"):gsub("%s+", "")
      local tmpfile = "/tmp/pr-review-" .. pr_number .. ".md"
      local body = vim.fn.system("gh pr view " .. pr_number .. " --json title,body -q '.title + \"\\n\\n\" + .body'")
      local diff = vim.fn.system("gh pr diff " .. pr_number)
      local f = io.open(tmpfile, "w")
      if f then
        f:write("# PR #" .. pr_number .. " (" .. remote .. ")\n\n")
        f:write("## Description\n" .. body .. "\n\n")
        f:write("## Diff\n```diff\n" .. diff .. "\n```\n")
        f:close()
      end
      -- Open Claude if needed, add file, send review prompt
      vim.cmd("ClaudeCode")
      vim.defer_fn(function()
        vim.cmd("ClaudeCodeAdd " .. tmpfile)
        vim.defer_fn(function()
          -- Type the review prompt into Claude's terminal
          local term_buf = nil
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.bo[buf].buftype == "terminal" and vim.api.nvim_buf_get_name(buf):match("claude") then
              term_buf = buf
              break
            end
          end
          if term_buf then
            local term_chan = vim.b[term_buf].terminal_job_id
            if term_chan then
              vim.api.nvim_chan_send(term_chan, "Review this PR. Focus on correctness, edge cases, missing tests, and Elixir best practices. Be concise.\n")
            end
          end
          vim.cmd("ClaudeCodeFocus")
        end, 500)
      end, 500)
    end, desc = "Send PR to Claude Code for review" },
  },
  config = function()
    require('octo').setup({
      default_remote = { 'origin' },
    })

    vim.treesitter.language.register('markdown', 'octo')

    -- Save last opened PR
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "octo://*",
      callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        local owner, repo, number = bufname:match("octo://([^/]+)/([^/]+)/pull/(%d+)")
        if owner and repo and number then
          vim.fn.writefile({ owner .. "/" .. repo .. " " .. number }, vim.fn.expand("~/.cache/octo-last-pr"))
        end
      end,
    })
  end
}
