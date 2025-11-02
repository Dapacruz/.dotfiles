return {
    "neovim/nvim-lspconfig", -- enable native LSP
    dependencies = {
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
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "vtsls", "cssls", "html", "gopls", "jsonls", "yamlls", "lua_ls", "jedi_language_server", "vimls", "bashls", "ansiblels" },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    config = function()
        require "user.lsp.configs"
        require("user.lsp.handlers").setup()
    end,
}
