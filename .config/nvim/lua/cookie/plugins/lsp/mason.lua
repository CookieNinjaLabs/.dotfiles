return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },

  config = function()
    local mason = require 'mason'

    local mason_lspconfig = require 'mason-lspconfig'

    local mason_tool_installer = require 'mason-tool-installer'

    mason.setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    mason_lspconfig.setup {
      ensure_installed = {
        'html',
        'cssls',
        'eslint',
        'golangci_lint_ls',
        'jinja_lsp',
        'lua_ls',
        'pyright',
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'prettier',
        'stylua',
        'isort',
        'black',
        'pylint',
        'eslint_d',
        'elm-format',
        'djlint',
        'bibtex-tidy',
        'latexindent',
      },
    }
  end,
}
