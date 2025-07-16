return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    'jose-elias-alvarez/nvim-lsp-ts-utils',
    'saghen/blink.cmp',
    {
      'glepnir/lspsaga.nvim',
      config = function()
        require('lspsaga').setup({
          lightbulb = {
            enable = false,
          },
          symbol_in_winbar = {
            enable = true,
          },
          outline = {
            win_width = 50,
            auto_preview = false,
          },
        })
        vim.keymap.set({ 'n', 't' }, '<leader>to', '<cmd>Lspsaga term_toggle<CR>')
        vim.keymap.set({ 'n', 't' }, '<leader>so', '<cmd>Lspsaga outline<CR>')
      end
    },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "dockerls", "lexical", "erlangls", "grammarly", "graphql", "sqlls", "lua_ls",
        "ts_ls", "typos_lsp", "yamlls", "rust_analyzer", "zls", },
      automatic_installlation = true,
      automatic_enable = true,
    })

    local lspconfig = require('lspconfig')

    -- For blink.cmp
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    local on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        local format_on_save_group = vim.api.nvim_create_augroup('formatOnSave', {})

        vim.api.nvim_clear_autocmds({ group = format_on_save_group, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = format_on_save_group,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end

      if client.server_capabilities.code_lens then
        vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
          buffer = bufnr,
          callback = vim.lsp.codelens.refresh,
        })
        vim.lsp.codelens.refresh()
      end
    end

    lspconfig.gleam.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.lexical.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "lexical" },
      filetypes = { 'elixir', 'eelixir', 'heex', 'surface' },
      root_dir = function(fname)
        local matches = vim.fs.find({ 'mix.exs' }, { upward = true, limit = 2, path = fname })
        local child_or_root_path, maybe_umbrella_path = unpack(matches)
        local root_dir = vim.fs.dirname(maybe_umbrella_path or child_or_root_path)

        return root_dir
      end,
      single_file_support = true,
      dialyzer_enabled = true
    })

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
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
    })

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        local ts_utils = require('nvim-lsp-ts-utils')
        ts_utils.setup({})
        ts_utils.setup_client(client)
        vim.keymap.set('n', '<leader>gs', ':TSLspOrganize<CR>', { silent = true, buffer = bufnr })
        vim.keymap.set('n', '<leader>gr', ':TSLspRenameFile<CR>', { silent = true, buffer = bufnr })
        vim.keymap.set('n', '<leader>ga', ':TSLspImportAll<CR>', { silent = true, buffer = bufnr })
        on_attach(client, bufnr)
      end
    })

    lspconfig.grammarly.setup({
      init_options = { clientId = 'client_BaDkMgx4X19X9UxxYRCXZo', },
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { noremap = true, silent = true, buffer = ev.buf }

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, opts)
        -- vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format({ async = true }) end, opts)
        vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ async = true }) end, {})
        vim.keymap.set('n', '<leader>cr', vim.lsp.codelens.run, opts)
        vim.keymap.set('n', '<leader>cl', vim.lsp.codelens.refresh, opts)

        -- lsp-saga
        vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', opts)
        vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc ++quiet<cr>', opts)
        vim.keymap.set('n', '<leader>ca', ':Lspsaga code_action<cr>', opts)
        vim.keymap.set('x', '<leader>ca', ':<c-u>Lspsaga range_code_action<cr>', opts)
      end,
    })
  end
}
