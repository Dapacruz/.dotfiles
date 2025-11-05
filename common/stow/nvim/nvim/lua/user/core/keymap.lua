local opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, silent = true, expr = true }

-- Shorten function name
local keymap = vim.keymap.set
local tabl_ext = vim.tbl_extend

-- Set very magic mode (egrep syntax)
vim.cmd([[
    cnoremap s/ s/\v
    cnoremap g/ g/\v
    nnoremap / /\v
]])

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Turn off search highlight
keymap('n', '<Esc>', '<Cmd>nohlsearch<CR>', tabl_ext('force', opts, { desc = "Turn off search highlight" }))

-- Quick quit command
keymap("n", "<leader>qq", "<Cmd>q<CR>", tabl_ext('force', opts, { desc = "Quick quit" })) --Quit all windows, opts
keymap("n", "<leader>Q", "<Cmd>q!<CR>", tabl_ext('force', opts, { desc = "Quck quit all" })) --Force quit all windows, opts

-- Preview unsaved changes
keymap("n", "<leader>U", function()
    require("noice").redirect("write !git diff --no-index % -")
end, tabl_ext('force', opts, { desc = "Preview unsaved changes" }))

-- Fugitive
keymap("n", "<leader>G", "<Cmd>G<CR>", tabl_ext('force', opts, { desc = "Fugitive: Open" }))
keymap("n", "<leader>gl", "<Cmd>Git log<CR>", tabl_ext('force', opts, { desc = "Fugitive: Open Git log" }))
keymap("n", "<leader>glg", "<Cmd>Git log --stat<CR>", tabl_ext('force', opts, { desc = "Fugitive: Open Git log with stats" }))
keymap("n", "<leader>glgp", "<Cmd>Git log --stat -p<CR>", tabl_ext('force', opts, { desc = "Fugitive: Open Git log with stats and changes" }))
keymap("n", "<leader>gP", "<Cmd>Git push<CR>", tabl_ext('force', opts, { desc = "Fugitive: Git push" }))
keymap("n", "<leader>gL", "<Cmd>Git pull<CR>", tabl_ext('force', opts, { desc = "Fugitive: Git pull" }))
keymap("n", "<leader>gd", "<Cmd>Gdiffsplit | normal <C-w>h<CR>", tabl_ext('force', opts, { desc = "Fugitive: Open Git diff split" }))
keymap("n", "<leader>gD", "<Cmd>Git difftool<CR>", tabl_ext('force', opts, { desc = "Fugitive: Open Git diff tool" }))

-- Telescope
keymap("n", "<leader>ff", "<Cmd>lua require('telescope.builtin').find_files()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find files" }))
keymap("n", "<leader>fg", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", tabl_ext('force', opts, { desc = "Telescope: Live grep" }))
keymap("n", "<leader>fG", "<Cmd>lua require('telescope.builtin').git_files()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find Git files" }))
keymap("n", "<leader>fb", "<Cmd>lua require('telescope.builtin').buffers()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find buffers" }))
keymap("n", "<leader>fh", "<Cmd>lua require('telescope.builtin').help_tags()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find help tags" }))
keymap("n", "<leader>fk", "<Cmd>lua require('telescope.builtin').keymaps()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find keymaps" }))
keymap("n", "<leader>fD", "<Cmd>lua require('telescope.builtin').diagnostics()<CR>", tabl_ext('force', opts, { desc = "Telescope: find diagnostics" }))
keymap("n", "<leader>fcc", "<Cmd>lua require('telescope.builtin').commands()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find commands" }))
keymap("n", "<leader>fch", "<Cmd>lua require('telescope.builtin').command_history()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find command history" }))
keymap("n", "<leader>fcs", "<Cmd>lua require('telescope.builtin').colorscheme()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find colorscheme" }))
keymap("n", "<leader>fm", "<Cmd>lua require('telescope.builtin').marks()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find marks" }))
keymap("n", "<leader>fM", "<Cmd>lua require('telescope.builtin').man_pages()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find man pages" }))
keymap("n", "<leader>fd", "<Cmd>lua require('telescope.builtin').lsp_definitions()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find LSP definitions" }))
keymap("n", "<leader>fss", "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find LSP document symbols" }))
keymap("n", "<leader>fsh", "<Cmd>lua require('telescope.builtin').search_history()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find search history" }))
keymap("n", "<leader>fS", "<Cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find LSP workspace symbols" }))
keymap("n", "<leader>fr", "<Cmd>lua require('telescope.builtin').lsp_references()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find LSP references" }))
keymap("n", "<leader>fi", "<Cmd>lua require('telescope.builtin').lsp_implementations()<CR>", tabl_ext('force', opts, { desc = "Telescope: Find LSP implementations" }))
keymap("n", "<leader>fn", "<Cmd>Noice telescope<CR>", tabl_ext('force', opts, { desc = "Telescope: Find Noice messages" }))
keymap("n", "<leader>ft", "<Cmd>TodoTelescope<CR>", tabl_ext('force', opts, { desc = "Telescope: Find todo's" }))

