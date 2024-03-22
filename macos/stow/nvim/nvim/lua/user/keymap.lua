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

-- Turn off search highlight
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- Quick quit command
keymap("n", "<leader>qq", "<Cmd>q<CR>", opts) --Quit all windows, opts
keymap("n", "<leader>Q", "<Cmd>q!<CR>", opts) --Force quit all windows, opts

-- Preview unsaved changes
keymap("n", "<leader>U", "<Cmd>UnsavedChanges<CR>", opts)

-- TODO: Remove
-- Quick reload LUA config
-- keymap("n", "<leader>rc", "<Cmd>:lua require(user.plugin-configs.telescope).reload()<CR>", opts)

-- Fugitive
keymap("n", "<leader>G", "<Cmd>G<CR>", opts)
keymap("n", "<leader>gl", "<Cmd>Git log<CR>", opts)
keymap("n", "<leader>glg", "<Cmd>Git log --stat<CR>", opts)
keymap("n", "<leader>glgp", "<Cmd>Git log --stat -p<CR>", opts)
keymap("n", "<leader>gP", "<Cmd>Git push<CR>", opts)
keymap("n", "<leader>gL", "<Cmd>Git pull<CR>", opts)
keymap("n", "<leader>gd", "<Cmd>Gdiffsplit | normal <C-w>h<CR>", opts)
keymap("n", "<leader>gD", "<Cmd>Git difftool<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<Cmd>lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", "<leader>fg", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<leader>fG", "<Cmd>lua require('telescope.builtin').git_files()<CR>", opts)
keymap("n", "<leader>fb", "<Cmd>lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", "<leader>fh", "<Cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
keymap("n", "<leader>fk", "<Cmd>lua require('telescope.builtin').keymaps()<CR>", opts)
keymap("n", "<leader>fD", "<Cmd>lua require('telescope.builtin').diagnostics()<CR>", opts)
keymap("n", "<leader>fcc", "<Cmd>lua require('telescope.builtin').commands()<CR>", opts)
keymap("n", "<leader>fch", "<Cmd>lua require('telescope.builtin').command_history()<CR>", opts)
keymap("n", "<leader>fcs", "<Cmd>lua require('telescope.builtin').colorscheme()<CR>", opts)
keymap("n", "<leader>fm", "<Cmd>lua require('telescope.builtin').marks()<CR>", opts)
keymap("n", "<leader>fM", "<Cmd>lua require('telescope.builtin').man_pages()<CR>", opts)
keymap("n", "<leader>fd", "<Cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
keymap("n", "<leader>fss", "<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)
keymap("n", "<leader>fsh", "<Cmd>lua require('telescope.builtin').search_history()<CR>", opts)
keymap("n", "<leader>fS", "<Cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", opts)
keymap("n", "<leader>fr", "<Cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
keymap("n", "<leader>fi", "<Cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
keymap("n", "<leader>fn", "<Cmd>Telescope notify<CR>", opts)
keymap("n", "<leader>fN", "<Cmd>Noice telescope<CR>", opts)
keymap("n", "<leader>ft", "<Cmd>TodoTelescope<CR>", opts)

-- Make file executable
keymap("n", "<leader>fx", "<Cmd>!chmod +x %<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<Cmd>bnext<CR>", opts)
keymap("n", "<S-h>", "<Cmd>bprevious<CR>", opts)

-- window management
keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap("n", "<leader>sx", "<Cmd>close<CR>", opts) -- close current split window
keymap("n", "<leader>sbd", "<Cmd>bp|bd #<CR>", opts) -- delete current buffer and leave split window
keymap("n", "<leader>so", "<Cmd>only<CR>", opts) -- close other split windows
keymap("n", "<leader>sz", "<Cmd>MaximizerToggle<CR>", opts) -- maximize/restore current split (vim-maximizer)


-- Resize with arrows
keymap("n", "<M-k>", "<Cmd>resize +2<CR>", opts)
keymap("n", "<M-j>", "<Cmd>resize -2<CR>", opts)
keymap("n", "<M-h>", "<Cmd>vertical resize -2<CR>", opts)
keymap("n", "<M-l>", "<Cmd>vertical resize +2<CR>", opts)

-- Delete buffer
keymap("n", "<leader>bd", "<Cmd>bd<CR>", opts)
keymap("n", "<leader>bD", "<Cmd>bd!<CR>", opts)
-- Delete all buffers except the active one
keymap("n", "<leader>bo", "<Cmd>NERDTreeClose|%bd|e#|bd#<CR>", opts)
keymap("n", "<leader>bO", "<Cmd>NERDTreeClose|%bd!|e#|bd#<CR>", opts)
keymap("n", "<leader>bm", "<Cmd>b#<CR>", opts)

-- Copilot
-- keymap("n", "<leader>cp", "<Cmd>Copilot panel<CR>", opts)

-- Obsidian
keymap("n", "<leader>of", "<Cmd>ObsidianQuickSwitch<CR>", opts)
keymap("n", "<leader>ot", "<Cmd>ObsidianTags<CR>", opts)
keymap("n", "<leader>on", ":ObsidianNew ", { noremap = true, silent = false })
keymap("n", "<leader>or", ":ObsidianRename ", { noremap = true, silent = false })
keymap("n", "<leader>off", "<Cmd>ObsidianFollowLink<CR>", opts)
keymap("n", "<leader>ofv", "<Cmd>ObsidianFollowLink vsplit<CR>", opts)
keymap("n", "<leader>ofh", "<Cmd>ObsidianFollowLink hsplit<CR>", opts)
keymap("n", "<leader>ob", "<Cmd>ObsidianBacklinks<CR>", opts)
keymap("n", "<leader>os", "<Cmd>ObsidianSearch<CR>", opts)
keymap("n", "<leader>oo", "<Cmd>ObsidianOpen<CR>", opts)

-- Symbols-Outline
keymap("n", "<C-s>", "<Cmd>SymbolsOutline<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)

-- No clobber paste
keymap("v", "p", '"_dP', opts)

-- Quickfix window toggle
keymap("n", "<leader>qt", "empty(filter(getwininfo(), 'v:val.quickfix')) ? ':copen<CR>' : ':cclose<CR>'", expr_opts)
keymap("n", "<leader>lt", "empty(filter(getwininfo(), 'v:val.loclist')) ? ':lopen<CR>' : ':lclose<CR>'", expr_opts)

-- Save and source file
keymap("n", "<leader><leader>w", "<Cmd>write | source<CR>", opts)

-- If you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

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
