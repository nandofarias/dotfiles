local group = vim.api.nvim_create_augroup('updateLightbulb', { clear = true })
vim.api.nvim_create_autocmd('CursorHold', { command = "lua require('nvim-lightbulb').update_lightbulb()", group = group })
vim.api.nvim_create_autocmd('CursorHoldI', { command = "lua require('nvim-lightbulb').update_lightbulb()", group = group })