-- Make file executable
keymap("n", "<leader>fx", "<Cmd>!chmod +x %<CR>", tabl_ext('force', opts, { desc = "Make file executable" }))

-- Navigate buffers
keymap("n", "<S-l>", "<Cmd>bnext<CR>", tabl_ext('force', opts, { desc = "Next buffer" }))
keymap("n", "<S-h>", "<Cmd>bprevious<CR>", tabl_ext('force', opts, { desc = "Previous buffer" }))

-- Window management
keymap("n", "<leader>sv", "<C-w>v", tabl_ext('force', opts, { desc = "Split window vertically" }))
keymap("n", "<leader>sh", "<C-w>s", tabl_ext('force', opts, { desc = "Split window horizontally" }))
keymap("n", "<leader>se", "<C-w>=", tabl_ext('force', opts, { desc = "Make split windows equal width & height" }))
keymap("n", "<leader>sx", "<Cmd>close<CR>", tabl_ext('force', opts, { desc = "Close current split window" }))
keymap("n", "<leader>sbd", "<Cmd>bp|bd #<CR>", tabl_ext('force', opts, { desc = "Delete current buffer and leave split window" }))
keymap("n", "<leader>so", "<Cmd>only<CR>", tabl_ext('force', opts, { desc = "Close other split windows" }))
keymap("n", "<leader>sz", "<Cmd>MaximizerToggle<CR>", tabl_ext('force', opts, { desc = "Maximize/restore current split (vim-maximizer)" }))

-- File navigation
keymap("n", "<C-f>", "<C-f>zz", tabl_ext('force', opts, { desc = "Page down and center" }))
keymap("n", "<C-b>", "<C-b>zz", tabl_ext('force', opts, { desc = "Page up and center" }))
keymap("n", "<C-d>", "<C-d>zz", tabl_ext('force', opts, { desc = "Half page down and center" }))
keymap("n", "<C-u>", "<C-u>zz", tabl_ext('force', opts, { desc = "Half page up and center" }))

-- Resize with arrows
keymap("n", "<Up>", "<Cmd>resize +2<CR>", tabl_ext('force', opts, { desc = "Resize window height" }))
keymap("n", "<Down>", "<Cmd>resize -2<CR>", tabl_ext('force', opts, { desc = "Resize window height" }))
keymap("n", "<Left>", "<Cmd>vertical resize -2<CR>", tabl_ext('force', opts, { desc = "Resize window width" }))
keymap("n", "<Right>", "<Cmd>vertical resize +2<CR>", tabl_ext('force', opts, { desc = "Resize window width" }))

-- Buffer management
keymap("n", "<leader>bd", "<Cmd>bd<CR>", tabl_ext('force', opts, { desc = "Delete buffer" }))
keymap("n", "<leader>bD", "<Cmd>bd!<CR>", tabl_ext('force', opts, { desc = "Force delete buffer" }))
keymap("n", "<leader>bo", "<Cmd>%bd|e#|bd#<CR>", tabl_ext('force', opts, { desc = "Delete all buffers except the active one" }))
keymap("n", "<leader>bO", "<Cmd>%bd!|e#|bd#<CR>", tabl_ext('force', opts, { desc = "Force delete all buffers except the active one" }))
keymap("n", "<leader>bm", "<Cmd>b#<CR>", tabl_ext('force', opts, { desc = "Previous buffer" }))

