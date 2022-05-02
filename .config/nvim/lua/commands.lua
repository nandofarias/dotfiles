local command = vim.api.nvim_create_user_command

command('Q', 'q', {})
command('W', 'w', {})
command('WQ', 'wq', {})
command('Wq', 'wq', {})
