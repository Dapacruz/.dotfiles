return {
    "cappyzawa/telescope-terraform.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require"telescope".load_extension"terraform"
    end,
}
