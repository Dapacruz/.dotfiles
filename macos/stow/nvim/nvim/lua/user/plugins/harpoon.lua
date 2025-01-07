return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        local harpoon  = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "Append to Harpoon list"})
        vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle Harpoon quick menu"})

        vim.keymap.set("n", "<A-7>", function() harpoon:list():select(1) end, { desc = "Select first Harpoon list entry"})
        vim.keymap.set("n", "<A-8>", function() harpoon:list():select(2) end, { desc = "Select second Harpoon list entry"})
        vim.keymap.set("n", "<A-9>", function() harpoon:list():select(3) end, { desc = "Select third Harpoon list entry"})
        vim.keymap.set("n", "<A-0>", function() harpoon:list():select(4) end, { desc = "Select fourth Harpoon list entry"})

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Go to Harpoon previous list entry"})
        vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Go to Harpoon next list entry"})
    end,
}
