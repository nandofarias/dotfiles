return {
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lua',
    'andersevenrud/cmp-tmux',
  },
  config = function()
    vim.g.vsnip_snippet_dir = '~/.config/nvim/snippets'

    local cmp = require('cmp')

    cmp.setup {
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          local lspkind_icons = {
            Text = '',
            Method = '',
            Function = '',
            Constructor = ' ',
            Field = '',
            Variable = '',
            Class = '',
            Interface = '',
            Module = '硫',
            Property = '',
            Unit = ' ',
            Value = '',
            Enum = ' ',
            Keyword = 'ﱃ',
            Snippet = ' ',
            Color = ' ',
            File = ' ',
            Reference = 'Ꮢ',
            Folder = ' ',
            EnumMember = ' ',
            Constant = ' ',
            Struct = ' ',
            Event = '',
            Operator = '',
            TypeParameter = ' ',
          }
          local meta_type = vim_item.kind
          -- load lspkind icons
          vim_item.kind = lspkind_icons[vim_item.kind] .. ''

          vim_item.menu = ({
            buffer = ' Buffer',
            nvim_lsp = meta_type,
            path = ' Path',
            luasnip = ' LuaSnip',
          })[entry.source.name]

          return vim_item
        end,
      },
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.close(),
        ['<C-c>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'tmux' },
        { name = 'buffer',
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end
          }
        },
      }
    }

    local opts = { remap = true, expr = true, replace_keycodes = false }
    -- vim.keymap.set({'i','s'}, '<C-J>',   "vsnip#expandable() ? '<Plug>(vsnip-expand)'         : '<C-J>'",   opts)
    -- vim.keymap.set({'i','s'}, '<C-L>',   "vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-L>'",   opts)
    vim.keymap.set({ 'i', 's' }, '<Tab>', "vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'", opts)
    vim.keymap.set({ 'i', 's' }, '<S-Tab>', "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'", opts)
  end
}
