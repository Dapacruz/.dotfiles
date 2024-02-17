return {
    "eandrju/cellular-automaton.nvim",
    config = function()
        vim.keymap.set("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<cr>")
        vim.keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<cr>")
    end
}
