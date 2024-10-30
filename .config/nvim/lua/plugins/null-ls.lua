return {
  "jose-elias-alvarez/null-ls.nvim",

  opts = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require "null-ls"

    local sources = {
      -- Python
      null_ls.builtins.formatting.black,
      null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.diagnostics.ruff,

      -- JavaScript/TypeScript
      null_ls.builtins.formatting.prettierd.with {
        filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
      },
      null_ls.builtins.diagnostics.eslint_d,

      -- Lua
      null_ls.builtins.formatting.stylua,

      -- Shell
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.diagnostics.shellcheck,
    }

    null_ls.setup {
      sources = sources,
      on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { bufnr = bufnr }
            end,
          })
        end
      end,
    }
  end,
}
--
-- return {
--   "jose-elias-alvarez/null-ls.nvim",
--   ft = {"python"},
--
--
--   opts = function()
--     local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--     local null_ls = require("null-ls")
--
--     sources = {
--       null_ls.builtins.diagnostics.black,
--       null_ls.builtins.diagnostics.mypy,
--       null_ls.builtins.diagnostics.ruff,
--     },
--
--     on_attach = function (client, bufnr)
--       if client.supports_method("textDocument/formatting") then
--         vim.api.nvim_create_autocmd("BufWritePre", {
--           group = augroup,
--           buffer = bufnr,
--           callback = function ()gg
--             vim.lsp.buf.format({ bufnr = bufnr })          end
--         })
--       end
--     end
--
--   end
-- }
