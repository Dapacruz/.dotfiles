local opts = { noremap = true, silent = true }

--Shorten function name
local keymap = vim.api.nvim_set_keymap

--Set very magic mode (egrep syntax)
vim.cmd([[
    cnoremap s/ s/\v
    cnoremap g/ g/\v
    nnoremap / /\v
]])

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Turn of search highlights
keymap('n', '<leader>nh', ':nohlsearch<CR>', opts)

--Quick quit command
keymap('n', '<leader>q', ':q<CR>', opts) --Quit all window, opts
keymap('n', '<leader>Q', ':q!<CR>', opts) --Quit all window, opts

--Quick reload LUA config
keymap('n', '<leader>rc', '<cmd>:lua require("user.plugin-configs.telescope").reload()<CR>', opts)

--Telescope
keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
keymap('n', '<leader>fG', '<cmd>lua require("telescope.builtin").git_files()<CR>', opts)
keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts)
keymap('n', '<leader>fk', '<cmd>lua require("telescope.builtin").keymaps()<CR>', opts)
keymap('n', '<leader>fd', '<cmd>lua require("telescope.builtin").diagnostics()<CR>', opts)
keymap('n', '<leader>fs', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', opts)
keymap('n', '<leader>ft', '<cmd>TodoTelescope<CR>', opts)

-- Make file executable
keymap('n', '<leader>fx', '<cmd>!chmod +x %<CR>', opts)

--Navigate buffers
keymap("n", "<S-l>", "<CMD>bnext<CR>", opts)
keymap("n", "<S-h>", "<CMD>bprevious<CR>", opts)

-- window management
keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap("n", "<leader>sx", "<CMD>close<CR>", opts) -- close current split window
keymap("n", "<leader>sbd", "<CMD>bp|bd #<CR>", opts) -- delete current buffer and leave split window
keymap("n", "<leader>so", "<CMD>only<CR>", opts) -- close other split windows

--Resize with arrows
keymap("n", "<M-k>", "<CMD>resize +2<CR>", opts)
keymap("n", "<M-j>", "<CMD>resize -2<CR>", opts)
keymap("n", "<M-h>", "<CMD>vertical resize -2<CR>", opts)
keymap("n", "<M-l>", "<CMD>vertical resize +2<CR>", opts)

--Delete buffer
keymap('n', "<leader>bd", "<CMD>bd<CR>", opts)
keymap('n', "<leader>bD", "<CMD>bd!<CR>", opts)
--Delete all buffers except the active one
keymap('n', "<leader>bo", "<CMD>NERDTreeClose|%bd|e#|bd#<CR>", opts)
keymap('n', "<leader>bO", "<CMD>NERDTreeClose|%bd!|e#|bd#<CR>", opts)
keymap('n', "<leader>bl", "<CMD>b#<CR>", opts)

--Nerdtree
keymap("n", "<leader>e", "<CMD>silent! NERDTreeToggle<CR>", opts)
keymap("n", "<S-f><S-f>", "<CMD>NERDTreeFind<CR>", opts)
--keymap("n", "<leader>f", "<CMD>NERDTreeFocus<CR>", opts)
--keymap("n", "<C-n>", "<CMD>NERDTree<CR>", opts)

--Symbols-Outline
keymap("n", "<C-s>", "<CMD>SymbolsOutline<CR>", opts)

--ToggleTerm
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

--If you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

--Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

--Move text up and down
keymap("v", "<A-j>", "<CMD>m .+1<CR>==", opts)
keymap("v", "<A-k>", "<CMD>m .-2<CR>==", opts)
keymap("x", "<A-j>", "<CMD>move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", "<CMD>move '<-2<CR>gv-gv", opts)

--No clobber paste
keymap("v", "p", '"_dP', opts)