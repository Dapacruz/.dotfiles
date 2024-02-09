require "user.plugin-configs.packer"
require "user.options"
require "user.keymap"
require "user.plugin-configs.colorscheme"
require "user.plugin-configs.cmp"
require "user.lsp"
require "user.plugin-configs.telescope"
require "user.plugin-configs.treesitter"
require "user.plugin-configs.autopairs"
require "user.plugin-configs.gitsigns"
require "user.plugin-configs.lualine"
require "user.plugin-configs.symbols_outline"
require "user.plugin-configs.debugging"
require "user.plugin-configs.fugitive"
require "user.plugin-configs.cloak"
require "user.plugin-configs.harpoon"
require "user.plugin-configs.refactoring"
require "user.plugin-configs.trouble"
require "user.plugin-configs.undotree"
require "user.plugin-configs.zenmode"
require "user.plugin-configs.cellular_automation"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Trim leading and trailing whitespace
vim.cmd([[ command! -range=% TrimWhitespace <line1>,<line2>s/^\s\+//e | <line1>,<line2>s/\s\+$//e ]])
vim.cmd([[ command! -range=% TrimWhitespaceTrailing <line1>,<line2>s/\s\+$//e ]])

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local user_group = augroup('user', {})

-- Flash highlight on yank
autocmd('TextYankPost', {
    group = user_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

vim.filetype.add({
    pattern = {
        [".*/playbooks/.*.yml"] = "yaml.ansible"
    }
})

-- Format Go files
autocmd({ "InsertLeave" }, {
    group = user_group,
    pattern = "*.go",
    command = "silent lua vim.lsp.buf.format({async=true})",
})

autocmd({ "BufWritePost" }, {
    group = user_group,
    pattern = "*.go",
    command = "silent! !goimports -w %",
})

autocmd({ "BufWritePost" }, {
    group = user_group,
    pattern = "*.py",
    command = "silent !black --quiet %",
})

autocmd({ "BufEnter", "BufWinEnter", "TabEnter" }, {
    group = user_group,
    pattern = "*.rs",
    callback = function()
        require("lsp_extensions").inlay_hints {}
    end
})

-- Remove trailing whitespace
autocmd({ "BufWritePre" }, {
    group = user_group,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

-- Return to previous line when last closed
autocmd({ "BufRead" }, {
    group = user_group,
    pattern = "*",
    command = [[call setpos(".", getpos("'\""))]],
})
