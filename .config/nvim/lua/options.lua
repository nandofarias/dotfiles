local cache_dir = os.getenv('HOME') .. '/.cache/nvim/'

vim.cmd [[syntax off]]
vim.opt.termguicolors = true
vim.opt.bg = 'dark'
vim.opt.showcmd = true
vim.opt.number = true
vim.opt.cmdheight = 1
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.splitright = true
vim.opt.mouse = 'a'
vim.opt.wrap = true
vim.opt.signcolumn = 'yes'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.hidden = true
vim.opt.undofile = true
vim.opt.directory = cache_dir .. 'swag/'
vim.opt.undodir = cache_dir .. 'undo/'
vim.opt.backupdir = cache_dir .. 'backup/'
vim.opt.viewdir = cache_dir .. 'view/'
vim.opt.spellfile = cache_dir .. 'spell/en.uft-8.add'
vim.opt.spelllang = 'en'
vim.opt.showmatch = true
vim.opt.matchtime = 1
vim.opt.updatetime = 50
vim.opt.timeoutlen = 400
vim.opt.ttimeoutlen = 0
vim.opt.laststatus = 3
vim.opt.fillchars = 'fold: ,vert:│,eob: ,msgsep:‾'
vim.opt.guifont = 'MonoLisa Nerd Font:h15'
vim.opt.foldenable = false
-- vim.opt if for things you would set in vimscript. vim.g is for things you'd let.
vim.g.mapleader = ' '
