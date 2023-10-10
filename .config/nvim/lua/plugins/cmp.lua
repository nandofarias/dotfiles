return {
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  dependencies = {
    'onsails/lspkind.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'andersevenrud/cmp-tmux',
  },
  config = function()
    vim.g.vsnip_snippet_dir = '~/.config/nvim/snippets'

    local cmp = require('cmp')
    local lspkind = require('lspkind')

    cmp.setup {
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = lspkind.cmp_format({
          symbol_map = { Copilot = "" },
          before = function(entry, vim_item)
            vim_item.menu = ({
              buffer = ' Buffer',
              nvim_lsp = vim_item.kind,
              path = ' Path',
              luasnip = ' LuaSnip',
            })[entry.source.name]

            return vim_item
          end,
        }),
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
        ['<CR>'] = cmp.mapping.confirm({ select = false}),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      },
      sources = {
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'tmux' },
        {
          name = 'buffer',
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
