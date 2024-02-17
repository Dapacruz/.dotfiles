return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = "nvim-treesitter/nvim-treesitter-context",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = "all", -- one of "all" or a list of languages
            ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = { "css" }, -- list of language that will be disabled
            },
            autopairs = {
                enable = true,
            },
            indent = { enable = true, disable = { } },
            rainbow = {
                enable = true,
                -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                max_file_lines = nil, -- Do not enable for files with more than n lines, int
                -- colors = {}, -- table of hex strings
                -- termcolors = {} -- table of colour name strings
            },
        })
    end
}
