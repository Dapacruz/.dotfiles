return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "WSI",
                path = "~/Obsidian/WSI",
            },
            {
                name = "WSI Network Security",
                path = "~/Obsidian/WSI Network Security",
            },
            {
                name = "Personal",
                path = "~/Obsidian/Personal",
            },
        },
        legacy_commands = false,
        frontmatter = {
            enabled = false,
        }
    }
}
