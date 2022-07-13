local lspconfig = require('lspconfig')

local buf_map = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
    silent = true,
  })
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) -- For nvim-cmp
local on_attach = function(client, bufnr)
  -- vim-illuminate
  require('illuminate').on_attach(client)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local cmd = vim.api.nvim_command

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>dq', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  -- lsp-saga
  buf_set_keymap('n', '<space>rn', '<cmd>Lspsaga rename<cr>', opts)
  buf_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
  -- buf_set_keymap('n', '<C-u>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", {})
  -- buf_set_keymap('n', '<C-d>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", {})
  --
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
  if client.server_capabilities.documentFormattingProvider then
    local group = vim.api.nvim_create_augroup('formatOnSave', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePre',
      { command = 'lua vim.lsp.buf.format({ timeout_ms = 2000 })', group = group })
  end

  buf_set_keymap('n', '<space>cc', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'ca', '<cmd>Lspsaga code_action<cr>', opts)
  buf_set_keymap('x', 'ca', ':<c-u>Lspsaga range_code_action<cr>', opts)

  buf_set_keymap('n', '<space>cr', '<cmd>lua vim.lsp.codelens.run()<CR>', opts)
  buf_set_keymap('n', '<space>cl', '<cmd>lua vim.lsp.codelens.refresh()<CR>', opts)
  if client.server_capabilities.code_lens then
    cmd [[augroup LspCodelensAutoGroup]]
    cmd [[au!]]
    cmd [[au BufEnter <buffer> lua vim.lsp.codelens.refresh()]]
    cmd [[au CursorHold <buffer> lua vim.lsp.codelens.refresh()]]
    cmd [[au InsertLeave <buffer> lua vim.lsp.codelens.refresh()]]
    cmd [[augroup end]]
    cmd [[hi link LspCodeLens DraculaYellow]]
  end
end

-- nvim-lsp-installer
local lsp_installer = require('nvim-lsp-installer')
lsp_installer.setup {}

for _, server in ipairs(lsp_installer.get_installed_servers()) do
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach
  }

  if server.name == 'elixirls' then
    opts.settings = {
      elixirLS = {
        fetchDeps = true,
        dialyzerEnabled = true,
        dialyzerFormat = 'dialyxir_short',
        suggestSpecs = true,
      }
    }
  end

  if server.name == 'sumneko_lua' then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'hs' }
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            ['/Users/nandofarias/.hammerspoon/Spoons/EmmyLua.spoon/annotations'] = true,
          },
        },
      },
    }
  end

  if server.name == 'tsserver' then
    opts.on_attach = function(client, bufnr)
      client.server_capabilities.document_formatting = false
      client.server_capabilities.document_range_formatting = false
      local ts_utils = require('nvim-lsp-ts-utils')
      ts_utils.setup({})
      ts_utils.setup_client(client)
      buf_map(bufnr, 'n', 'gs', ':TSLspOrganize<CR>')
      buf_map(bufnr, 'n', 'gi', ':TSLspRenameFile<CR>')
      buf_map(bufnr, 'n', 'go', ':TSLspImportAll<CR>')
      on_attach(client, bufnr)
    end
  end

  lspconfig[server.name].setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end
