return {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("trouble").setup {
            icons = false,
        }
        vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, {silent = true, noremap = true})
        vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, {silent = true, noremap = true})
        vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, {silent = true, noremap = true})
        vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, {silent = true, noremap = true})
        vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, {silent = true, noremap = true})
        vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, {silent = true, noremap = true})
    end
}
