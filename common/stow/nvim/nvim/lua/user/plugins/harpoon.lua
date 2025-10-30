return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        local harpoon  = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "Harpoon: Append to list"})
        vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Toggle quick menu"})

        vim.keymap.set("n", "<A-7>", function() harpoon:list():select(1) end, { desc = "Harpoon: Select first list entry"})
        vim.keymap.set("n", "<A-8>", function() harpoon:list():select(2) end, { desc = "Harpoon: Select second list entry"})
        vim.keymap.set("n", "<A-9>", function() harpoon:list():select(3) end, { desc = "Harpoon: Select third list entry"})
        vim.keymap.set("n", "<A-0>", function() harpoon:list():select(4) end, { desc = "Harpoon: Select fourth list entry"})

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Harpoon: Go to previous list entry"})
        vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Harpoon: Go to next list entry"})
    end,
}
