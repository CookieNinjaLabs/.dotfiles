local options = {
  formatters_by_ft = {
    css = { "prettierd" },
    django = { "djlint" },
    elm = { "elm-format" },
    go = { "golines", "gofumpt", "goimports-reviser" },
    html = { "prettierd" },
    javascript = { "prettierd" },
    jinja = { "djlint" },
    json = { "prettierd" },
    lua = { "stylua" },
    markdown = { "prettierd" },
    pyhton = { "isort", "autoflake", "black" },
    typescript = { "prettierd" },
    vue = { "prettierd" },
    yaml = { "prettierd" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
