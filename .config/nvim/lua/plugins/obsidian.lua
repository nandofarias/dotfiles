local vault_dir = '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes'

require('obsidian').setup({
  dir = vault_dir,
  daily_notes = {
    folder = "dailies",
  },
  completion = {
    nvim_cmp = true,
  },
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      local suffix = ""
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
      return tostring(os.time()) .. "-" .. suffix
    end
  end
})

vim.keymap.set('n', '<space>ob', function()
  require('telescope').extensions.file_browser.file_browser({ path = vault_dir })
end)
