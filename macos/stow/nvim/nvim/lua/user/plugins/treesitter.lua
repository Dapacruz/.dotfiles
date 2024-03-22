return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            -- ensure_installed = "all", -- one of "all" or a list of languages
            ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = { "xml" }, -- list of language that will be disabled; disabled XML due to hang on opening a doc
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<M-space>",
                    node_incremental = "<M-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
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
