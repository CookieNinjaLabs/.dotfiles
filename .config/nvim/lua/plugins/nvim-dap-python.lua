return {
  "mfussenegger/nvim-dap-python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarringa/nvim-dap-ui",
  },

  config = function(_, opts)
    local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"

    require("dap-python").setup(path)
  end,
}
