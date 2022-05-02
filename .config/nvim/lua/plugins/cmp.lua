vim.g.vsnip_snippet_dir = '~/.config/nvim/snippets'

local vimp = require('vimp')
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,

      before = function(_, vim_item)
        return vim_item
      end
    })
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

vimp.imap({ 'expr' }, '<Tab>', "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'")
vimp.smap({ 'expr' }, '<Tab>', "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'")
vimp.imap({ 'expr' }, '<S-Tab>', "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'")
vimp.smap({ 'expr' }, '<S-Tab>', "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'")

-- Missing highlights
vim.cmd [[au VimEnter * hi! link CmpItemAbbr DraculaPurple]]
vim.cmd [[au VimEnter * hi! link CmpItemKind DraculaYellow]]
