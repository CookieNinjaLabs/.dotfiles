return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufReadPost', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'folke/neodev.nvim', opts = {} },
  },
  cmd = { 'LspInfo', 'LspInstall', 'LspUinstall', 'LspStart', 'LspStop', 'LspRestart' },
  config = function()
    local lspconfig = require 'lspconfig'
    local mason_lspconfig = require 'mason-lspconfig'

    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

    -- SourceKit setup (for Swift)
    lspconfig.sourcekit.setup {
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      },
    }

    local swift_lsp = vim.api.nvim_create_augroup('swift_lsp', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'swift' },
      callback = function()
        local root_dir = vim.fs.dirname(vim.fs.find({
          'Package.swift',
          '.git',
        }, { upward = true })[1])
        local client = vim.lsp.start {
          name = 'sourcekit-lsp',
          cmd = { 'sourcekit-lsp' },
          root_dir = root_dir,
        }
        vim.lsp.buf_attach_client(0, client)
      end,
      group = swift_lsp,
    })

    -- Keybindings and common autocommands
    local keymap = vim.keymap
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- Set keybinds
        opts.desc = 'Show LSP references'
        keymap.set('n', 'gR', '<cmd>Telescope lsp_references<CR>', opts)
        opts.desc = 'Go to declaration'
        keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        opts.desc = 'Show LSP definitions'
        keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
        opts.desc = 'Show LSP implementations'
        keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
        opts.desc = 'Show LSP type definitions'
        keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts)
        opts.desc = 'See available code actions'
        keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        opts.desc = 'Smart rename'
        keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        opts.desc = 'Show buffer diagnostics'
        keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts)
        opts.desc = 'Show line diagnostics'
        keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
        opts.desc = 'Go to previous diagnostic'
        keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        opts.desc = 'Go to next diagnostic'
        keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        opts.desc = 'Show documentation for what is under cursor'
        keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        opts.desc = 'Restart LSP'
        keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
      end,
    })

    -- Set diagnostic symbols in the sign column
    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    -- Setup handlers for various LSP servers
    mason_lspconfig.setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
        }
      end,

      -- Svelte server configuration
      ['svelte'] = function()
        lspconfig.svelte.setup {
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd('BufWritePost', {
              pattern = { '*.js', '*.ts' },
              callback = function(ctx)
                client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
              end,
            })
          end,
        }
      end,

      -- -- Typescript-ls server configuration
      -- ['typescript-language-server'] = function()
      --   lspconfig.svelte.setup {
      --     capabilities = capabilities,
      --     on_attach = function(client, bufnr)
      --       vim.api.nvim_create_autocmd('BufWritePost', {
      --         pattern = { '*.js', '*.ts' },
      --         callback = function(ctx)
      --           client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
      --         end,
      --       })
      --     end,
      --   }
      -- end,
      --
      -- -- Vue-ls server configuration
      -- ['vue-language-server'] = function()
      --   lspconfig.svelte.setup {
      --     capabilities = capabilities,
      --     on_attach = function(client, bufnr)
      --       vim.api.nvim_create_autocmd('BufWritePost', {
      --         pattern = { '*.vue' },
      --         callback = function(ctx)
      --           client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
      --         end,
      --       })
      --     end,
      --   }
      -- end,

      -- GraphQL server configuration
      ['graphql'] = function()
        lspconfig.graphql.setup {
          capabilities = capabilities,
          filetypes = { 'graphql', 'gql', 'svelte', 'typescriptreact', 'javascriptreact' },
        }
      end,

      -- Emmet language server configuration
      ['emmet_ls'] = function()
        lspconfig.emmet_ls.setup {
          capabilities = capabilities,
          filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte', 'leaf', 'vue' },
        }
      end,

      -- HTML LSP (vscode-html-language-server) configuration
      -- ['html-lsp'] = function()
      --   lspconfig.html.setup {
      --     cmd = { 'vscode-html-language-server', '--stdio' },
      --     capabilities = capabilities,
      --     filetypes = { 'html', 'leaf' },
      --   }
      -- end,

      -- -- HTML language server configuration
      -- ['html'] = function()
      --   lspconfig.html.setup {
      --     capabilities = capabilities,
      --     filetypes = { 'html', 'leaf' },
      --   }
      -- end,

      -- Go language server (gopls) configuration
      ['gopls'] = function()
        lspconfig.gopls.setup {
          capabilities = capabilities,
          filetypes = { 'go' },
        }
      end,

      -- Python language server (pylsp) configuration
      ['pylsp'] = function()
        lspconfig.pylsp.setup {
          capabilities = capabilities,
          filetypes = { 'python' },
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd('BufWritePost', {
              pattern = { '*.py' },
              callback = function(ctx)
                client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
              end,
            })
          end,
        }
      end,

      -- Lua language server (lua_ls) configuration with special settings
      ['lua_ls'] = function()
        lspconfig.lua_ls.setup {
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' }, -- Make the language server recognize the `vim` global
              },
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        }
      end,

      -- LTEX language server for spell-checking and grammar analysis
      ['ltex'] = function()
        lspconfig.ltex.setup {
          capabilities = capabilities,
          settings = {
            ltex = {
              language = 'en-US', -- Primary language
              additionalRules = {
                motherTongue = 'de', -- Native language
              },
              -- Uncomment and customize the following if you have specific dictionaries
              -- dictionary = {
              --   ['en-US'] = { 'technical_terms.txt' }, -- Custom dictionary file
              --   ['de'] = { 'german_terms.txt' }, -- Another custom dictionary
              -- },
            },
          },
        }
      end,
    }
  end,
}
