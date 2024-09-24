return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gitsigns = require("gitsigns")

        gitsigns.setup {
            signs = {
                vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitSignsAdd' }),
                vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitSignsChange' }),
                vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitSignsDelete' }),
                vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitSignsDelete' }),
                vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitSignsChange' }),
            },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                interval = 1000,
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000,
            preview_config = {
                -- Options passed to nvim_open_win
                border = "single",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end
                map('n', ']h', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, {expr=true})
                map('n', '[h', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, {expr=true})
                map('n', '<leader>ghp', gs.preview_hunk)
                map('n', '<leader>ghs', gs.stage_hunk)
                map('n', '<leader>ghu', gs.undo_stage_hunk)
                map('n', '<leader>ghr', gs.reset_hunk)
                map('n', '<leader>gb', function() gs.blame_line{full=true} end)
                map('n', '<leader>gB', gs.toggle_current_line_blame)
            end
        }
    end,
}
