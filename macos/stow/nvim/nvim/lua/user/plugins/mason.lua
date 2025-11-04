return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "vtsls",
                "cssls",
                "html",
                "gopls",
                "jsonls",
                "yamlls",
                "lua_ls",
                "jedi_language_server",
                "vimls",
                "bashls",
                "ansiblels"
            },
        },
        dependencies = {
            "neovim/nvim-lspconfig", -- enable native LSP
            {
                "williamboman/mason.nvim",  -- language server installer
                config = function()
                    require("mason").setup({
                        automatic_installation = true,
                        ui = {
                            icons = {
                                package_installed = "✓",
                                package_pending = "➜",
                                package_uninstalled = "✗"
                            }
                        }
                    })
                end,
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "ansible-lint",
            },
        },
        dependencies = {
            "mason-org/mason.nvim",
        },
    },
}
