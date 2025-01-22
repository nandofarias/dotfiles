return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
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

    local opts = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- manual lspconfig
    lspconfig.gleam.setup(opts)

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

    -- mason-lspconfig
    require("mason-lspconfig").setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {}
      end,

      ['lexical'] = function()
        lspconfig.lexical.setup({
          default_config = {
            filetypes = { "elixir", "eelixir", "heex" },
            cmd = { "$HOME/.local/share/nvim/mason/packages/lexical/libexec/lexical/bin/start_lexical.sh" },
            root_dir = function(fname)
              return util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
            end,
            settings = {}
          },
        })
      end,

      ['lua_ls'] = function()
        opts.settings = {
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

        lspconfig.lua_ls.setup(opts)
      end,

      ['ts_ls'] = function()
        opts.on_attach = function(client, bufnr)
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

        lspconfig.ts_ls.setup(opts)
      end,

      ['grammarly'] = function()
        opts.init_options = { clientId = 'client_BaDkMgx4X19X9UxxYRCXZo', }
        lspconfig.grammarly.setup(opts)
      end
    }
  end
}
