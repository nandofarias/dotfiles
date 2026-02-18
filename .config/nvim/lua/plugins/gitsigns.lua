return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
        ignore_whitespace = true,
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        -- actions
        map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<cr>', { desc = 'Stage Hunk' })
        map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<cr>', { desc = 'Reset Hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage Buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo Stage Hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset Buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview Hunk' })
        map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = 'Blame Line' })
        map('n', '<leader>ht', gs.toggle_current_line_blame, { desc = 'Toggle Blame' })
        map('n', '<leader>hd', gs.diffthis, { desc = "Diff This" })
        map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'Diff Against' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = 'Toggle Deleted' })

        -- text object
        map({ 'o', 'x' }, 'ih', ':<c-u>gitsigns select_hunk<cr>', { desc = 'Select Hunk' })
      end
    }
  end
}
