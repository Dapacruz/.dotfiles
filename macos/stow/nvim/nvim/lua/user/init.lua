require "user.options"
require "user.keymap"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("user.plugins", {
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = false, -- get a notification when changes are found
    },
})

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
    command = "silent !goimports -w %",
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

-- Open Telescope Find Files, on start, when a file is not opened
autocmd({ "VimEnter" }, {
    group = user_group,
    callback = function()
        if vim.fn.argv(0) == "" then
            require("telescope.builtin").find_files()
        end
    end,
})

