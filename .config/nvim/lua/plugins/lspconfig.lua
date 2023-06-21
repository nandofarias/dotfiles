return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'jose-elias-alvarez/nvim-lsp-ts-utils',
    'folke/lsp-colors.nvim',
    {
      'glepnir/lspsaga.nvim',
      config = function()
        require('lspsaga').setup({
          symbol_in_winbar = {
            enable = true,
          }
        })
      end
    },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "dockerls", "elixirls", "erlangls", "grammarly", "graphql", "sqlls", "lua_ls",
        "tsserver", "yamlls", "rust_analyzer", "zls", },
      automatic_installlation = true,
    })

    local lspconfig = require('lspconfig')

    local buf_map = function(bufnr, mode, lhs, rhs, opts)
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
      })
    end

    local format_on_save_group = vim.api.nvim_create_augroup('formatOnSave', {})

    -- For nvim-cmp
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      local opts = { noremap = true, silent = true }

      buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_keymap('n', '<leader>dq', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
      -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

      -- lsp-saga
      buf_set_keymap('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', opts)
      buf_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc ++quiet<cr>', opts)
      -- buf_set_keymap('n', '<leader>e', '<cmd>Lspsaga show_line_diagnostics<cr>', opts)
      -- buf_set_keymap('n', '[d', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
      -- buf_set_keymap('n', ']d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
      -- buf_set_keymap('n', '<C-u>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", {})
      -- buf_set_keymap('n', '<C-d>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", {})
      --
      buf_set_keymap('n', '<leader>bf', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = format_on_save_group, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = format_on_save_group,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
      vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ async = true }) end, {})


      buf_set_keymap('n', '<leader>ca', ':Lspsaga code_action<cr>', opts)
      buf_set_keymap('x', '<leader>ca', ':<c-u>Lspsaga range_code_action<cr>', opts)

      buf_set_keymap('n', '<leader>cr', '<cmd>lua vim.lsp.codelens.run()<CR>', opts)
      buf_set_keymap('n', '<leader>cl', '<cmd>lua vim.lsp.codelens.refresh()<CR>', opts)
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
      on_attach = on_attach
    }


    -- manual lspconfig
    lspconfig.gleam.setup(opts)

    -- mason-lspconfig
    require("mason-lspconfig").setup_handlers {
      ['elixirls'] = function()
        opts.settings = {
          elixirLS = {
            fetchDeps = false,
            dialyzerEnabled = true,
            dialyzerFormat = 'dialyxir_short',
            suggestSpecs = true
          }
        }
        opts.root_dir = function(fname)
          local path = lspconfig.util.path
          local child_or_root_path = lspconfig.util.root_pattern({ "mix.exs", ".git" })(fname)
          local maybe_umbrella_path = lspconfig.util.root_pattern({ "mix.exs" })(
            vim.loop.fs_realpath(path.join({ child_or_root_path, ".." }))
          )

          local has_ancestral_mix_exs_path = vim.startswith(child_or_root_path,
            path.join({ maybe_umbrella_path, "apps" }))
          if maybe_umbrella_path and not has_ancestral_mix_exs_path then
            maybe_umbrella_path = nil
          end

          return maybe_umbrella_path or child_or_root_path or vim.loop.os_homedir()
        end

        lspconfig.elixirls.setup(opts)
      end,

      ['lua_ls'] = function()
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

        lspconfig.lua_ls.setup(opts)
      end,

      ['tsserver'] = function()
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

        lspconfig.tsserver.setup(opts)
      end,

      ['grammarly'] = function()
        opts.init_options = { clientId = 'client_BaDkMgx4X19X9UxxYRCXZo', }
        lspconfig.grammarly.setup(opts)
      end
    }
  end
}
