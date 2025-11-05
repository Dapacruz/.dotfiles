return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            update_focused_file = {
                enable = true,
            },
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 35,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        })
        vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "NvimTree: Toggle" })
    end,
}
