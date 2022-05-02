require('nvim-lightbulb').setup({
  ignore = { "null-ls" },
})

local group = vim.api.nvim_create_augroup('updateLightbulb', { clear = true })
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, { command = 'lua require("nvim-lightbulb").update_lightbulb()', group = group })
