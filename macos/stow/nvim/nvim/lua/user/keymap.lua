local opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, silent = true, expr = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

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

-- Turn off search highlights
keymap("n", "<leader>nh", "<cmd>nohlsearch<cr>", opts)

-- Quick quit command
keymap("n", "<leader>qq", "<cmd>q<cr>", opts) --Quit all windows, opts
keymap("n", "<leader>Q", "<cmd>q!<cr>", opts) --Force quit all windows, opts

-- TODO: Remove
-- Quick reload LUA config
-- keymap("n", "<leader>rc", "<cmd>:lua require(user.plugin-configs.telescope).reload()<cr>", opts)

-- Fugitive
keymap("n", "<leader>G", "<cmd>G<cr>", opts)
keymap("n", "<leader>gl", "<cmd>Git log<cr>", opts)
keymap("n", "<leader>glg", "<cmd>Git log --stat<cr>", opts)
keymap("n", "<leader>glgp", "<cmd>Git log --stat -p<cr>", opts)
keymap("n", "<leader>gP", "<cmd>Git push<cr>", opts)
keymap("n", "<leader>gL", "<cmd>Git pull<cr>", opts)
keymap("n", "<leader>gd", "<cmd>Gdiffsplit | normal <C-w>h<cr>", opts)
keymap("n", "<leader>gD", "<cmd>Git difftool<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fG", "<cmd>lua require('telescope.builtin').git_files()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
keymap("n", "<leader>fk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", opts)
keymap("n", "<leader>fD", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", opts)
keymap("n", "<leader>fcc", "<cmd>lua require('telescope.builtin').commands()<cr>", opts)
keymap("n", "<leader>fch", "<cmd>lua require('telescope.builtin').command_history()<cr>", opts)
keymap("n", "<leader>fcs", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", opts)
keymap("n", "<leader>fm", "<cmd>lua require('telescope.builtin').marks()<cr>", opts)
keymap("n", "<leader>fM", "<cmd>lua require('telescope.builtin').man_pages()<cr>", opts)
keymap("n", "<leader>fd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", opts)
keymap("n", "<leader>fss", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", opts)
keymap("n", "<leader>fsh", "<cmd>lua require('telescope.builtin').search_history()<cr>", opts)
keymap("n", "<leader>fS", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", opts)
keymap("n", "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", opts)
keymap("n", "<leader>fi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", opts)
keymap("n", "<leader>ft", "<cmd>TodoTelescope<cr>", opts)

-- Make file executable
keymap("n", "<leader>fx", "<cmd>!chmod +x %<cr>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<cmd>bnext<cr>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<cr>", opts)

-- window management
keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<cr>", opts) -- close current split window
keymap("n", "<leader>sbd", "<cmd>bp|bd #<cr>", opts) -- delete current buffer and leave split window
keymap("n", "<leader>so", "<cmd>only<cr>", opts) -- close other split windows
keymap("n", "<leader>sz", "<cmd>MaximizerToggle<cr>", opts) -- maximize/restore current split (vim-maximizer)


-- Resize with arrows
keymap("n", "<M-k>", "<cmd>resize +2<cr>", opts)
keymap("n", "<M-j>", "<cmd>resize -2<cr>", opts)
keymap("n", "<M-h>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<M-l>", "<cmd>vertical resize +2<cr>", opts)

-- Delete buffer
keymap("n", "<leader>bd", "<cmd>bd<cr>", opts)
keymap("n", "<leader>bD", "<cmd>bd!<cr>", opts)
-- Delete all buffers except the active one
keymap("n", "<leader>bo", "<cmd>NERDTreeClose|%bd|e#|bd#<cr>", opts)
keymap("n", "<leader>bO", "<cmd>NERDTreeClose|%bd!|e#|bd#<cr>", opts)
keymap("n", "<leader>bm", "<cmd>b#<cr>", opts)

-- Copilot
-- keymap("n", "<leader>cp", "<cmd>Copilot panel<cr>", opts)

-- Obsidian
keymap("n", "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", opts)
keymap("n", "<leader>ot", "<cmd>ObsidianTags<cr>", opts)
keymap("n", "<leader>on", ":ObsidianNew ", { noremap = true, silent = false })
keymap("n", "<leader>or", ":ObsidianRename ", { noremap = true, silent = false })
keymap("n", "<leader>off", "<cmd>ObsidianFollowLink<cr>", opts)
keymap("n", "<leader>ofv", "<cmd>ObsidianFollowLink vsplit<cr>", opts)
keymap("n", "<leader>ofh", "<cmd>ObsidianFollowLink hsplit<cr>", opts)
keymap("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", opts)
keymap("n", "<leader>os", "<cmd>ObsidianSearch<cr>", opts)
keymap("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", opts)

-- Symbols-Outline
keymap("n", "<C-s>", "<cmd>SymbolsOutline<cr>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<S-k>", ":m '<-2<cr>gv=gv", opts)
keymap("v", "<S-j>", ":m '>+1<cr>gv=gv", opts)

-- No clobber paste
keymap("v", "p", '"_dP', opts)

-- Quickfix window toggle
keymap("n", "<leader>qt", "empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<cr>' : ':cclose<CR>'", expr_opts)
keymap("n", "<leader>lt", "empty(filter(getwininfo(), 'v:val.loclist')) ? ':lopen<cr>' : ':lclose<CR>'", expr_opts)

-- If you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

-- ToggleTerm
-- function _G.set_terminal_keymaps()
 -- local opts = {buffer = 0}
 -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
 -- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
 -- vim.keymap.set("t", "<C-h>", [[<cmd>wincmd h<cr>]], opts)
 -- vim.keymap.set("t", "<C-j>", [[<cmd>wincmd j<cr>]], opts)
 -- vim.keymap.set("t", "<C-k>", [[<cmd>wincmd k<cr>]], opts)
 -- vim.keymap.set("t", "<C-l>", [[<cmd>wincmd l<cr>]], opts)
-- end
