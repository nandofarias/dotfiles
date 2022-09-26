local vault_dir = '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes'

require('obsidian').setup({
  dir = vault_dir,
  completion = {
    nvim_cmp = true,
  }
})

vim.keymap.set("n", "<space>ob", function()
  require('telescope').extensions.file_browser.file_browser({ path = vault_dir })
end)
