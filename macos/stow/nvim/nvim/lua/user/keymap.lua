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
keymap("n", "<leader>nh", "<CMD>nohlsearch<CR>", opts)

-- Quick quit command
keymap("n", "<leader>q", "<CMD>q<CR>", opts) --Quit all windows, opts
keymap("n", "<leader>Q", "<CMD>q!<CR>", opts) --Force quit all windows, opts

-- TODO: Remove
-- Quick reload LUA config
-- keymap("n", "<leader>rc", "<CMD>:lua require(user.plugin-configs.telescope).reload()<CR>", opts)

-- Fugitive
keymap("n", "<leader>G", "<CMD>G<CR>", opts)
keymap("n", "<leader>gl", "<CMD>Git log<CR>", opts)
keymap("n", "<leader>glg", "<CMD>Git log --stat<CR>", opts)
keymap("n", "<leader>glgp", "<CMD>Git log --stat -p<CR>", opts)
keymap("n", "<leader>gP", "<CMD>Git push<CR>", opts)
keymap("n", "<leader>gL", "<CMD>Git pull<CR>", opts)
keymap("n", "<leader>gd", "<CMD>Gdiffsplit | normal <C-w>h<CR>", opts)
keymap("n", "<leader>gD", "<CMD>Git difftool<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", "<leader>fg", "<CMD>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<leader>fG", "<CMD>lua require('telescope.builtin').git_files()<CR>", opts)
keymap("n", "<leader>fb", "<CMD>lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", "<leader>fh", "<CMD>lua require('telescope.builtin').help_tags()<CR>", opts)
keymap("n", "<leader>fk", "<CMD>lua require('telescope.builtin').keymaps()<CR>", opts)
keymap("n", "<leader>fD", "<CMD>lua require('telescope.builtin').diagnostics()<CR>", opts)
keymap("n", "<leader>fcc", "<CMD>lua require('telescope.builtin').commands()<CR>", opts)
keymap("n", "<leader>fch", "<CMD>lua require('telescope.builtin').command_history()<CR>", opts)
keymap("n", "<leader>fcs", "<CMD>lua require('telescope.builtin').colorscheme()<CR>", opts)
keymap("n", "<leader>fm", "<CMD>lua require('telescope.builtin').marks()<CR>", opts)
keymap("n", "<leader>fM", "<CMD>lua require('telescope.builtin').man_pages()<CR>", opts)
keymap("n", "<leader>fd", "<CMD>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
keymap("n", "<leader>fss", "<CMD>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)
keymap("n", "<leader>fsh", "<CMD>lua require('telescope.builtin').search_history()<CR>", opts)
keymap("n", "<leader>fS", "<CMD>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", opts)
keymap("n", "<leader>fr", "<CMD>lua require('telescope.builtin').lsp_references()<CR>", opts)
keymap("n", "<leader>fi", "<CMD>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
keymap("n", "<leader>ft", "<CMD>TodoTelescope<CR>", opts)

-- Make file executable
keymap("n", "<leader>fx", "<CMD>!chmod +x %<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<CMD>bnext<CR>", opts)
keymap("n", "<S-h>", "<CMD>bprevious<CR>", opts)

-- window management
keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap("n", "<leader>sx", "<CMD>close<CR>", opts) -- close current split window
keymap("n", "<leader>sbd", "<CMD>bp|bd #<CR>", opts) -- delete current buffer and leave split window
keymap("n", "<leader>so", "<CMD>only<CR>", opts) -- close other split windows
keymap("n", "<leader>sz", "<CMD>MaximizerToggle<CR>", opts) -- maximize/restore current split (vim-maximizer)


-- Resize with arrows
keymap("n", "<M-k>", "<CMD>resize +2<CR>", opts)
keymap("n", "<M-j>", "<CMD>resize -2<CR>", opts)
keymap("n", "<M-h>", "<CMD>vertical resize -2<CR>", opts)
keymap("n", "<M-l>", "<CMD>vertical resize +2<CR>", opts)

-- Delete buffer
keymap("n", "<leader>bd", "<CMD>bd<CR>", opts)
keymap("n", "<leader>bD", "<CMD>bd!<CR>", opts)
-- Delete all buffers except the active one
keymap("n", "<leader>bo", "<CMD>NERDTreeClose|%bd|e#|bd#<CR>", opts)
keymap("n", "<leader>bO", "<CMD>NERDTreeClose|%bd!|e#|bd#<CR>", opts)
keymap("n", "<leader>bm", "<CMD>b#<CR>", opts)

-- Copilot
-- keymap("n", "<leader>cp", "<CMD>Copilot panel<CR>", opts)

-- Nerdtree
keymap("n", "<leader>e", "<CMD>silent! NERDTreeToggle<CR>", opts)
keymap("n", "<S-f><S-f>", "<CMD>NERDTreeFind<CR>", opts)

-- Obsidian
keymap("n", "<leader>oq", "<CMD>ObsidianQuickSwitch<CR>", opts)
keymap("n", "<leader>ot", "<CMD>ObsidianTags<CR>", opts)
keymap("n", "<leader>on", ":ObsidianNew ", { noremap = true, silent = false })
keymap("n", "<leader>or", ":ObsidianRename ", { noremap = true, silent = false })
keymap("n", "<leader>off", "<CMD>ObsidianFollowLink<CR>", opts)
keymap("n", "<leader>ofv", "<CMD>ObsidianFollowLink vsplit<CR>", opts)
keymap("n", "<leader>ofh", "<CMD>ObsidianFollowLink hsplit<CR>", opts)
keymap("n", "<leader>ob", "<CMD>ObsidianBacklinks<CR>", opts)
keymap("n", "<leader>os", "<CMD>ObsidianSearch<CR>", opts)
keymap("n", "<leader>oo", "<CMD>ObsidianOpen<CR>", opts)

-- Symbols-Outline
keymap("n", "<C-s>", "<CMD>SymbolsOutline<CR>", opts)

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

-- If you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

-- ToggleTerm
-- function _G.set_terminal_keymaps()
 -- local opts = {buffer = 0}
 -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
 -- vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
 -- vim.keymap.set("t", "<C-h>", [[<CMD>wincmd h<CR>]], opts)
 -- vim.keymap.set("t", "<C-j>", [[<CMD>wincmd j<CR>]], opts)
 -- vim.keymap.set("t", "<C-k>", [[<CMD>wincmd k<CR>]], opts)
 -- vim.keymap.set("t", "<C-l>", [[<CMD>wincmd l<CR>]], opts)
-- end
