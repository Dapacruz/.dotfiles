require "user.plugin-configs.packer"
require "user.options"
require "user.keymap"
require "user.plugin-configs.neogit"
require "user.plugin-configs.colorscheme"
require "user.plugin-configs.cmp"
require "user.lsp"
require "user.plugin-configs.telescope"
require "user.plugin-configs.treesitter"
require "user.plugin-configs.autopairs"
require "user.plugin-configs.gitsigns"
require "user.plugin-configs.lualine"
require "user.plugin-configs.symbols_outline"
require "user.plugin-configs.toggleterm"
require "user.plugin-configs.dashboard"
require "user.plugin-configs.debugging"

-- Source a .vim config
-- vim.cmd("source " .. "~/.config/nvim/lua/user/test.vim")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

--Trim leading and trailing whitespace
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

-- Format Go files
autocmd({ "InsertLeave" }, {
    group = user_group,
    pattern = "*.go",
    command = "Format",
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

--vim.cmd([[
    --augroup mb_filetype
        --autocmd!
        --if !exists("g:vscode")
            --autocmd FileType python nnoremap <buffer> <cr> :silent w<bar>only<bar>vsp<bar>term ipython3 -i %<cr>
            --autocmd InsertLeave *.py call Black()
        --endif
    --augroup end
--]])

--Testing global spelling for comments only; no feature in .8
--autocmd FileType markdown setlocal spell
--autocmd FileType gitcommit setlocal spell

-- autocommands

 --local autocmds = {
     --restore_cursor = {
         --{ 'BufRead', '*', [[call setpos(".", getpos("'\""))]] };
     --};
 --}

 --local function nvim_create_augroups(definitions)
     --for group_name, definition in pairs(definitions) do
         --vim.api.nvim_command('augroup ' .. group_name)
         --vim.api.nvim_command('autocmd!')
         --for _, def in ipairs(definition) do
             --local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
             --vim.api.nvim_command(command)
         --end
         --vim.api.nvim_command('augroup END')
     --end
 --end

 --nvim_create_augroups(autocmds)
 --autocommands END
