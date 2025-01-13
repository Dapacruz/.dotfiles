local M = {}

-- TODO: backfill this to template
M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = true,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        max_width = 90,
        max_height = 40,
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
        max_width = 90,
        max_height = 40,
    })
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
        return
    end
    illuminate.on_attach(client)
    -- end
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local tabl_ext = vim.tbl_extend
    local keymap_set_buf = vim.api.nvim_buf_set_keymap
    local keymap_set = vim.keymap.set

    keymap_set_buf(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", tabl_ext('force', opts, { desc = "LSP: Go to definition" }))
    keymap_set_buf(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", tabl_ext('force', opts, { desc = "LSP: Go to declaration" }))
    keymap_set_buf(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", tabl_ext('force', opts, { desc = "LSP: Show hover information about the symbol under the cursor" }))
    keymap_set_buf(bufnr, "n", "gI", "<Cmd>lua vim.lsp.buf.implementation()<CR>", tabl_ext('force', opts, { desc = "LSP: Go to implementation" }))
    keymap_set_buf(bufnr, "n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", tabl_ext('force', opts, { desc = "LSP: Signature help" }))
    keymap_set_buf(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", tabl_ext('force', opts, { desc = "LSP: Get all references" }))
    keymap_set_buf(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", tabl_ext('force', opts, { desc = "LSP: Rename symbol" }))
    keymap_set_buf(bufnr, "n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", tabl_ext('force', opts, { desc = "LSP: Code action" }))
    keymap_set("n", "<leader>D", vim.lsp.buf.type_definition, tabl_ext('force', opts, { desc = "LSP: Get type definition" }))
    keymap_set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, tabl_ext('force', opts, { desc = "LSP: Add workspace folder" }))
    keymap_set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, tabl_ext('force', opts, { desc = "LSP: Remove workspace folder" }))
    keymap_set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, tabl_ext('force', opts, { desc = "LSP: List workspace folders" }))
    keymap_set_buf(
        bufnr,
        "n",
        "<leader><leader>d",
        '<Cmd>lua vim.diagnostic.open_float({ border="rounded" })<CR>',
       tabl_ext('force', opts, { desc = "LSP: Open diagnostic float" })
    )
    keymap_set_buf(bufnr, "n", "[d", '<Cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', tabl_ext('force', opts, { desc = "LSP: Go to previous diagnostic" }))
    keymap_set_buf(bufnr, "n", "]d", '<Cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', tabl_ext('force', opts, { desc = "LSP: Go to next diagnostic" }))
    keymap_set_buf(bufnr, "n", "<leader>dll", "<Cmd>lua vim.diagnostic.setloclist()<CR>", tabl_ext('force', opts, { desc = "LSP: Send all diagnostics to a location list" }))
    keymap_set("n", "<space>di", function()
        if vim.diagnostic.config().virtual_text then
            vim.diagnostic.config({ virtual_text = false })
        else
            vim.diagnostic.config({ virtual_text = true })
        end
    end, tabl_ext('force', opts, { desc = "LSP: Toggle diagnostic virtual text" }))
    vim.cmd([[ command! Format execute "lua vim.lsp.buf.format({async=true})" ]])
    keymap_set("n", "<space>F", function()
        vim.lsp.buf.format { async = true }
    end, vim.tbl_extend("force", opts, { desc = "LSP: Format current buffer" }))
end

M.on_attach = function(client, bufnr)
    -- vim.notify(client.name .. " starting...")
    -- TODO: refactor this into a method that checks if string in list
    if client.name == "tsserver" then
        client.resolved_capabilities.document_formatting = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
