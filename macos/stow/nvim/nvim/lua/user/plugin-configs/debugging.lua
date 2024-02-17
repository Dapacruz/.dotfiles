-- local ok, dap = pcall(require, "dap")
-- if not ok then return end

require("dapui").setup()
require("nvim-dap-virtual-text").setup()
require('dap-go').setup()
require('dap-python').setup('/usr/local/bin/python3.10')

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
 -- dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
 -- dapui.close()
-- end

-- Enable the use of VS Code style launch.json files
require('dap.ext.vscode').load_launchjs('.nvim/launch.json', {})

vim.fn.sign_define('DapBreakpoint',{ text ='🔴', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='⇨', texthl ='', linehl ='', numhl =''})

vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>")
vim.keymap.set("n", "<leader>dt", "<cmd>lua require('dap').terminate()<cr>")
vim.keymap.set("n", "<leader>dso", "<cmd>lua require('dap').step_over()<cr>")
vim.keymap.set("n", "<leader>dsi", "<cmd>lua require('dap').step_into()<cr>")
vim.keymap.set("n", "<leader>dsO", "<cmd>lua require('dap').step_out()<cr>")
vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>dB", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
vim.keymap.set("n", "<leader>dlp", "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dap').repl.toggle()<cr>")
vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>")
vim.keymap.set("n", "<leader>dT", "<cmd>lua require('dap-go').debug_test()<cr>")

