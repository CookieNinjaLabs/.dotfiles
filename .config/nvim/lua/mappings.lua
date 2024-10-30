require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- DAP keymap
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <cr>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end, { desc = "Run Python Test" })
