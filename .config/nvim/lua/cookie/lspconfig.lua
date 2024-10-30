local nvlsp = require "nvchad.configs.lspconfig"

local lspconfig = require "lspconfig"

lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetype = { "python" },
}
