local options = {
    backup = false,
    bs = "2", -- Make backspace behave like normal again
    cmdheight = 1, --  Give more space for displaying messages
 -- colorcolumn = "120",
    cursorcolumn = false,
    cursorline = false, -- Cursor highlighting
    encoding = "utf-8",
    errorbells = false,
    expandtab = true,
    foldlevel = 99,
    foldmethod = "indent", -- Enable folding
    guicursor = "a:ver1-blinkon100,n:block-blinkon100",
    hidden = true, -- When on a buffer becomes hidden when it is abandoned
    history = 700, -- Useful settings
    hlsearch = false,
    ignorecase = true, -- Make search case insensitive
    incsearch = true,
    list = true, -- Displays a hypen where there is whitespace
    mouse = "a", -- On OSX press ALT and click mouse and backspace
    number = true, -- Show line numbers
    relativenumber = true,
    scrolloff = 15,
    shiftround = true,
    shiftwidth = 4,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    softtabstop = 4,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    tabstop = 4,
    termguicolors = true,
    tw = 79, -- Width of document (used by gd)
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
    undolevels = 700,
    updatetime = 50, -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience
    wrap = false,
    spell = true,
    spelllang = { "en_us" },
    wildmode = "longest:full,full"
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>')
vim.opt.guifont = { "VictorMono Nerd Font:h13" }
vim.o.shell = "/opt/homebrew/bin/zsh"
vim.opt.diffopt:append "vertical" -- Always use vertical windows for diffsplit
vim.opt.matchpairs:append "<:>"
vim.opt.fo:remove "t" -- Don't automatically wrap text when typing
vim.opt.shortmess:append "c" --  Don't pass messages to |ins-completion-menu|
vim.opt.isfname:append "@-@"
vim.opt.clipboard:append "unnamedplus"
-- vim.g.vimwiki_list = {{path = "~/vimwiki/", syntax =  "markdown", ext =  ".md"}}

-- Enable vim-visual-multi mouse mappings
vim.g.VM_mouse_mappings = 1
vim.g.VM_theme = "codedark"

-- nerd-commenter
vim.g.NERDSpaceDelims = 1

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

