return {
    "eandrju/cellular-automaton.nvim",
    config = function()
        vim.keymap.set("n", "<leader>mir", "<Cmd>CellularAutomaton make_it_rain<CR>")
        vim.keymap.set("n", "<leader>gol", "<Cmd>CellularAutomaton game_of_life<CR>")
    end
}
