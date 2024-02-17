-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- TODO: Remove
-- Reloads neovim whenever you save the packer.lua file
-- vim.cmd([[
    -- augroup packer_user_config
        -- autocmd!
        -- autocmd BufWritePost packer.lua source <afile> | PackerSync
    -- augroup end
-- ]])

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "ThePrimeagen/vim-be-good"
    use "windwp/nvim-autopairs"
    use "tmhedberg/SimpylFold"
    use "xolox/vim-misc"
    use "tpope/vim-dispatch"
    use "tpope/vim-sensible"
    use "tpope/vim-repeat"
    use "tpope/vim-surround"
    use "tpope/vim-unimpaired"
    use "preservim/nerdcommenter"
    use "thinca/vim-quickrun"
    use "nvim-lua/plenary.nvim"
    use "simrat39/symbols-outline.nvim"
    use "justinmk/vim-sneak"
    use "stefandtw/quickfix-reflector.vim"
    use "wellle/targets.vim"
    use "jremmen/vim-ripgrep"
    use "christoomey/vim-tmux-navigator"
    -- use "vimwiki/vimwiki"
    -- use "github/copilot.vim"
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                highlight = {
                    multiline = false,
                }
            }
        end,
    }
    use "mg979/vim-visual-multi"
    use "szw/vim-maximizer"
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use "theprimeagen/refactoring.nvim"
    use "mbbill/undotree"
    use "folke/zen-mode.nvim"
    use "folke/twilight.nvim"
    use "eandrju/cellular-automaton.nvim"
    use "laytan/cloak.nvim"
    use {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup {
                icons = false,
            }
        end
    }
    use {
        "epwalsh/obsidian.nvim",
        tag = "*",  -- recommended, use latest release instead of latest commit
        requires = {
            -- Required.
            "nvim-lua/plenary.nvim",
        },
    }

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-treesitter/nvim-treesitter-context"

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-symbols.nvim"
    use "nvim-lua/popup.nvim"
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" }

    -- Colorscheme
    use "gruvbox-community/gruvbox"
    use "folke/tokyonight.nvim"
    use "flazz/vim-colorschemes"
    use "xolox/vim-colorscheme-switcher"
    use "EdenEast/nightfox.nvim"
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    -- Completion
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline"
    use "f3fora/cmp-spell"

    -- Snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets"

    -- LSP
    use "neovim/nvim-lspconfig" -- enable native LSP
    use "williamboman/mason.nvim"  -- language server installer
    use "Glench/Vim-Jinja2-Syntax"

    -- Debugging
    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'mfussenegger/nvim-dap-python'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'nvim-telescope/telescope-dap.nvim'

    -- Git
    use "tpope/vim-fugitive"
    use "lewis6991/gitsigns.nvim"

    -- Nerdtree
    use "preservim/nerdtree"
    use "Xuyuanp/nerdtree-git-plugin"
    use "ryanoasis/vim-devicons"
    use "tiagofumo/vim-nerdtree-syntax-highlight"
    use "PhilRunninger/nerdtree-buffer-ops"
    use "PhilRunninger/nerdtree-visual-selection"

    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
