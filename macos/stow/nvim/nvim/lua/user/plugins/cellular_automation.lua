return {
    "eandrju/cellular-automaton.nvim",
    config = function()
        vim.keymap.set("n", "<leader>mir", "<Cmd>CellularAutomaton make_it_rain<CR>", { desc = "Cellular Automaton: Make it rain" })
        vim.keymap.set("n", "<leader>gol", "<Cmd>CellularAutomaton game_of_life<CR>", { desc = "Cellular Automaton: Game of life" })
    end
}
