local dap = require("dap")
local dapui = require("dapui")
local dap_python = require("dap-python")

dapui.setup()
dap_python.setup("python")

local keyset = vim.keymap.set
local NS = { noremap = true, silent = true }

keyset("n", "<Leader>dbg", dapui.toggle, NS)
keyset("n", "<Leader>dbb", dap.toggle_breakpoint, NS)
keyset("n", "<Leader>dbc", dap.continue, NS)
keyset("n", "<Leader>dbso", dap.step_over, NS)
keyset("n", "<Leader>dbsi", dap.step_into, NS)
