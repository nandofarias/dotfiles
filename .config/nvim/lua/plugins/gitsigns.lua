vim.cmd [[ highlight link gitsignscurrentlineblame draculacomment ]]

require('gitsigns').setup {
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 500,
  },
  current_line_blame_opts = {
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
    map('n', ']c', "&diff ? ']c' : '<cmd>gitsigns next_hunk<cr>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>gitsigns prev_hunk<cr>'", {expr=true})

    -- actions
    map({'n', 'v'}, '<leader>hs', ':gitsigns stage_hunk<cr>')
    map({'n', 'v'}, '<leader>hr', ':gitsigns reset_hunk<cr>')
    map('n', '<leader>hs', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hr', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hd', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- text object
    map({'o', 'x'}, 'ih', ':<c-u>gitsigns select_hunk<cr>')
  end
}
