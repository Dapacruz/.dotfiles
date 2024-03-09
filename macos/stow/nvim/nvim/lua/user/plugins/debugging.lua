return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "leoluz/nvim-dap-go",
        "mfussenegger/nvim-dap-python",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
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

        vim.keymap.set("n", "<leader>dc", "<Cmd>lua require('dap').continue()<CR>")
        vim.keymap.set("n", "<leader>dt", "<Cmd>lua require('dap').terminate()<CR>")
        vim.keymap.set("n", "<leader>dso", "<Cmd>lua require('dap').step_over()<CR>")
        vim.keymap.set("n", "<leader>dsi", "<Cmd>lua require('dap').step_into()<CR>")
        vim.keymap.set("n", "<leader>dsO", "<Cmd>lua require('dap').step_out()<CR>")
        vim.keymap.set("n", "<leader>db", "<Cmd>lua require('dap').toggle_breakpoint()<CR>")
        vim.keymap.set("n", "<leader>dB", "<Cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
        vim.keymap.set("n", "<leader>dlp", "<Cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
        vim.keymap.set("n", "<leader>dr", "<Cmd>lua require('dap').repl.toggle()<CR>")
        vim.keymap.set("n", "<leader>du", "<Cmd>lua require('dapui').toggle()<CR>")
        vim.keymap.set("n", "<leader>dT", "<Cmd>lua require('dap-go').debug_test()<CR>")
    end,
}
