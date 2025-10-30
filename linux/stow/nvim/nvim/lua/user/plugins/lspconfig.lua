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
    config = function()
        require "user.lsp.configs"
        require("user.lsp.handlers").setup()
    end,
}
