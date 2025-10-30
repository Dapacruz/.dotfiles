return {
    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set(
            "n", "<leader>zz", function()
                require("zen-mode").setup {
                    window = {
                        width = 150,
                        options = { }
                    },
                }
                require("zen-mode").toggle()
                vim.wo.wrap = false
                vim.wo.number = true
                vim.wo.rnu = true
                -- ColorMyPencils()
            end, { desc = "Zen Mode: Toggle zen" }
        )


        vim.keymap.set(
            "n", "<leader>zZ", function()
                require("zen-mode").setup {
                    window = {
                        width = 120,
                        options = { }
                    },
                }
                require("zen-mode").toggle()
                vim.wo.wrap = false
                vim.wo.number = false
                vim.wo.rnu = false
                vim.opt.colorcolumn = "0"
                -- ColorMyPencils()
            end, { desc = "Zen Mode: Toggle zen narrow" }
        )
    end,
}
