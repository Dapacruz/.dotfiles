local servers = { "vtsls", "cssls", "html", "gopls", "jsonls", "yamlls", "lua_ls", "jedi_language_server", "vimls", "bashls", "ansiblels" }

for _, server in pairs(servers) do
    vim.lsp.enable(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
    vim.lsp.config(server, opts)
end
