return {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
        "folke/twilight.nvim",
        {
            "xolox/vim-colorscheme-switcher",
            dependencies = "vim-misc",
        },
    },
    config = function()
        local nightfox = require('nightfox')
        local C = require("nightfox.lib.color")
        local palette = require('nightfox.palette').load('nightfox')

        nightfox.setup({
            specs = {
                all = {
                    diff = {
                        text = C(palette.bg1):blend(C(palette.cyan.dim), 0.4):to_css(),
                    },
                },
            },
            options = {
                -- Compiled file's destination location
                compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                compile_file_suffix = "_compiled", -- Compiled file suffix
                transparent = true,    -- Disable setting background
                terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                dim_inactive = false,   -- Non focused panes set to alternative background
                styles = {              -- Style to be applied to different syntax groups
                    comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
                    conditionals = "NONE",
                    constants = "NONE",
                    functions = "italic,bold",
                    keywords = "italic",
                    numbers = "NONE",
                    operators = "NONE",
                    strings = "NONE",
                    types = "italic,bold",
                    variables = "NONE",
                },
                inverse = {             -- Inverse highlight for different types
                    match_paren = false,
                    visual = false,
                    search = false,
                },
            },
        })

        -- setup must be called before loading
        -- vim.cmd("colorscheme nordfox")
        vim.cmd("colorscheme nightfox")
    end
}
