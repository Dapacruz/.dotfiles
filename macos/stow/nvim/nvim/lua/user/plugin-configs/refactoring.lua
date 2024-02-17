require('refactoring').setup({})

vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><cmd>lua require('refactoring').refactor('Inline Variable')<cr>]], {noremap = true, silent = true, expr = false})
