return {
  "rcarriga/nvim-dap-ui",
  dependencies = "mfussenegger/nvim-dap",

  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    dapui.setup()
    dap.listener.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listener.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listener.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
