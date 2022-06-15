vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
  xml = false,
  help = false,
  terminal = false,
  dashboard = false,
  packer = false,
  lspinfo = false,
  TelescopePrompt = false,
  TelescopeResults = false,
  typescriptreact = false
}

vim.cmd [[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]]