-- Copilot
-- keymap("n", "<leader>cp", "<Cmd>Copilot panel<CR>", tabl_ext('force', opts, { desc = "Copilot: Toggle panel" }))

-- Obsidian
keymap("n", "<leader>of", "<Cmd>ObsidianQuickSwitch<CR>", tabl_ext('force', opts, { desc = "Obsidian: Find files" }))
keymap("n", "<leader>ot", "<Cmd>ObsidianTags<CR>", tabl_ext('force', opts, { desc = "Obsidian: Find tags" }))
keymap("n", "<leader>on", "<Cmd>ObsidianNew<CR>", { noremap = true, silent = false, desc = "Obsidian: Create new file" })
keymap("n", "<leader>or", "<Cmd>ObsidianRename<CR>", { noremap = true, silent = false, desc = "Obsidian: Rename file" })
keymap("n", "<leader>off", "<Cmd>ObsidianFollowLink<CR>", tabl_ext('force', opts, { desc = "Obsidian: Follow link" }))
keymap("n", "<leader>ofv", "<Cmd>ObsidianFollowLink vsplit<CR>", tabl_ext('force', opts, { desc = "Obsidian: Follow link in a vertical split" }))
keymap("n", "<leader>ofh", "<Cmd>ObsidianFollowLink hsplit<CR>", tabl_ext('force', opts, { desc = "Obsidian: Follow link in a horizontal split" }))
keymap("n", "<leader>ob", "<Cmd>ObsidianBacklinks<CR>", tabl_ext('force', opts, { desc = "Obsidian: Find backlinks" }))
keymap("n", "<leader>os", "<Cmd>ObsidianSearch<CR>", tabl_ext('force', opts, { desc = "Obsidian: Live grep files" }))
keymap("n", "<leader>oo", "<Cmd>ObsidianOpen<CR>", tabl_ext('force', opts, { desc = "Obsidian: Open" }))

-- Symbols-Outline
keymap("n", "<C-s>", "<Cmd>SymbolsOutline<CR>", tabl_ext('force', opts, { desc = "Toggle symbol outline" }))

-- Stay in indent mode
keymap("v", ">", ">gv", tabl_ext('force', opts, { desc = "Increase indent" }))
keymap("v", "<", "<gv", tabl_ext('force', opts, { desc = "Decrease indent" }))

-- Move text up and down
keymap("v", "<S-k>", ":m '<-2<CR>gv=gv", tabl_ext('force', opts, { desc = "Move selected text up" }))
keymap("v", "<S-j>", ":m '>+1<CR>gv=gv", tabl_ext('force', opts, { desc = "Move selected text down" }))

-- No clobber paste
keymap("v", "p", '"_dP', tabl_ext('force', opts, { desc = "No clobber paste" }))

-- Quickfix window toggle
keymap("n", "<leader>qt", "empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'", tabl_ext('force', expr_opts, { desc = "Toggle quickfix" }))
keymap("n", "<leader>lt", "empty(filter(getwininfo(), 'v:val.loclist')) ? ':lopen<CR>' : ':lclose<CR>'", tabl_ext('force', expr_opts, { desc = "Toggle location list" }))

-- Save and source file
keymap("n", "<leader><leader>w", "<Cmd>write | source<CR>", tabl_ext('force', opts, { desc = "Save and source file" }))

-- Vim Visual Multi
vim.g.VM_maps = {
    ["Add Cursor Down"] = '<C-M-j>',
    ["Add Cursor Up"] = '<C-M-k>'
}

-- If you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

-- ToggleTerm
-- function _G.set_terminal_keymaps()
 -- local opts = {buffer = 0}
 -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
 -- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
 -- vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
 -- vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
 -- vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
 -- vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
-- end
