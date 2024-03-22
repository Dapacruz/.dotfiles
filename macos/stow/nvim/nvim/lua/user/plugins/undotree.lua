return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>u", "<Cmd>UndotreeToggle | UndotreeFocus<CR>")
    end,
}
