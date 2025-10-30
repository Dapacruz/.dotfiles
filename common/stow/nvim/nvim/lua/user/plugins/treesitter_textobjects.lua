return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    enable = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    keymaps = {
                        ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
                        ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
                        ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
                        ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment"},
                        ["aP"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument"},
                        ["iP"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument"},
                        ["ac"] = { query = "@conditional.outer", desc = "Select outer part of a conditional"},
                        ["ic"] = { query = "@conditional.inner", desc = "Select inner part of a conditional"},
                        ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop"},
                        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop"},
                        ["af"] = { query = "@call.outer", desc = "Select outer part of a function call"},
                        ["if"] = { query = "@call.inner", desc = "Select inner part of a function call"},
                        ["aF"] = { query = "@function.outer", desc = "Select outer part of a function definition"},
                        ["iF"] = { query = "@function.inner", desc = "Select inner part of a function definition"},
                        ["aC"] = { query = "@class.outer", desc = "Select outer part of a class"},
                        ["iC"] = { query = "@class.inner", desc = "Select inner part of a class"},
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>nP"] = "@parameter.inner",    -- swap parameters with next
                        ["<leader>nF"] = "@function.outer",    -- swap function with next
                    },
                    swap_previous = {
                        ["<leader>pP"] = "@parameter.inner",    -- swap parameters with prev
                        ["<leader>pF"] = "@function.outer",    -- swap function with prev
                    },
                },
            },
        })
    end
}
